const apiBase = (window.APP_BASE_URL || "").replace(/\/$/, "");

const getCertHtml = (path) => {
    if (!path) return '<span class="status-badge" style="background:#f1f5f9; color:#94a3b8; font-size:0.75rem; border:1px solid #e2e8f0; padding: 2px 8px; border-radius: 4px;">No certificate</span>';
    const url = `${apiBase}/files/${path.replace('FILE:', '')}`;
    return `<a href="#" onclick="openDocModal('${url}'); return false;" class="status-badge" style="background:#eff6ff; color:#2563eb; text-decoration:none; display:inline-flex; align-items:center; gap:4px; font-size:0.75rem; border:1px solid #dbeafe; padding: 2px 8px; border-radius: 4px;">
        <i class="fa-solid fa-eye"></i> View
    </a>`;
};

document.addEventListener('DOMContentLoaded', () => {
    const params = new URLSearchParams(window.location.search);
    const userId = params.get('id');

    if (!userId) {
        showError("Invalid access. No student specified.");
        return;
    }

    loadStudentDetails(userId);
});

async function loadStudentDetails(id) {
    try {
        const res = await fetch(apiBase + `/panel/students/details?id=${id}`);
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

        renderProfile(data, id);
    } catch (err) {
        console.error(err);
        showError(err.message);
    }
}

function showError(msg) {
    document.getElementById('loadingState').style.display = 'none';
    document.getElementById('errorState').style.display = 'block';
    document.getElementById('errorMessage').innerText = msg;
}

