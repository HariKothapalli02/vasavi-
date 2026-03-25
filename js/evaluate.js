const apiBase = (window.APP_BASE_URL || "").replace(/\/$/, "");
const IS_SUPER_ADMIN = window.IS_SUPER_ADMIN || false;
// Using window.IS_LOCKED and window.IS_FINAL_LOCKED for state

const getCertHtml = (path) => {
    if (!path) return '<span class="status-badge" style="background:#f1f5f9; color:#94a3b8; font-size:0.75rem; border:1px solid #e2e8f0; padding: 2px 8px; border-radius: 4px;">No certificate</span>';
    const url = `${apiBase}/files/${path.replace('FILE:', '')}`;
    return `<a href="${url}" target="_blank" class="status-badge" style="background:#eff6ff; color:#2563eb; text-decoration:none; display:inline-flex; align-items:center; gap:4px; font-size:0.75rem; border:1px solid #dbeafe; padding: 2px 8px; border-radius: 4px;">
        <i class="fa-solid fa-eye"></i> View
    </a>`;
};

document.addEventListener('DOMContentLoaded', () => {
    // URL Params
    const urlParams = new URLSearchParams(window.location.search);
    const userId = urlParams.get('id');

    if (!userId) {
        alert('No student selected');
        window.location.href = 'admin-dashboard.php';
        return;
    }

    // Load Student Data
    loadStudentDetails(userId);

    async function loadStudentDetails(id) {
        try {
            const controller = new AbortController();
            const timeoutId = setTimeout(() => controller.abort(), 10000); // 10s timeout

            const res = await fetch(apiBase + `/admin/students/${id}`, {
                signal: controller.signal
            }).finally(() => clearTimeout(timeoutId));

            if (!res.ok) {
                const text = await res.text();
                try {
                    const errObj = JSON.parse(text);
                    throw new Error(errObj.error || `Server error: ${res.status}`);
                } catch (e) {
                    if (e instanceof SyntaxError) {
                        throw new Error(`Server returned non-JSON (${res.status}): ${text.substring(0, 100)}...`);
                    }
                    throw e;
                }
            }

            const data = await res.json();

            if (!data || !data.user) {
                throw new Error('Invalid data: User record missing');
            }

            // Global Locked Status
            window.IS_LOCKED = data.academic && data.academic.is_hod_submitted == 1;
            window.IS_FINAL_LOCKED = data.finalScore && data.finalScore.is_final_submitted == 1;

            // Populate Header
            const nameEl = document.getElementById('studentName');
            if (nameEl) nameEl.innerText = data.user.name || 'Unknown';

            const metaEl = document.getElementById('studentMeta');
            if (metaEl) metaEl.innerText = `${data.user.roll_number || '-'} | ${data.user.department || '-'}`;

            const evalUserIdEl = document.getElementById('evalUserId');
            if (evalUserIdEl) evalUserIdEl.value = data.user.id;

            // Set Avatar
            const avatarEl = document.getElementById('studentAvatar');
            if (avatarEl) {
                if (data.user.profile_photo && typeof data.user.profile_photo === 'string') {
                    const photoUrl = data.user.profile_photo.startsWith('FILE:')
                        ? `${apiBase}/files/${data.user.profile_photo.replace('FILE:', '')}`
                        : (data.user.profile_photo.startsWith('http') ? data.user.profile_photo : `${apiBase}/files/${data.user.profile_photo}`);
                    avatarEl.innerHTML = `<img src="${photoUrl}" alt="Profile" style="width:100%; height:100%; object-fit:cover;" onerror="this.onerror=null;this.src='https://cdn-icons-png.flaticon.com/512/1077/1077114.png';">`;
                } else {
                    const initials = (data.user.name || 'S').split(' ').filter(n => n).map(n => n[0]).join('').substring(0, 2).toUpperCase();
                    avatarEl.innerHTML = `<div style="font-weight:bold; color:var(--primary-color);">${initials || 'S'}</div>`;
                }
            }

            // Render Submissions (Left Column)
            try {
                renderSubmissions(data);
            } catch (renderErr) {
                console.error(renderErr);
                document.getElementById('submissionDetails').innerHTML = `<div class="alert alert-danger">Error rendering details: ${renderErr.message}</div>`;
            }

            // Pre-fill Scores (Right Column) & Comments
            try {
                prefillData(data);
            } catch (scoreErr) {
                console.error(scoreErr);
            }

            // Recalculate totals (Only for Super Admin)
            if (IS_SUPER_ADMIN) {
                updateCategoryTotals();
            }

        } catch (error) {
            console.error("Load Error:", error);
            const errorHtml = `<div style="text-align:center; padding:2rem; color:#dc2626;">
                <i class="fa-solid fa-triangle-exclamation fa-2x"></i>
                <h3>Failed to load student</h3>
                <p>${error.message}</p>
                <button onclick="window.location.reload()" class="btn-secondary" style="margin-top:1rem;">Retry</button>
            </div>`;

            const detailsEl = document.getElementById('submissionDetails');
            if (detailsEl) detailsEl.innerHTML = errorHtml;

            document.getElementById('studentName').innerText = "Error";
            document.getElementById('studentMeta').innerText = "Failed to load";
        }
    }

    function renderSubmissions(data) {
        const academic = data.academic || {};
        const getSGPA = (i) => academic[`sgpa_sem${i}`] || '-';
        const safeArr = (arr) => Array.isArray(arr) ? arr : [];

        let content = `<h4 style="margin-bottom:1rem;">Academic Details</h4>`;

        // 1. Overall Performance (SGPA Grid & CGPA) - No Comments
        content += `<div class="list-item-card" style="margin-bottom: 1rem;">
            <p style="margin:0; font-weight:bold; margin-bottom:10px;">Semester Performance (SGPA)</p>
            <div class="responsive-sgpa-grid" style="margin-bottom: 15px;">
                ${[1, 2, 3, 4, 5, 6, 7].map(i => `
                    <div style="background:#f8fafc; padding:8px 4px; border-radius:6px; text-align:center; border: 1px solid #f1f5f9;">
                        <small style="color:#64748b; font-size:0.75rem; display:block; margin-bottom:2px;">Sem ${i}</small>
                        <span style="font-weight:bold; color:#334155; font-size:1rem;">${getSGPA(i)}</span>
                    </div>
                `).join('')}
            </div>
            <div style="background:#e0e7ff; padding:10px; border-radius:6px; border:1px solid #c7d2fe; display:flex; justify-content:space-between; align-items:center;">
                <span style="font-weight:bold; color:#3730a3;">Overall CGPA</span>
                <span style="font-weight:bold; font-size:1.1rem; color:#312e81;">${academic.cgpa || 'N/A'}</span>
            </div>
        </div>`;

        // 2. Honours/Minors
        const honourText = (() => {
            const raw = academic.honours_minors;
            if (!raw || raw === 'No') return 'None';
            try {
                if (raw.trim().startsWith('{')) {
                    const parsed = JSON.parse(raw);
                    if (parsed.courses && Array.isArray(parsed.courses)) {
                        return `<strong>${parsed.type || 'Honours'}:</strong><br>` + parsed.courses.map(c => {
                            return `<div style="margin-bottom:5px; display:flex; align-items:center;">
                                <span style="flex:1">• ${c.name || 'Course'}</span>
                                ${getCertHtml(c.certificate_path)}
                            </div>`;
                        }).join('');
                    }
                }
            } catch (e) { return raw; }
            return raw;
        })();

        const hasHonours = honourText !== 'None' && honourText !== 'No' && honourText !== 'N/A';
        content += `<div class="list-item-card" style="margin-bottom: 1rem;">
            <p style="margin:0; font-weight:bold;">Honours / Minors</p>
            <div style="margin-bottom:10px;">${honourText}</div>
            ${hasHonours ? `
            <div style="margin-top: 10px;">
                <label style="font-size:0.85rem; font-weight:600; color:#475569; display:block; margin-bottom:5px;">HOD Comments <span style="color:#ef4444;">*</span></label>
                <textarea class="form-control item-comment-input" data-id="academic_honours" data-type="academic_honours" rows="2" placeholder="Required: Honours/Minors Comments..." style="width:100%; font-size:0.9rem; padding:8px; border:1px solid #cbd5e1;" ${IS_SUPER_ADMIN || window.IS_LOCKED ? 'readonly' : ''}>${academic.honours_minors_comments || ''}</textarea>
            </div>` : ''}
        </div>`;

        // 3. Competitive Exams
        const examText = (() => {
            const raw = academic.competitive_exams;
            if (!raw || raw === 'No' || raw === 'N/A') return 'None';

            // Try to parse as JSON if it looks like an array
            if (typeof raw === 'string' && raw.trim().startsWith('[')) {
                try {
                    const parsed = JSON.parse(raw);
                    if (Array.isArray(parsed)) {
                        return parsed.map(e => {
                            return `<div style="margin-bottom:8px; display:flex; align-items:center;">
                                <span style="flex:1">• <strong>${e.name}</strong> (Score: ${e.score})</span>
                                ${getCertHtml(e.certificate_path)}
                            </div>`;
                        }).join('');
                    }
                } catch (e) {
                    console.error("Error parsing competitive_exams JSON:", e, raw);
                }
            }

            // Fallback for old comma-separated format
            if (typeof raw === 'string' && raw.includes(':')) {
                return raw.split(',').map(item => `<div>• ${item.trim()}</div>`).join('');
            }

            return raw;
        })();

        const hasExams = examText !== 'None';
        content += `<div class="list-item-card" style="margin-bottom: 1rem;">
            <p style="margin:0; font-weight:bold; margin-bottom:10px;">Competitive Exams</p>
            <div style="font-size:0.95rem;">${examText}</div>
             ${hasExams ? `
             <div style="margin-top: 15px;">
                <label style="font-size:0.85rem; font-weight:600; color:#475569; display:block; margin-bottom:5px;">HOD Comments <span style="color:#ef4444;">*</span></label>
                <textarea class="form-control item-comment-input" data-id="academic_exams" data-type="academic_exams" rows="2" placeholder="Required: Competitive Exams Comments..." style="width:100%; font-size:0.9rem; padding:8px; border:1px solid #cbd5e1;" ${IS_SUPER_ADMIN || window.IS_LOCKED ? 'readonly' : ''}>${academic.competitive_exams_comments || ''}</textarea>
            </div>` : ''}
        </div>`;

        const coItems = safeArr(data.coCurricular);
        const extraItems = safeArr(data.extracurricular);

        // Group Co-Curricular
        const papers = coItems.filter(i => i.activity_type === 'Paper Publications');
        const interCollege = coItems.filter(i => i.activity_type === 'Inter-College Activity');
        const intraDept = coItems.filter(i => i.activity_type === 'Intra-Department Winner');
        const seminars = coItems.filter(i => i.activity_type === 'Seminars Delivered');
        const classRep = coItems.filter(i => i.activity_type === 'Class Representative');
        const membership = coItems.filter(i => i.activity_type === 'Professional Body Membership');
        const moocs = coItems.filter(i => i.activity_type === 'MOOCs Certification');
        const internships = coItems.filter(i => i.activity_type === 'Internship/Consultancy');
        const awards = coItems.filter(i => i.activity_type === 'Award/Contribution');

        // Group Extracurricular
        const uniTeam = extraItems.filter(i => i.activity_type === 'University Team Selection');
        const within = extraItems.filter(i => i.activity_type === 'Within College Activity');
        const outside = extraItems.filter(i => i.activity_type === 'Outside College Activity');
        const tech = extraItems.filter(i => i.activity_type === 'Tech Fest Coordinator');
        const otherCoord = extraItems.filter(i => i.activity_type === 'Other Coordinator');
        const committee = extraItems.filter(i => i.activity_type === 'Committee Member');
        const nss = extraItems.filter(i => i.activity_type === 'NSS/Social Service');
        const extAwards = extraItems.filter(i => i.activity_type === 'Extracurricular Award');


        const renderItem = (label, items, typeStr) => {
            if (items.length === 0) return '';
            let html = `<h4 class="mt-4">${label} (${items.length})</h4>`;
            items.forEach(c => {
                html += `<div class="list-item-card" style="margin-bottom: 1rem;">
                    <div style="display: flex; justify-content: space-between; align-items: start;">
                        <div>
                            <p style="margin:0; font-weight:bold;">${c.title || c.name || 'Untitled'}</p>
                            ${c.level ? `<small class="text-muted d-block">${c.level}</small>` : ''}
                            ${c.description ? `<small class="text-muted d-block">${c.description}</small>` : ''}
                            <div style="margin-top:5px;">${getCertHtml(c.certificate_path)}</div>
                        </div>
                        ${IS_SUPER_ADMIN ? `
                        <div style="display: flex; align-items: center; gap: 10px;">
                            <label style="font-size: 0.8rem;">Marks:</label>
                            <input type="number" step="0.1" class="item-score ${typeStr}-score" data-id="${c.id}" value="${c.score || 0}" style="width: 70px; padding: 5px; border-radius:5px; border:1px solid #ddd;">
                        </div>` : ''}
                    </div>
                    <div style="margin-top: 10px;">
                        <label style="font-size:0.85rem; font-weight:600; color:#475569; display:block; margin-bottom:5px;">HOD Comments <span style="color:#ef4444;">*</span></label>
                        <textarea class="form-control item-comment-input" data-id="${c.id}" data-type="${typeStr}" data-label="${c.title || c.name || label}" rows="1" placeholder="Required: Details review comments..." style="width:100%; font-size:0.9rem; padding:8px; border:1px solid #cbd5e1;" ${IS_SUPER_ADMIN || window.IS_LOCKED ? 'readonly' : ''}>${c.hod_comments || ''}</textarea>
                    </div>
                </div>`;
            });
            return html;
        };

        if (coItems.length > 0) {
            content += `<h3 style="margin-top:2.5rem; padding-bottom:0.5rem; border-bottom:2px solid #e2e8f0; color:var(--primary-color);"><i class="fa-solid fa-medal"></i> Co-Curricular Activities</h3>`;
        }

        content += renderItem("Paper Publications", papers, "co");
        content += renderItem("Inter-College Activity", interCollege, "co");
        content += renderItem("Intra-Department Winner", intraDept, "co");
        content += renderItem("Seminars Delivered", seminars, "co");
        content += renderItem("Class Representative", classRep, "co");
        content += renderItem("Professional Body Membership", membership, "co");
        content += renderItem("MOOCs Certification", moocs, "co");
        content += renderItem("Internship/Consultancy", internships, "co");
        content += renderItem("Awards / Significant Contributions", awards, "co");

        if (extraItems.length > 0) {
            content += `<h3 style="margin-top:2.5rem; padding-bottom:0.5rem; border-bottom:2px solid #e2e8f0; color:var(--primary-color);"><i class="fa-solid fa-futbol"></i> Extracurricular Activities</h3>`;
        }

        content += renderItem("University Team Selection", uniTeam, "extra");
        content += renderItem("Within College Activities", within, "extra");
        content += renderItem("Outside College Activities", outside, "extra");
        content += renderItem("Tech Fest Coordinators", tech, "extra");
        content += renderItem("Other Coordinators", otherCoord, "extra");
        content += renderItem("Committee Members", committee, "extra");
        content += renderItem("NSS / Social Service", nss, "extra");
        content += renderItem("Extracurricular Awards", extAwards, "extra");

        // Recommendation
        if (data.user.recommendation_letter_path) {
            const recPath = `${apiBase}/files/${data.user.recommendation_letter_path.replace('FILE:', '')}`;
            content += `<h4 class="mt-4">Recommendation Letter</h4>
             <div class="list-item-card">
                 <p style="margin-bottom:0.5rem;">Uploaded Document:</p>
                 <a href="${recPath}" target="_blank" class="text-primary btn-outline" style="text-decoration:none; display:inline-flex; align-items:center; gap:0.5rem; padding: 5px 10px; border:1px solid var(--primary-color); border-radius:5px;">
                    <i class="fa-solid fa-file-alt"></i> View Recommendation Letter
                 </a>
             </div>`;
        }

        // Declaration
        if (data.user.declaration_place) {
            content += `<h4 class="mt-4">Declaration</h4>
             <div class="list-item-card">
                <p><strong>Place:</strong> ${data.user.declaration_place}</p>
                <p><strong>Date:</strong> ${data.user.declaration_date}</p>
                <div style="margin-top:10px;">
                    <strong>Signature:</strong><br>
                    ${data.user.signature_path ?
                    `<img src="${apiBase}/files/${data.user.signature_path.replace('FILE:', '')}" alt="Signature" style="max-height:80px; border:1px solid #ddd; padding:5px; margin-top:5px;">`
                    : '<span class="text-muted">No signature uploaded</span>'}
                </div>
             </div>`;
        }

        // Interview Breakdown
        if (data.interview && data.interview.length > 0) {
            content += `<h4 class="mt-4">Interview Assessment Breakdown</h4>
            <div class="list-item-card" style="margin-bottom: 1rem;">
                <table class="table table-sm" style="margin:0;">
                    <thead>
                        <tr>
                            <th>Panel Member</th>
                            <th style="text-align:right;">Score</th>
                        </tr>
                    </thead>
                    <tbody>
                        ${data.interview.map(im => `
                            <tr>
                                <td>${im.panel_name || 'Panel Member'}</td>
                                <td style="text-align:right; font-weight:bold;">${parseFloat(im.score).toFixed(1)}</td>
                            </tr>
                        `).join('')}
                    </tbody>
                    <tfoot>
                        <tr style="border-top: 2px solid #e2e8f0;">
                            <td><strong>Average Interview Score</strong></td>
                            <td style="text-align:right; font-weight:bold; color:var(--primary-color); font-size:1.1rem;">
                                ${(data.finalScore?.interview_score || 0)}
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>`;
        } else if (IS_SUPER_ADMIN) {
            content += `<h4 class="mt-4">Interview Assessment</h4>
            <div class="list-item-card" style="margin-bottom: 1rem; color:var(--text-muted); font-style:italic;">
                No interview marks recorded yet.
            </div>`;
        }

        // Inject Content
        const detailsEl = document.getElementById('submissionDetails');
        if (detailsEl) {
            detailsEl.innerHTML = content;
        }

        // Attach Listeners for scoring (only if Super Admin)
        if (IS_SUPER_ADMIN) {
            document.querySelectorAll('.item-score').forEach(input => {
                input.addEventListener('input', updateCategoryTotals);
            });
        }
    }

    function updateCategoryTotals() {
        if (!IS_SUPER_ADMIN) return;

        let coTotal = 0;
        document.querySelectorAll('.co-score').forEach(i => coTotal += parseFloat(i.value) || 0);

        // Show sum of individual items
        document.getElementById('valCoSum').innerText = coTotal.toFixed(1);

        // Cap total at 15
        const cappedCoTotal = Math.min(coTotal, 15);
        document.getElementById('scCo').value = cappedCoTotal;
        document.getElementById('valCo').innerText = cappedCoTotal.toFixed(1);


        let extraTotal = 0;
        document.querySelectorAll('.extra-score').forEach(i => extraTotal += parseFloat(i.value) || 0);

        // Show sum of individual items
        document.getElementById('valExtraSum').innerText = extraTotal.toFixed(1);

        // Cap total at 15
        const cappedExtraTotal = Math.min(extraTotal, 15);
        document.getElementById('scExtra').value = cappedExtraTotal;
        document.getElementById('valExtra').innerText = cappedExtraTotal.toFixed(1);
    }

    function prefillData(data) {
        const isActuallyLocked = IS_SUPER_ADMIN ? window.IS_FINAL_LOCKED : window.IS_LOCKED;

        const setScore = (id, valId, value) => {
            if (!IS_SUPER_ADMIN) return;
            const val = value || 0;
            const el = document.getElementById(id);
            if (el) {
                el.value = val;
                if (isActuallyLocked) el.disabled = true;
            }
            const valEl = document.getElementById(valId);
            if (valEl) valEl.innerText = val;
        };

        const scores = data.finalScore || {};
        const acad = data.academic || {};

        // Prefill General Academic Comments
        const commentsAcad = document.getElementById('txtAcademicComments');
        if (commentsAcad) commentsAcad.value = acad.academic_comments || '';

        const commentsHonours = document.getElementById('txtHonoursMinorsComments');
        if (commentsHonours) commentsHonours.value = acad.honours_minors_comments || '';

        if (IS_SUPER_ADMIN) {
            // Calculate Academic CGPA Score automatically
            let topperCgpa = parseFloat(data.user.topper_cgpa);
            if (isNaN(topperCgpa) || topperCgpa <= 0) topperCgpa = 10.0;

            let studentCgpa = parseFloat(acad.cgpa);
            if (isNaN(studentCgpa)) studentCgpa = 0;

            let calculatedScore = (studentCgpa / topperCgpa) * 55;
            calculatedScore = Math.min(Math.max(calculatedScore, 0), 55);

            // Format to 2 decimal places for display as string
            const scoreStr = calculatedScore.toFixed(2);

            console.log(`CGPA Calculation: (${studentCgpa} / ${topperCgpa}) * 55 = ${calculatedScore} -> ${scoreStr}`);

            const formulaText = document.getElementById('cgpaFormulaText');
            if (formulaText) {
                formulaText.innerHTML = `Formula: (${studentCgpa.toFixed(2)} / ${topperCgpa.toFixed(2)}) × 55`;
            }

            // Explicitly set the CGPA score
            setScore('scAcademicCGPA', 'valAcademicCGPA', scoreStr);

            // Prefill other scores from DB
            setScore('scAcademicHonours', 'valAcademicHonours', acad.honours_score || 0);
            setScore('scAcademicExams', 'valAcademicExams', acad.exams_score || 0);
            setScore('scCo', 'valCo', scores.co_curricular_score || 0);
            setScore('scExtra', 'valExtra', scores.extracurricular_score || 0);

            if (window.IS_FINAL_LOCKED) {
                const finalSect = document.getElementById('finalSubmitSection');
                if (finalSect) finalSect.style.display = 'none';
                const lockAlert = document.getElementById('superAdminLockAlert');
                if (lockAlert) lockAlert.classList.remove('hidden');

                const mainBtn = document.getElementById('mainSubmitBtn');
                if (mainBtn) mainBtn.style.display = 'none';

                // Disable all item scores too
                document.querySelectorAll('.item-score').forEach(input => input.disabled = true);
            }
        } else {
            // HOD View: Show Overall Comment and Footer
            const formFooter = document.createElement('div');
            formFooter.className = 'list-item-card';
            formFooter.style.marginTop = '2rem';
            formFooter.style.background = '#f8fafc';
            formFooter.style.border = '1px solid #e2e8f0';

            formFooter.innerHTML = `
                <h5 style="color:#334155; border-bottom:1px solid #cbd5e1; padding-bottom:10px; margin-bottom:15px; font-weight:600;">
                    <i class="fa-solid fa-file-signature"></i> HOD Final Declaration
                </h5>
                
                <div class="form-group" style="margin-bottom: 1.5rem;">
                    <label style="font-weight:600; font-size:0.9rem; color:#475569; margin-bottom:5px; display:block;">Overall HOD Remarks <span style="color:#ef4444;">*</span></label>
                    <textarea id="txtHodOverall" class="form-control" rows="3" placeholder="Required: Enter overall final remarks for this student..." 
                        style="border:1px solid #cbd5e1; box-shadow:none; padding:10px;" ${window.IS_LOCKED ? 'readonly' : ''}>${acad.hod_overall_comments || ''}</textarea>
                </div>

                <div style="display:grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 1.5rem;">
                    <div class="form-group">
                        <label style="font-weight:600; font-size:0.9rem; color:#475569; margin-bottom:5px; display:block;">Name of HOD <span style="color:#ef4444;">*</span></label>
                        <div class="input-icon-wrapper" style="position:relative;">
                            <i class="fa-solid fa-user-tie" style="position:absolute; left:10px; top:50%; transform:translateY(-50%); color:#94a3b8;"></i>
                            <input type="text" id="txtHodName" class="form-control" placeholder="Required" value="${acad.hod_name || ''}" 
                                style="padding-left:35px; border:1px solid #cbd5e1;" ${window.IS_LOCKED ? 'readonly' : ''}>
                        </div>
                    </div>
                    <div class="form-group">
                        <label style="font-weight:600; font-size:0.9rem; color:#475569; margin-bottom:5px; display:block;">Date of Evaluation</label>
                         <div class="input-icon-wrapper" style="position:relative;">
                            <i class="fa-solid fa-calendar-alt" style="position:absolute; left:10px; top:50%; transform:translateY(-50%); color:#94a3b8;"></i>
                            <input type="date" id="txtHodDate" class="form-control" value="${acad.hod_evaluation_date || new Date().toISOString().split('T')[0]}" 
                                style="padding-left:35px; border:1px solid #cbd5e1;" ${window.IS_LOCKED ? 'readonly' : ''}>
                        </div>
                    </div>
                </div>

                ${window.IS_LOCKED
                    ? `<div class="alert" style="background:#dcfce7; color:#166534; border:1px solid #bbf7d0; padding:10px; border-radius:6px; font-weight:500; display:flex; align-items:center; gap:10px;">
                        <i class="fa-solid fa-lock"></i> Evaluation Submitted & Locked
                       </div>`
                    : `<p style="font-size:0.85rem; color:#64748b; margin-bottom:15px;">
                        <i class="fa-solid fa-circle-info"></i> By clicking submit, you confirm that these details are final. The evaluation will be locked.
                       </p>`
                }
            `;
            const submitBtn = document.querySelector('#scoreForm button[type="submit"]');
            submitBtn.parentElement.insertBefore(formFooter, submitBtn);

            if (window.IS_LOCKED) {
                submitBtn.style.display = 'none';
            } else {
                // Style the button to look better
                submitBtn.className = 'btn-primary'; // Ensure it has the class
                submitBtn.style.width = '100%';
                submitBtn.innerHTML = '<i class="fa-solid fa-paper-plane"></i> Final Submission';
            }
        }
    }

    // Submit Scores Handler
    document.getElementById('scoreForm').addEventListener('submit', async (e) => {
        e.preventDefault();
        const submitBtn = e.target.querySelector('button[type="submit"]');
        const originalText = submitBtn.innerHTML;
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Saving...';

        try {
            // 1. Validation for HODs only
            if (!IS_SUPER_ADMIN) {
                const missing = [];

                // Item level comments
                document.querySelectorAll('.item-comment-input').forEach(input => {
                    if (!input.value.trim()) {
                        const label = input.dataset.label || "A section";
                        missing.push(label);
                        input.style.borderColor = '#ef4444';
                    } else {
                        input.style.borderColor = '#cbd5e1';
                    }
                });

                // Footer details
                const overall = document.getElementById('txtHodOverall');
                if (!overall?.value?.trim()) {
                    missing.push("Overall HOD Remarks");
                    if (overall) overall.style.borderColor = '#ef4444';
                } else if (overall) overall.style.borderColor = '#cbd5e1';

                const hodName = document.getElementById('txtHodName');
                if (!hodName?.value?.trim()) {
                    missing.push("Name of HOD");
                    if (hodName) hodName.style.borderColor = '#ef4444';
                } else if (hodName) hodName.style.borderColor = '#cbd5e1';

                if (missing.length > 0) {
                    alert('Please complete the following required comments before submitting:\n\n• ' + [...new Set(missing)].join('\n• '));
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = originalText;
                    return;
                }
            } else {
                // Validation for Super Admin
                const chkFinal = document.getElementById('chkFinalSubmit');
                if (!chkFinal || !chkFinal.checked) {
                    alert("Please check the 'Final Submission' box to confirm these marks are final.");
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = originalText;
                    return;
                }
            }

            // 2. Gather Comments & Item-level data
            const coScores = [];
            const coInputs = document.querySelectorAll('.item-comment-input[data-type="co"]');
            coInputs.forEach(input => {
                const id = input.dataset.id;
                const comment = input.value;
                const scoreInput = document.querySelector(`.co-score[data-id="${id}"]`);
                const score = scoreInput ? (parseFloat(scoreInput.value) || 0) : null;

                const item = { id: id, hod_comments: comment };
                if (score !== null) item.score = score;
                coScores.push(item);
            });

            const extraScores = [];
            const extraInputs = document.querySelectorAll('.item-comment-input[data-type="extra"]');
            extraInputs.forEach(input => {
                const id = input.dataset.id;
                const comment = input.value;
                const scoreInput = document.querySelector(`.extra-score[data-id="${id}"]`);
                const score = scoreInput ? (parseFloat(scoreInput.value) || 0) : null;

                const item = { id: id, hod_comments: comment };
                if (score !== null) item.score = score;
                extraScores.push(item);
            });

            // Scrape granular academic comments
            const acadHonoursComment = document.querySelector('.item-comment-input[data-id="academic_honours"]')?.value || '';
            const acadExamsComment = document.querySelector('.item-comment-input[data-id="academic_exams"]')?.value || '';

            const data = {
                user_id: document.getElementById('evalUserId').value,
                academic_comments: '',
                honours_minors_comments: acadHonoursComment,
                competitive_exams_comments: acadExamsComment,
                co_scores: coScores,
                extra_scores: extraScores,
                hod_name: document.getElementById('txtHodName')?.value || '',
                hod_evaluation_date: document.getElementById('txtHodDate')?.value || '',
                hod_overall_comments: document.getElementById('txtHodOverall')?.value || '',
                is_final_submission: document.getElementById('chkFinalSubmit')?.checked || false
            };

            if (IS_SUPER_ADMIN) {
                data.academic_cgpa_score = document.getElementById('scAcademicCGPA').value;
                data.academic_honours_score = document.getElementById('scAcademicHonours').value;
                data.academic_exams_score = document.getElementById('scAcademicExams').value;
                data.co_curricular_score = document.getElementById('scCo').value;
                data.extracurricular_score = document.getElementById('scExtra').value;
            }

            const res = await fetch(apiBase + '/admin/evaluate', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });

            if (res.ok) {
                const respData = await res.json();
                alert(respData.message || 'Saved Successfully!');
                window.location.href = 'admin-dashboard.php';
            } else {
                const err = await res.json();
                alert('Error: ' + (err.error || 'Unknown error'));
            }
        } catch (err) {
            console.error(err);
            alert('Failed to save: ' + err.message);
        } finally {
            submitBtn.disabled = false;
            submitBtn.innerHTML = originalText;
        }
    });

});

// Modal logic removed - certificates now open in a new tab
