document.addEventListener('DOMContentLoaded', () => {
    // Global Chart.js Defaults
    if (window.Chart) {
        Chart.defaults.color = '#1e293b';
        Chart.defaults.font.family = "'Outfit', sans-serif";
        Chart.defaults.responsive = true;
        Chart.defaults.maintainAspectRatio = false;
    }

    const apiBase = (window.APP_BASE_URL || "").replace(/\/$/, "");
    let allStudents = [];
    let currentLeaderboardData = [];
    console.log('Admin JS Loaded. Super Admin:', window.IS_SUPER_ADMIN, 'Role:', window.userRole);

    // Logout
    const logoutBtn = document.getElementById('logoutBtn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', async () => {
            const originalHtml = logoutBtn.innerHTML;
            logoutBtn.disabled = true;
            logoutBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Logging out...';

            try {
                await fetch(apiBase + '/auth/logout', {
                    method: 'POST',
                    headers: { 'Accept': 'application/json' }
                });
            } catch (err) {
                console.error('Logout error:', err);
            } finally {
                window.location.replace(apiBase + '/index.php');
            }
        });
    }

    // Chart instances
    let progressChart, scoreChart, branchChart;

    // Data Loaders
    async function refreshDashboard() {
        try {
            console.log('Refreshing Dashboard...');
            const [statsRes, leaderboardRes] = await Promise.all([
                fetch(apiBase + '/admin/stats').then(r => r.json()),
                fetch(apiBase + '/admin/leaderboard').then(r => r.json())
            ]);

            const stats = statsRes;
            const leaderboard = leaderboardRes;
            console.log('Dashboard Data loaded:', { stats, leaderboard });

            // Update Stat Cards
            const statTotal = document.getElementById('statTotal');
            const statEvaluated = document.getElementById('statEvaluated');
            const statTop = document.getElementById('statTop');

            if (statTotal) statTotal.innerText = stats.totalStudents ?? 0;
            if (statEvaluated) statEvaluated.innerText = stats.evaluated ?? 0;
            if (statTop) statTop.innerText = stats.topScore ?? 0;

            // Update Charts
            updateCharts(stats, leaderboard);
        } catch (err) {
            console.error('Error refreshing dashboard:', err);
        }
    }

    function updateCharts(stats, leaderboard) {
        const progressCanvas = document.getElementById('progressChart');
        const scoreCanvas = document.getElementById('scoreChart');
        const branchCanvas = document.getElementById('branchChart');

        // 1. Evaluation Progress (Doughnut)
        if (progressCanvas) {
            if (progressChart) progressChart.destroy();
            progressChart = new Chart(progressCanvas.getContext('2d'), {
                type: 'doughnut',
                data: {
                    labels: ['Evaluated', 'Pending'],
                    datasets: [{
                        data: [stats.evaluated || 0, (stats.totalStudents || 0) - (stats.evaluated || 0)],
                        backgroundColor: ['#6366f1', '#e2e8f0'],
                        borderWidth: 0
                    }]
                },
                options: { cutout: '70%', plugins: { legend: { position: 'bottom' } } }
            });
        }

        // 2. Score Distribution (Bar - Top 3)
        if (scoreCanvas) {
            if (scoreChart) scoreChart.destroy();
            const top3 = leaderboard.slice(0, 3);
            scoreChart = new Chart(scoreCanvas.getContext('2d'), {
                type: 'bar',
                data: {
                    labels: top3.map(s => `${s.name} (${s.department})`),
                    datasets: [{
                        label: 'Final Score',
                        data: top3.map(s => s.score),
                        backgroundColor: ['#6366f1', '#818cf8', '#a5b4fc'],
                        borderRadius: 8,
                        barThickness: 40
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 100,
                            grid: { borderDash: [5, 5] }
                        },
                        x: {
                            grid: { display: false },
                            ticks: {
                                font: { size: 10, weight: '600' }
                            }
                        }
                    },
                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            callbacks: {
                                label: (context) => ` Score: ${context.raw}`
                            }
                        }
                    }
                }
            });
        }

        // 3. Branch Distribution (Bar)
        if (branchCanvas) {
            if (branchChart) branchChart.destroy();
            const branchData = (stats.branches && stats.branches.length > 0) ? stats.branches : [{ department: 'No Data', count: 0 }];
            branchChart = new Chart(branchCanvas.getContext('2d'), {
                type: 'bar',
                data: {
                    labels: branchData.map(b => b.department),
                    datasets: [{
                        label: 'Students',
                        data: branchData.map(b => b.count),
                        backgroundColor: '#8b5cf6',
                        borderRadius: 6
                    }]
                },
                options: {
                    indexAxis: 'y',
                    scales: { x: { beginAtZero: true, ticks: { stepSize: 1 } }, y: { grid: { display: false } } },
                    plugins: { legend: { display: false } }
                }
            });
        }

        // Force layout check
        window.dispatchEvent(new Event('resize'));
    }

    // Initialization
    const overviewSection = document.getElementById('statTotal'); // Unique element for overview
    const studentsContainer = document.getElementById('studentList');
    const performanceContainer = document.getElementById('leaderboardBody');
    const winnerDetailsContainer = document.getElementById('winnerDetails');

    if (overviewSection) {
        refreshDashboard();
    } else if (studentsContainer) {
        loadStudents();
        loadStats();
    } else if (performanceContainer) {
        loadStats();
        loadLeaderboardTable();
        loadWinner();
    } else if (winnerDetailsContainer) {
        loadFullWinnerDetails();
    }

    async function loadFullWinnerDetails() {
        const loading = document.getElementById('loadingWinner');
        const details = document.getElementById('winnerDetails');
        const noWinner = document.getElementById('noWinnerView');

        try {
            const res = await fetch(apiBase + '/admin/winner-details');
            const data = await res.json();

            if (loading) loading.style.display = 'none';

            if (data && data.name) {
                if (details) details.style.display = 'block';

                document.getElementById('wName').innerText = data.name;
                document.getElementById('wRoll').innerText = data.roll_number;
                document.getElementById('wDept').innerText = data.department;
                document.getElementById('wEmail').innerText = data.email;
                document.getElementById('wPhone').innerText = data.contact_number || 'N/A';
                document.getElementById('wBio').innerText = data.bio || 'No bio available.';

                if (data.profile_photo) {
                    const photoUrl = data.profile_photo.startsWith('FILE:')
                        ? `${apiBase}/files/${data.profile_photo.substring(5)}`
                        : data.profile_photo;
                    document.getElementById('wPhoto').src = photoUrl;
                }
            } else {
                if (noWinner) noWinner.style.display = 'block';
            }
        } catch (err) {
            console.error('Error loading winner details:', err);
            if (loading) loading.style.display = 'none';
            if (noWinner) noWinner.style.display = 'block';
        }
    }

    async function loadWinner() {
        try {
            const res = await fetch(apiBase + '/student/winner');
            if (res.ok) {
                const data = await res.json();
                if (data && data.name) {
                    const banner = document.getElementById('winnerAnnouncement');
                    if (banner) {
                        document.getElementById('winnerName').innerText = data.name;
                        document.getElementById('winnerDept').innerText = `${data.department} | ${data.roll_number}`;
                        const photoImg = document.getElementById('winnerPhoto');
                        const placeholder = document.getElementById('winnerPhotoPlaceholder');
                        if (data.profile_photo) {
                            photoImg.src = apiBase + '/files/' + data.profile_photo.replace('FILE:', '');
                            photoImg.style.display = 'block';
                            if (placeholder) placeholder.style.display = 'none';
                        }
                        banner.style.display = 'block';
                    }
                }
            }
        } catch (e) {
            console.error('Error loading winner', e);
        }
    }

    // List initialization handlers

    async function loadStats() {
        try {
            const res = await fetch(apiBase + '/admin/stats');
            const text = await res.text();
            if (!res.ok) throw new Error(text);
            const stats = JSON.parse(text);

            // Update Stat Cards on dashboard if they exist
            const statTotal = document.getElementById('statTotal');
            const statEvaluated = document.getElementById('statEvaluated');
            const statTop = document.getElementById('statTop');

            if (statTotal) statTotal.innerText = stats.totalStudents ?? 0;
            if (statEvaluated) statEvaluated.innerText = stats.evaluated ?? 0;
            if (statTop) statTop.innerText = stats.topScore ?? 0;
        } catch (err) {
            console.error('Error loading stats:', err);
        }
    }

    async function loadStudents() {
        const list = document.getElementById('studentList');
        if (list) {
            list.innerHTML = `
                <div class="skeleton-item"></div>
                <div class="skeleton-item"></div>
                <div class="skeleton-item" style="opacity:0.7"></div>
                <div class="skeleton-item" style="opacity:0.4"></div>
            `;
        }

        try {
            const res = await fetch(apiBase + '/admin/students');
            const text = await res.text();

            if (!res.ok) {
                try {
                    const errObj = JSON.parse(text);
                    throw new Error(errObj.error || `Server error: ${res.status}`);
                } catch (e) {
                    throw new Error(`Server returned ${res.status}: ${text.substring(0, 100)}`);
                }
            }

            const data = JSON.parse(text);

            allStudents = data;
            renderStudentList(allStudents);
        } catch (err) {
            console.error('Error loading students:', err);
            if (list) {
                list.innerHTML = `
                    <div style="padding: 2rem; text-align: center; color: #ef4444; background: #fee2e2; border-radius: 12px; border: 1px solid #fecaca; margin: 1rem;">
                        <i class="fa-solid fa-circle-exclamation" style="font-size: 2rem; margin-bottom: 1rem;"></i>
                        <p style="font-weight: 600; margin-bottom: 0.5rem;">Failed to fetch students</p>
                        <p style="font-size: 0.85rem; opacity: 0.8;">${err.message}</p>
                        <button onclick="location.reload()" style="margin-top: 1rem; padding: 0.5rem 1rem; background: #ef4444; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 600;">
                            <i class="fa-solid fa-arrows-rotate"></i> Try Again
                        </button>
                    </div>
                `;
            }
        }
    }

    function renderStudentList(students) {
        const list = document.getElementById('studentList');
        if (!list) return;
        if (students.length === 0) {
            list.innerHTML = '<p style="padding:1rem; color:var(--text-muted); text-align:center;">No students found.</p>';
            return;
        }

        // Table-style rendering (since previous view was table, we adapt to list view but keeping logic)
        // Check if container is table or list. Based on file content, it seems to be using list-items.
        // We will stick to the existing div structure but add the new badge.

        list.innerHTML = students.map(s => {
            const isEvaluated = s.is_evaluated > 0;
            const isHodSubmitted = s.is_hod_submitted == 1;

            let badge = '';
            let scoreIndicator = '';

            if (isEvaluated) {
                badge = '<span style="background: #10b981; color: white; font-size: 0.7rem; padding: 2px 8px; border-radius: 20px; font-weight: 600;">Evaluated</span>';
                if (s.total_score !== null) {
                    scoreIndicator = `<span style="margin-left:8px; background:#f1f5f9; color:#475569; padding: 2px 6px; border-radius:4px; font-size:0.75rem; border:1px solid #e2e8f0;">Score: <b>${parseFloat(s.total_score).toFixed(2)}</b></span>`;
                }
            } else if (isHodSubmitted) {
                badge = '<span style="background: #3b82f6; color: white; font-size: 0.7rem; padding: 2px 8px; border-radius: 20px; font-weight: 600;">HOD Submitted</span>';
            } else if (s.has_academic_comments == 1) {
                badge = '<span style="background: #f59e0b; color: white; font-size: 0.7rem; padding: 2px 8px; border-radius: 20px; font-weight: 600;">HOD Draft</span>';
            } else {
                badge = '<span class="status-badge status-pending">Pending</span>';
            }

            return `
            <div class="student-item">
                <div style="display: flex; align-items: center; gap: 0.25rem; flex-wrap: wrap; cursor:pointer;" onclick="viewStudent(${s.id})">
                    <span style="font-weight:500;">${s.name}</span>
                    <small style="color:#64748b;">(${s.roll_number})</small>
                    ${badge}
                    ${scoreIndicator}
                </div>
                <div style="display:flex; align-items:center; gap: 0.5rem;">
                    <small>${s.department}</small>
                    ${window.IS_SUPER_ADMIN ? (
                    `
                        <div style="display:flex; align-items:center; gap: 0.5rem;">
                            ${s.is_sent_to_panel == 1
                        ? `<span style="color: #6366f1; font-size: 0.8rem; font-weight: 500;"><i class="fa-solid fa-circle-check"></i> Sent to Panel</span>`
                        : `<button class="btn btn-send-panel" onclick="sendToPanel(${s.id}, event)" style="padding: 4px 8px; font-size: 0.75rem;">
                                     <i class="fa-solid fa-paper-plane"></i> Send to Panel
                                </button>`
                    }
                            <button class="btn btn-reset-submission" onclick="resetSubmission(${s.id}, event)" title="Reset Submission" style="padding: 4px 8px; font-size: 0.75rem; background: #94a3b8; color: white; border: none; border-radius: 4px; cursor: pointer;">
                                <i class="fa-solid fa-rotate-left"></i> Reset
                            </button>
                        </div>
                        `
                ) : ''}
                </div>
            </div>
        `}).join('');
    }

    // Performance Page Logic
    // Performance Page Logic
    async function loadLeaderboardTable(viewType = null) {
        if (!viewType) {
            viewType = window.IS_SUPER_ADMIN ? 'before' : 'after';
        }

        const res = await fetch(apiBase + `/admin/leaderboard?type=${viewType}`);
        const data = await res.json();
        currentLeaderboardData = data;

        const tabs = document.querySelectorAll('.l-tab');
        if (tabs.length > 0) {
            // Re-setup listeners
            tabs.forEach(tab => {
                const newTab = tab.cloneNode(true);
                tab.replaceWith(newTab);
                if (newTab.dataset.type === viewType) newTab.classList.add('active');
                else newTab.classList.remove('active');

                newTab.addEventListener('click', () => {
                    loadLeaderboardTable(newTab.dataset.type);
                });
            });
        }

        applyLeaderboardFilter();
    }

    function applyLeaderboardFilter() {
        const limitSelect = document.getElementById('leaderboardLimit');
        if (!limitSelect) {
            renderLeaderboard(currentLeaderboardData);
            return;
        }

        const limitVal = limitSelect.value;
        let filteredData = [...currentLeaderboardData];

        if (limitVal && limitVal !== 'all') {
            const limit = parseInt(limitVal);
            filteredData = filteredData.slice(0, limit);
        }

        renderLeaderboard(filteredData);
    }

    // Leaderboard Limit Listener
    const limitSelect = document.getElementById('leaderboardLimit');
    if (limitSelect) {
        limitSelect.addEventListener('change', applyLeaderboardFilter);
    }

    function renderLeaderboard(data) {
        const tbody = document.getElementById('leaderboardBody');
        if (!tbody) return;

        tbody.innerHTML = data.map((s, i) => {
            let actionHtml = '';
            // Portfolio PDF Download Button (Super Admin Only)
            const pdfBtn = (window.IS_SUPER_ADMIN === true) ? `<button class="btn-pdf-mini" onclick="downloadStudentPdf(${s.id}, event)" title="Download Portfolio PDF" style="background:#ef4444; color:white; border:none; border-radius:4px; padding:4px 8px; cursor:pointer; margin-right:5px;">
                <i class="fa-solid fa-file-pdf"></i>
            </button>` : '';

            if (window.IS_SUPER_ADMIN === true) {
                if (s.is_best_outgoing == 1) {
                    actionHtml = `<td data-label="Action" style="text-align:center;">
                        ${pdfBtn}
                        <span style="color:#f59e0b; font-weight:bold;"><i class="fa-solid fa-crown"></i> Winner</span>
                    </td>`;
                } else {
                    actionHtml = `<td data-label="Action" style="text-align:center;">
                        ${pdfBtn}
                        <button class="btn-primary" style="padding: 4px 8px; font-size: 0.75rem;" onclick="announceWinner(${s.id}, '${s.name.replace(/'/g, "\\'")}', event)">
                            <i class="fa-solid fa-bullhorn"></i> Announce
                        </button>
                    </td>`;
                }
            } else {
                actionHtml = `<td data-label="Action" style="text-align:center;">-</td>`;
            }

            return `
            <tr>
                <td data-label="Rank">${i + 1}</td>
                <td data-label="Student">${s.name}</td>
                <td data-label="Dept">${s.department}</td>
                <td data-label="Roll No">${s.roll_number}</td>
                <td data-label="Score"><strong>${parseFloat(s.score || 0).toFixed(2)}</strong></td>
                ${actionHtml}
            </tr>
        `}).join('');
    }

    window.announceWinner = async (id, name, event) => {
        event.stopPropagation();
        if (!confirm(`Are you sure you want to announce ${name} as the Best Outgoing Student of the Year?`)) return;

        try {
            const res = await fetch(apiBase + '/admin/announce-winner', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ user_id: id })
            });
            const data = await res.json();
            if (res.ok) {
                alert(data.message);
                loadLeaderboardTable(document.querySelector('.l-tab.active')?.dataset.type);
            } else {
                alert('Error: ' + data.error);
            }
        } catch (err) {
            console.error(err);
            alert('Failed to announce winner');
        }
    };

    // PDF Export
    const downloadPdfBtn = document.getElementById('downloadPdfBtn');
    if (downloadPdfBtn) {
        downloadPdfBtn.addEventListener('click', () => {
            try {
                const jsPDFObj = window.jspdf ? window.jspdf.jsPDF : null;
                if (!jsPDFObj) {
                    alert("PDF library not loaded yet. Please refresh the page.");
                    return;
                }

                const doc = new jsPDFObj('p', 'mm', 'a4');
                const activeTabEl = document.querySelector('.l-tab.active');
                const activeTab = activeTabEl ? activeTabEl.innerText.trim() : 'Overall';
                const tableRows = document.querySelectorAll('#leaderboardBody tr');

                if (tableRows.length === 0) {
                    alert("No data available to export.");
                    return;
                }

                // Prepare data manually
                const headers = [["Rank", "Student Name", "Department", "Roll Number", "Score"]];
                const data = Array.from(tableRows).map(row => {
                    return Array.from(row.cells).map(cell => cell.innerText.trim());
                });

                // PDF Style & Header
                doc.setFont("helvetica", "bold");
                doc.setFontSize(22);
                doc.setTextColor(99, 102, 241); // Indigo
                doc.text("Best Outgoing Student Evaluation", 105, 20, { align: "center" });

                doc.setFontSize(16);
                doc.setTextColor(30, 41, 59); // Slate 800
                doc.text(`${activeTab} Leaderboard`, 105, 30, { align: "center" });

                doc.setFont("helvetica", "normal");
                doc.setFontSize(10);
                doc.setTextColor(100, 116, 139); // Slate 500
                doc.text(`Generated on: ${new Date().toLocaleString()}`, 105, 38, { align: "center" });

                doc.setDrawColor(99, 102, 241);
                doc.line(15, 45, 195, 45);

                // AutoTable with manual data
                doc.autoTable({
                    head: headers,
                    body: data,
                    startY: 55,
                    theme: 'striped',
                    headStyles: {
                        fillColor: [99, 102, 241],
                        textColor: [255, 255, 255],
                        fontStyle: 'bold',
                        fontSize: 11
                    },
                    bodyStyles: { fontSize: 10, textColor: [30, 41, 59] },
                    alternateRowStyles: { fillColor: [248, 250, 252] },
                    margin: { left: 15, right: 15 },
                    styles: { font: 'helvetica', cellPadding: 4 },
                    columnStyles: {
                        4: { halign: 'right', fontStyle: 'bold' } // Score column
                    }
                });

                // Pagination
                const pageCount = doc.internal.getNumberOfPages();
                for (let i = 1; i <= pageCount; i++) {
                    doc.setPage(i);
                    doc.setFontSize(9);
                    doc.setTextColor(150);
                    doc.text(`Page ${i} of ${pageCount} | Best Outgoing Student Awards`, 105, 285, { align: "center" });
                }

                doc.save(`Leaderboard_${activeTab.replace(/\s+/g, '_')}.pdf`);
            } catch (err) {
                console.error("PDF Export Error:", err);
                alert("An error occurred while generating the PDF: " + err.message);
            }
        });
    }

    window.downloadStudentPdf = (id, event) => {
        if (event) event.stopPropagation();
        window.open(`${apiBase}/downloads/generate?user_id=${id}`, '_blank');
    };

    // Global helpers
    window.viewStudent = (id) => {
        if (window.userRole === 'panel') {
            window.location.href = `panel-evaluate.php?id=${id}`;
        } else {
            window.location.href = `evaluate-student.php?id=${id}`;
        }
    };

    window.sendToPanel = async (id, event) => {
        event.stopPropagation();
        if (window.userRole === 'panel') return;
        if (!confirm('Are you sure you want to send this student to the panel?')) return;

        try {
            const res = await fetch('admin/send_to_panel', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ user_id: id })
            });
            const data = await res.json();
            if (res.ok) {
                // Update local state and re-render
                const student = allStudents.find(s => s.id == id);
                if (student) student.is_sent_to_panel = 1;
                renderStudentList(allStudents);

                alert('Student sent to panel successfully');
            } else {
                alert('Error: ' + data.error);
            }
        } catch (err) {
            console.error(err);
            alert('Failed to send to panel');
        }
    };

    // Search
    const searchInput = document.getElementById('studentSearch');
    if (searchInput) {
        searchInput.addEventListener('input', (e) => {
            const term = e.target.value.toLowerCase();
            const filtered = allStudents.filter(s =>
                s.name.toLowerCase().includes(term) ||
                s.roll_number.toLowerCase().includes(term) ||
                s.department.toLowerCase().includes(term)
            );
            renderStudentList(filtered);
        });
    }

    // --- Topper CGPA Modal ---
    window.openTopperModal = async () => {
        const modal = document.getElementById('topperModal');
        const container = document.getElementById('topperInputsContainer');
        if (!modal || !container) return;

        modal.style.display = 'flex';
        container.innerHTML = '<div style="text-align:center;"><i class="fa-solid fa-spinner fa-spin"></i> Loading...</div>';

        try {
            const res = await fetch('admin/toppers');
            const data = await res.json();

            if (data.error) throw new Error(data.error);

            let html = '';
            data.forEach(t => {
                html += `
                    <div class="topper-input-group">
                        <label>${t.department}</label>
                        <input type="number" step="0.01" min="0" max="10" 
                               class="topper-input"
                               name="topper_${t.department}" 
                               data-dept="${t.department}" 
                               value="${parseFloat(t.topper_cgpa).toFixed(2)}" required>
                    </div>
                `;
            });
            container.innerHTML = html;
        } catch (err) {
            container.innerHTML = `<div class="alert alert-danger">${err.message}</div>`;
        }
    };

    window.closeTopperModal = () => {
        const modal = document.getElementById('topperModal');
        if (modal) modal.style.display = 'none';
    };

    const topperForm = document.getElementById('topperForm');
    if (topperForm) {
        topperForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const inputs = topperForm.querySelectorAll('input[type="number"]');
            const payload = [];

            inputs.forEach(inp => {
                payload.push({
                    department: inp.dataset.dept,
                    topper_cgpa: parseFloat(inp.value)
                });
            });

            const submitBtn = topperForm.querySelector('button[type="submit"]');
            const originalText = submitBtn.innerHTML;
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Saving...';

            try {
                const res = await fetch('admin/toppers', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });
                const data = await res.json();
                if (res.ok) {
                    alert('Topper CGPAs updated successfully!');
                    closeTopperModal();
                } else {
                    alert('Error: ' + data.error);
                }
            } catch (err) {
                alert('Failed to save toppers: ' + err.message);
            } finally {
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalText;
            }
        });
    }

});