function renderProfile(data, userId) {
    const u = data.user;
    const ac = data.academic || {};
    const co = data.coCurricular || [];
    const ex = data.extracurricular || [];

    // Hide loader, show content
    document.getElementById('loadingState').style.display = 'none';
    document.getElementById('contentArea').style.display = 'block';

    // 1. Header
    document.getElementById('stName').innerText = u.name;
    document.getElementById('stRoll').innerText = `${u.roll_number} | ${u.department}`;
    const avatarEl = document.getElementById('stAvatar');
    if (u.profile_photo) {
        const photoUrl = u.profile_photo.startsWith('FILE:')
            ? `${apiBase}/files/${u.profile_photo.replace('FILE:', '')}`
            : (u.profile_photo.startsWith('http') ? u.profile_photo : `${apiBase}/files/${u.profile_photo}`);
        avatarEl.innerHTML = `<img src="${photoUrl}" alt="Profile" style="width:100%; height:100%; object-fit:cover;">`;
    } else {
        avatarEl.innerHTML = u.name.charAt(0).toUpperCase();
    }

    // 2. Evaluation Slider Logic
    // Only available score we have is from Top 20 list which is global...
    // Wait, the 'details' endpoint DOES NOT return the Final/Interview score currently.
    // We should ideally fetch the current interview score.
    // However, the Top 20 endpoint has it. 
    // Let's assume 0 for now or try to fetch it if we modify the backend.
    // *Self-Correction*: The user is in 'Top 20' list so they exist in final_scores.
    // We can assume fetch default 0 or we might need to update backend to send 'interview_score' in the details.

    setupEvaluationForm(userId, data);

    // Bio and Contact
    document.getElementById('stEmail').innerText = u.email || 'N/A';
    document.getElementById('stContact').innerText = u.contact_number || 'N/A';
    document.getElementById('stBio').innerText = u.bio || 'No bio provided.';

    // 3. Academic
    document.getElementById('acCgpa').innerText = ac.cgpa || 'N/A';
    document.getElementById('acS1').innerText = ac.sgpa_sem1 || '-';
    document.getElementById('acS2').innerText = ac.sgpa_sem2 || '-';
    document.getElementById('acS3').innerText = ac.sgpa_sem3 || '-';
    document.getElementById('acS4').innerText = ac.sgpa_sem4 || '-';
    document.getElementById('acS5').innerText = ac.sgpa_sem5 || '-';
    document.getElementById('acS6').innerText = ac.sgpa_sem6 || '-';
    document.getElementById('acS7').innerText = ac.sgpa_sem7 || '-';
    document.getElementById('acS8').innerText = ac.sgpa_sem8 || '-';

    // 3.1 Honours/Minors Parsing
    const renderHonours = () => {
        const raw = ac.honours_minors;
        const comments = ac.honours_minors_comments;
        let html = '';

        if (!raw || raw === 'No') {
            html = 'Not Pursuing';
        } else {
            try {
                if (raw.trim().startsWith('{')) {
                    const parsed = JSON.parse(raw);
                    if (parsed.courses && Array.isArray(parsed.courses)) {
                        const list = parsed.courses.map(c => {
                            return `<li style="margin-bottom:8px; display:flex; align-items:center;">
                                <span style="flex:1"><strong>${c.name}</strong></span>
                                ${getCertHtml(c.certificate_path)}
                            </li>`;
                        }).join('');
                        html = `<div style="margin-bottom:0.8rem; font-weight:600; color:var(--primary-color);">${parsed.type}:</div><ul style="padding-left:0; list-style:none; margin:0;">${list}</ul>`;
                    }
                }
            } catch (e) { html = raw; }
            if (!html) html = raw;
        }

        if (comments) {
            html += `<div style="margin-top:10px; padding:10px; background:#f0f9ff; border-left:4px solid #0ea5e9; border-radius:4px;">
                        <small style="color:#0369a1; font-weight:700; text-transform:uppercase; font-size:0.7rem; display:block; margin-bottom:4px;">HOD Remarks:</small>
                        <div style="font-size:0.9rem; color:#075985;">${comments}</div>
                    </div>`;
        }
        return html;
    };
    document.getElementById('acHonours').innerHTML = renderHonours();

    // 3.2 Competitive Exams Parsing
    const renderExams = () => {
        const raw = ac.competitive_exams;
        const comments = ac.competitive_exams_comments;
        let html = '';

        if (!raw || raw === 'No' || raw === 'N/A') {
            html = 'None';
        } else if (typeof raw === 'string' && raw.trim().startsWith('[')) {
            try {
                const parsed = JSON.parse(raw);
                if (Array.isArray(parsed)) {
                    html = parsed.map(e => {
                        return `<div style="margin-bottom:8px; display:flex; justify-content:space-between; align-items:center;">
                            <span>• <strong>${e.name}</strong> (Score: ${e.score})</span>
                            ${getCertHtml(e.certificate_path)}
                        </div>`;
                    }).join('');
                }
            } catch (e) { console.error("Panel parsing error:", e, raw); }
        } else if (typeof raw === 'string' && raw.includes(':')) {
            html = raw.split(',').map(item => `<div>• ${item.trim()}</div>`).join('');
        } else {
            html = raw;
        }

        if (comments) {
            html += `<div style="margin-top:10px; padding:10px; background:#f0f9ff; border-left:4px solid #0ea5e9; border-radius:4px;">
                        <small style="color:#0369a1; font-weight:700; text-transform:uppercase; font-size:0.7rem; display:block; margin-bottom:4px;">HOD Remarks:</small>
                        <div style="font-size:0.9rem; color:#075985;">${comments}</div>
                    </div>`;
        }
        return html;
    };
    document.getElementById('acExams').innerHTML = renderExams();

    document.getElementById('acProjects').innerText = ac.projects || 'None';

    const fileLink = (path, label) => {
        if (!path) return '<span style="color:#aaa; font-style:italic;">Not uploaded</span>';
        const url = `${apiBase}/files/${path.replace('FILE:', '')}`;
        return `<a href="#" onclick="window.openDocModal('${url}'); return false;" class="file-link"><i class="fa-solid fa-eye"></i> ${label}</a>`;
    };

    document.getElementById('recLetterContainer').innerHTML = fileLink(u.recommendation_letter_path, "View Recommendation Letter");

    const coItems = co;
    const extraItems = ex;

    // Clear containers
    const coContainer = document.getElementById('coContainer');
    const exContainer = document.getElementById('extraContainer');
    if (coContainer) coContainer.innerHTML = '';
    if (exContainer) exContainer.innerHTML = '';

    // Grouping helper
    const renderItemsList = (items) => {
        if (!items || items.length === 0) return '<p style="color:var(--text-muted); padding:0.5rem;">None recorded.</p>';
        return `
            <table class="custom-table">
                <thead><tr><th>Details</th><th style="width:180px;">HOD Remarks</th><th style="width:120px;">Proof</th></tr></thead>
                <tbody>
                    ${items.map(item => `<tr>
                        <td>
                            <div style="font-weight:500;">${item.title || item.name || 'Untitled'}</div>
                            ${item.level ? `<div style="font-size:0.75rem; color:#64748b;">${item.level}</div>` : ''}
                            ${item.description ? `<div style="font-size:0.75rem; color:#64748b;">${item.description}</div>` : ''}
                        </td>
                        <td style="font-size:0.85rem; color:#0369a1;">${item.hod_comments || '<span style="color:#cbd5e1;">-</span>'}</td>
                        <td>${getCertHtml(item.certificate_path)}</td>
                    </tr>`).join('')}
                </tbody>
            </table>`;
    };

    // Co-Curricular Rendering
    const coTypes = [
        "Paper Publications",
        "Inter-College Activity",
        "Intra-Department Winner",
        "Seminars Delivered",
        "Class Representative",
        "Professional Body Membership",
        "MOOCs Certification",
        "Internship/Consultancy",
        "Award/Contribution"
    ];
    let coHtml = '';
    coTypes.forEach(type => {
        const items = co.filter(i => i.activity_type === type);
        if (items.length > 0) {
            coHtml += `<div style="margin-top:1.5rem;">
                        <h6 style="font-weight:600; color:var(--text-color); margin-bottom:0.8rem; display:flex; align-items:center; gap:8px;">
                            <i class="fa-solid fa-circle-check" style="color:var(--primary-color); font-size:0.8rem;"></i> ${type}
                        </h6>
                        ${renderItemsList(items)}
                      </div>`;
        }
    });
    if (coContainer) coContainer.innerHTML = coHtml || '<p style="color:var(--text-muted); padding:1rem;">No co-curricular activities recorded.</p>';

    // Extracurricular Rendering
    const exTypes = [
        "University Team Selection",
        "Within College Activity",
        "Outside College Activity",
        "Tech Fest Coordinator",
        "Other Coordinator",
        "Committee Member",
        "NSS/Social Service",
        "Extracurricular Award"
    ];
    let exHtml = '';
    exTypes.forEach(type => {
        const items = ex.filter(i => i.activity_type === type);
        if (items.length > 0) {
            exHtml += `<div style="margin-top:1.5rem;">
                        <h6 style="font-weight:600; color:var(--text-color); margin-bottom:0.8rem; display:flex; align-items:center; gap:8px;">
                            <i class="fa-solid fa-medal" style="color:var(--primary-color); font-size:0.8rem;"></i> ${type}
                        </h6>
                        ${renderItemsList(items)}
                      </div>`;
        }
    });
    if (exContainer) exContainer.innerHTML = exHtml || '<p style="color:var(--text-muted); padding:1rem;">No extracurricular activities recorded.</p>';

    // 4. Declaration
    if (u.declaration_place) {
        document.getElementById('declarationArea').style.display = 'block';
        document.getElementById('declPlace').innerText = u.declaration_place;
        document.getElementById('declDate').innerText = u.declaration_date;
        if (u.signature_path) {
            const sigUrl = `${apiBase}/files/${u.signature_path.replace('FILE:', '')}`;
            document.getElementById('declSignature').innerHTML = `<img src="${sigUrl}" alt="Signature" style="max-height:80px; border:1px solid #ddd; padding:5px; margin-top:5px;">`;
        }
    }

    // 5. Overall HOD Remarks
    if (ac.hod_overall_comments) {
        document.getElementById('hodOverallSection').style.display = 'block';
        document.getElementById('hodOverallText').innerText = ac.hod_overall_comments;
        document.getElementById('hodName').innerText = ac.hod_name || 'Department HOD';
        document.getElementById('hodDate').innerText = ac.hod_evaluation_date || 'N/A';
    }
}

function setupEvaluationForm(userId, data) {
    const slider = document.getElementById('evalSlider');
    const display = document.getElementById('evalDisplay');
    const btn = document.getElementById('saveScoreBtn');

    // Load existing score
    if (data.myScore !== null && data.myScore !== undefined && data.is_evaluated) {
        slider.value = data.myScore;
        display.innerText = data.myScore;

        // LOCK FORM
        slider.disabled = true;
        btn.innerHTML = `<i class="fa-solid fa-lock"></i> Evaluation Submitted`;
        btn.style.background = '#94a3b8';
        btn.disabled = true;

        // Inform user
        const lockNote = document.createElement('div');
        lockNote.style.cssText = 'font-size: 0.85rem; color: #64748b; margin-top: 0.5rem; text-align: right; font-style: italic;';
        lockNote.innerHTML = '<i class="fa-solid fa-info-circle"></i> This evaluation has been finalized and cannot be modified.';
        btn.parentElement.appendChild(lockNote);
    }

    slider.addEventListener('input', () => display.innerText = slider.value);

    btn.addEventListener('click', async () => {
        const originalText = btn.innerHTML;
        btn.innerHTML = `<i class="fa-solid fa-spinner fa-spin"></i> Saving...`;
        btn.disabled = true;

        try {
            const res = await fetch(apiBase + '/panel/evaluate/interview', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ user_id: userId, score: slider.value })
            });

            if (res.ok) {
                btn.innerHTML = `<i class="fa-solid fa-check"></i> Saved Successfully!`;
                btn.style.background = '#10b981';

                // Redirect back to dashboard after short delay
                setTimeout(() => {
                    window.location.href = 'panel-dashboard';
                }, 1000);
            } else {
                throw new Error("Save failed");
            }
        } catch (err) {
            alert("Error saving score: " + err.message);
            btn.innerHTML = originalText;
            btn.disabled = false;
        }
    });
}

// Global Modal Logic (Custom Overlay)
window.openDocModal = (url) => {
    const modal = document.getElementById('certModal');
    if (!modal) return;

    const frame = document.getElementById('docFrame');
    const img = document.getElementById('docImage');
    const loader = document.getElementById('modalLoader');
    const modalBody = modal.querySelector('.modal-body');

    if (loader) loader.style.display = 'flex';
    if (frame) {
        frame.src = '';
        frame.style.display = 'none';
    }
    if (img) {
        img.src = '';
        img.style.display = 'none';
    }

    const isImage = /\.(jpg|jpeg|png|gif|webp)$/i.test(url);

    // Force modal body scroll behavior
    if (modalBody) {
        modalBody.style.overflow = isImage ? 'hidden' : 'auto';
    }

    if (isImage) {
        if (img) {
            img.src = url;
            img.style.display = 'block';
        }
    } else {
        if (frame) {
            frame.src = url;
            frame.style.display = 'block';
        }
    }

    modal.style.display = 'flex';
};

window.closeDocModal = () => {
    const modal = document.getElementById('certModal');
    if (modal) modal.style.display = 'none';
    const frame = document.getElementById('docFrame');
    const img = document.getElementById('docImage');
    if (frame) frame.src = '';
    if (img) img.src = '';
};
