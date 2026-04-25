const apiBase = (window.APP_BASE_URL || "").replace(/\/$/, "");

const getFileIcon = (filename) => {
    if (!filename) return 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png';
    const ext = filename.split('.').pop().toLowerCase();
    if (['jpg', 'jpeg', 'png', 'gif', 'svg'].includes(ext)) return null; // Use actual image
    if (ext === 'pdf') return 'https://cdn-icons-png.flaticon.com/512/337/337946.png';
    if (['doc', 'docx'].includes(ext)) return 'https://cdn-icons-png.flaticon.com/512/337/337950.png';
    return 'https://cdn-icons-png.flaticon.com/512/337/337949.png'; // Generic doc icon
};

const getCertHtml = (path, filename) => {
    if (!path) return '<span class="status-badge" style="background:#f1f5f9; color:#94a3b8; font-size:0.75rem; border:1px solid #e2e8f0; padding: 2px 8px; border-radius: 4px;">No certificate</span>';
    const url = `${apiBase}/files/${path.replace('FILE:', '')}`;
    const icon = filename ? (getFileIcon(filename) ? '<i class="fa-solid fa-file-pdf"></i>' : '<i class="fa-solid fa-image"></i>') : '<i class="fa-solid fa-eye"></i>';
    return `<a href="${url}" target="_blank" class="status-badge" style="background:#eff6ff; color:#2563eb; text-decoration:none; display:inline-flex; align-items:center; gap:4px; font-size:0.75rem; border:1px solid #dbeafe; padding: 2px 8px; border-radius: 4px;">
        ${icon} View
    </a>`;
};

// Modal logic removed - certificates now open in a new tab

document.addEventListener('DOMContentLoaded', () => {
    const safeGet = (id) => {
        const el = document.getElementById(id);
        return el ? el.value : '';
    };

    // Logout
    const logoutBtn = document.getElementById('logoutBtn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', async () => {
            await fetch(apiBase + '/auth/logout', { method: 'POST' });
            window.location.replace(apiBase + '/index.php');
        });
    }

    // Sidebar Toggle (Mobile)
    const hamburgerBtn = document.getElementById('hamburgerBtn');
    const sidebar = document.querySelector('.sidebar');
    const mainContent = document.querySelector('.main-content');

    if (hamburgerBtn && sidebar) {
        hamburgerBtn.addEventListener('click', (e) => {
            e.stopPropagation(); // Prevent immediate closing
            sidebar.classList.toggle('active');
        });

        // Close sidebar when clicking outside
        document.addEventListener('click', (e) => {
            if (window.innerWidth <= 1024 &&
                sidebar.classList.contains('active') &&
                !sidebar.contains(e.target) &&
                e.target !== hamburgerBtn) {
                sidebar.classList.remove('active');
            }
        });
    }


    // Tabs - Sidebar Navigation
    const tabs = document.querySelectorAll('.tab-btn');
    const contents = document.querySelectorAll('.tab-content');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            contents.forEach(c => c.classList.remove('active'));

            tab.classList.add('active');
            const target = document.getElementById(tab.dataset.tab);
            if (target) target.classList.add('active');
        });
    });

    // --- DATA LOADING ORCHESTRATION ---
    let isAppSubmitted = false;

    async function initDashboard() {
        try {
            await loadProfile();
            // Load other data but don't let them block the whole dashboard if they fail
            await Promise.allSettled([loadAllData(), loadAcademic()]);
        } catch (err) {
            console.error('Dashboard init error:', err);
        } finally {
            if (isAppSubmitted) {
                disableEditing();
            }
        }
    }


    // --- PROFILE HANDLING ---
    async function loadProfile() {
        try {
            const res = await fetch(apiBase + '/student/profile?t=' + Date.now());
            if (!res.ok) {
                const debugEl = document.getElementById('debug-info');
                if (debugEl) debugEl.innerText = 'Profile Fetch Failed';
                return;
            }
            const data = await res.json();

            // Check submission status
            if (data.is_submitted == 1) {
                isAppSubmitted = true;
                // Defer disableEditing to initDashboard to ensure all dynamic fields are loaded first
            }

            // DEBUG: Show who is logged in
            let debugMsg = `Logged in as: ${data.email || 'Unknown'}`;
            if (!data.name) debugMsg += ' (Name missing)';

            // Create debug element if not exists
            let debugEl = document.getElementById('debug-info');
            if (debugEl) {
                // debugEl.style = "background: #ffeeba; ..."; // Removed inline, kept simple text or add class if needed
                debugEl.className = 'alert alert-info'; // Assuming generic alert class or just text
                debugEl.innerText = debugMsg;
                debugEl.style.display = 'none'; // Hide debug info in production/redesign usually
            }

            // Populate Inline Inputs
            const setVal = (id, val) => {
                const el = document.getElementById(id);
                if (el) el.value = val || '';
            };
            setVal('pName', data.name);
            setVal('pDept', data.department);
            setVal('pRoll', data.roll_number);
            setVal('pContact', data.contact_number);
            setVal('pEmail', data.email);
            setVal('pBio', data.bio);

            // Set Photo
            const photoPrev = document.getElementById('pPhotoPreview');
            if (photoPrev && data.profile_photo) {
                const icon = getFileIcon(data.profile_photo_filename); // Assuming we might add filename later, or just check extension if path has it
                if (icon) {
                    photoPrev.src = icon;
                } else {
                    photoPrev.src = apiBase + '/files/' + data.profile_photo.replace('FILE:', '');
                }
            }

            // Update char count on load
            const bioField = document.getElementById('pBio');
            const bioCount = document.getElementById('bioCharCount');
            if (bioField && bioCount) {
                bioCount.innerText = bioField.value.length;
            }

            // Recommendation Letter
            if (data.recommendation_letter_path) {
                const recLinkDiv = document.getElementById('currentRecLetter');
                const recAnchor = document.getElementById('recFileLink');
                if (recLinkDiv && recAnchor) {
                    recLinkDiv.style.display = 'block';
                    recAnchor.href = apiBase + '/files/' + data.recommendation_letter_path.replace('FILE:', '');
                }
            }

            // Declaration Details
            setVal('declPlace', data.declaration_place);
            if (data.declaration_date) setVal('declDate', data.declaration_date);

            if (data.is_submitted == 1) {
                const declCheck = document.getElementById('declCheck');
                if (declCheck) declCheck.checked = true;
            }

            if (data.signature_path) {
                const sigPreview = document.getElementById('signaturePreview');
                const sigImg = sigPreview.querySelector('img');
                if (sigPreview && sigImg) {
                    // Signatures are always treated as images for preview
                    sigImg.src = apiBase + '/files/' + data.signature_path.replace('FILE:', '');
                    sigPreview.style.display = 'block';
                }
            }
        } catch (e) {
            console.error('Error loading profile', e);
            let debugEl = document.getElementById('debug-info');
            if (debugEl) debugEl.innerText = `Error: ${e.message}`;
        }
    }

    function disableEditing() {
        requestAnimationFrame(() => {
            document.querySelectorAll('input, textarea, select').forEach(el => el.disabled = true);
            document.querySelectorAll('.btn-remove, button[id^="add"], button[id^="save"], #finalSubmitBtn, #saveAcademicBtn, #saveProfileBtn, #saveRecBtn').forEach(btn => {
                if (btn.id !== 'downloadPdfBtn') btn.style.display = 'none';
            });
        });
    }

    // Bio Char Counter
    const bioInput = document.getElementById('pBio');
    const bioCountSpan = document.getElementById('bioCharCount');
    if (bioInput && bioCountSpan) {
        bioInput.addEventListener('input', () => {
            bioCountSpan.innerText = bioInput.value.length;
        });
    }

    // --- SAVE PROFILE (Updated for FormData/Photo) ---
    const saveProfileBtn = document.getElementById('saveProfileBtn');
    if (saveProfileBtn) {
        saveProfileBtn.addEventListener('click', async () => {
            const btn = saveProfileBtn;
            const originalText = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
            btn.disabled = true;

            const fd = new FormData();
            fd.append('bio', document.getElementById('pBio').value);

            const photoInput = document.getElementById('pPhoto');
            if (photoInput && photoInput.files[0]) {
                const validationError = validateFiles(photoInput.files);
                if (validationError) {
                    alert(validationError);
                    btn.innerHTML = originalText;
                    btn.disabled = false;
                    return;
                }
                fd.append('profile_photo', photoInput.files[0]);
            }

            try {
                const res = await fetch(apiBase + '/student/profile', {
                    method: 'POST',
                    body: fd
                });
                if (res.ok) {
                    alert('Profile Updated Successfully!');
                    const data = await res.json();
                    if (data.profile_photo) {
                        const pp = document.getElementById('pPhotoPreview');
                        if (pp) pp.src = apiBase + '/files/' + data.profile_photo.replace('FILE:', '');
                    }
                } else {
                    let errMsg = 'Error updating profile';
                    try {
                        const errData = await res.json();
                        errMsg = errData.error || errMsg;
                    } catch (e) {
                        const raw = await res.text();
                        if (raw) errMsg = raw.substring(0, 100);
                    }
                    alert(errMsg);
                }
            } catch (e) {
                console.error('Fetch error:', e);
                alert(`Network Error: ${e.message}`);
            } finally {
                btn.innerHTML = originalText;
                btn.disabled = false;
            }
        });
    }

    // Photo Preview Listener
    const pPhoto = document.getElementById('pPhoto');
    if (pPhoto) {
        pPhoto.addEventListener('change', (e) => {
            const file = e.target.files[0];
            const img = document.getElementById('pPhotoPreview');
            if (file && img) {
                const icon = getFileIcon(file.name);
                if (icon) {
                    img.src = icon;
                } else {
                    const reader = new FileReader();
                    reader.onload = (ev) => {
                        img.src = ev.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            }
        });
    }

    // Signature Preview Listener
    const declSig = document.getElementById('declSignature');
    if (declSig) {
        declSig.addEventListener('change', (e) => {
            const file = e.target.files[0];
            const previewDiv = document.getElementById('signaturePreview');
            const previewImg = previewDiv?.querySelector('img');
            if (file && previewDiv && previewImg) {
                const icon = getFileIcon(file.name);
                if (icon) {
                    previewImg.src = icon;
                } else {
                    const reader = new FileReader();
                    reader.onload = (ev) => {
                        previewImg.src = ev.target.result;
                    };
                    reader.readAsDataURL(file);
                }
                previewDiv.style.display = 'block';
            }
        });
    }

    // --- HELPERS FOR BULK SAVE & PREFILL ---
    async function saveBulkActivities(url, activityType, items, silent = false) {
        try {
            const fd = new FormData();
            fd.append('activity_type', activityType);

            // Separate files from data
            const cleanItems = items.map(item => {
                const { fileInput, ...rest } = item;
                return rest;
            });

            fd.append('items', JSON.stringify(cleanItems));

            // Append files
            items.forEach((item, index) => {
                if (item.fileInput && item.fileInput.files && item.fileInput.files[0]) {
                    fd.append(`file_${index}`, item.fileInput.files[0]);
                }
            });

            const res = await fetch(apiBase + (url.startsWith('/') ? url : '/' + url), {
                method: 'POST',
                // No Content-Type header for FormData
                body: fd
            });

            if (res.ok) {
                if (!silent) alert(`${activityType} saved successfully!`);
                return true;
            } else {
                let errMsg = 'Unknown error';
                const text = await res.text();
                try {
                    const err = JSON.parse(text);
                    errMsg = err.error || text;
                } catch (e) {
                    errMsg = `Server returned non-JSON: ${text.substring(0, 200)}`;
                    console.error('Server Raw Response:', text);
                }
                alert(`Error saving ${activityType}: ${errMsg}`);
                return false;
            }
        } catch (error) {
            console.error(error);
            alert(`Network error saving ${activityType}: ${error.message}`);
            return false;
        }
    }

    function prefillSection(data, type, toggleYesId, toggleNoId, containerId, createRowFn) {
        const items = data.filter(d => d.activity_type === type);
        const yesRadio = document.getElementById(toggleYesId);
        const noRadio = document.getElementById(toggleNoId);
        const container = document.getElementById(containerId);

        if (!yesRadio || !container) return;

        if (items.length > 0) {
            yesRadio.checked = true;
            yesRadio.dispatchEvent(new Event('change'));
            container.innerHTML = ''; // Clear default
            items.forEach(item => {
                container.appendChild(createRowFn(item));
            });
        } else if (noRadio) {
            noRadio.checked = true;
            noRadio.dispatchEvent(new Event('change'));
        }
    }



    async function loadAllData() {
        // Co-Curricular
        try {
            const coRes = await fetch(apiBase + '/student/co-curricular?t=' + Date.now());
            if (coRes.ok) {
                const coData = await coRes.json();

                // Papers
                prefillSection(coData, 'Paper Publications', 'papersYes', 'papersNo', 'paperListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'paper-entry dynamic-entry dynamic-entry-grid';
                    div.innerHTML = `
                        <div>
                            <label class="form-label">Name of the Journal/Conference</label>
                            <textarea class="paper-journal input-full" rows="2">${item.description || ''}</textarea>
                        </div>
                        <div>
                            <label class="form-label">Title of the paper and Authors</label>
                            <textarea class="paper-title input-full" rows="2">${item.title || item.name || ''}</textarea>
                        </div>
                        </div>
                        <div style="grid-column: 1 / -1;">
                             <input type="file" class="paper-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                             <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                             <input type="hidden" class="entry-id" value="${item.id || ''}">
                             ${getCertHtml(item.certificate_path, item.filename)}
                        </div>
                        <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                    `;
                    return div;
                });

                // Inter-College
                prefillSection(coData, 'Inter-College Activity', 'interYes', 'interNo', 'interListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'inter-entry dynamic-entry dynamic-entry-grid';
                    let desc = item.description || '';
                    div.innerHTML = `
                        <div>
                            <label class="form-label">College Name</label>
                            <input type="text" class="inter-college input-full" value="${item.title || ''}">
                        </div>
                        </div>
                        <div style="grid-column: 1 / -1;">
                            <label class="form-label">Description (Event, Prize, etc)</label>
                            <input type="text" class="inter-desc input-full" value="${desc}">
                             <input type="file" class="inter-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                             <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                             <input type="hidden" class="entry-id" value="${item.id || ''}">
                             ${getCertHtml(item.certificate_path, item.filename)}
                        </div>
                        <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                    `;
                    return div;
                });

                // Intra-Dept
                prefillSection(coData, 'Intra-Department Winner', 'intraDeptYes', 'intraDeptNo', 'intraDeptListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'intra-dept-entry dynamic-entry dynamic-entry-grid';
                    div.innerHTML = `
                       <div>
                            <label class="form-label">Event Name</label>
                            <input type="text" class="dept-event input-full" value="${item.title || ''}">
                        </div>
                        <div>
                             <label class="form-label">Description / Prize</label>
                            <input type="text" class="dept-desc input-full" value="${item.description || ''}">
                             <input type="file" class="dept-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                             <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                             <input type="hidden" class="entry-id" value="${item.id || ''}">
                             ${getCertHtml(item.certificate_path, item.filename)}
                        </div>
                        <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                    `;
                    return div;
                });

                // Seminars
                prefillSection(coData, 'Seminars Delivered', 'seminarsYes', 'seminarsNo', 'seminarListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'seminar-entry dynamic-entry';
                    div.innerHTML = `
                        <label class="form-label">Seminar Topic</label>
                        <input type="text" class="seminar-topic input-full" value="${item.title || item.name || ''}">
                        <input type="file" class="seminar-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                        <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                        <input type="hidden" class="entry-id" value="${item.id || ''}">
                        ${getCertHtml(item.certificate_path, item.filename)}
                        <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                    `;
                    return div;
                });

                // Class Rep
                prefillSection(coData, 'Class Representative', 'repYes', 'repNo', 'repListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'rep-entry dynamic-entry';
                    const nameStr = item.title || item.name || '';
                    const sem = nameStr.replace('Semester ', '').trim();
                    div.innerHTML = `
                        <label class="form-label">Semester (e.g. 3, 4)</label>
                        <input type="number" class="rep-semester input-full" value="${sem}" min="1" max="8">
                        <input type="file" class="rep-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                        <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                        <input type="hidden" class="entry-id" value="${item.id || ''}">
                        ${getCertHtml(item.certificate_path, item.filename)}
                        <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                    `;
                    return div;
                });

                // Professional Body Membership
                prefillSection(coData, 'Professional Body Membership', 'membershipYes', 'membershipNo', 'membershipListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'membership-entry dynamic-entry';
                    div.innerHTML = `
                        <label class="form-label">Professional Body Name</label>
                        <input type="text" class="membership-name input-full" value="${item.name || item.title || ''}">
                        <input type="file" class="membership-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                        <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                        <input type="hidden" class="entry-id" value="${item.id || ''}">
                        ${getCertHtml(item.certificate_path, item.filename)}
                        <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                    `;
                    return div;
                });

                // MOOCs Certification
                prefillSection(coData, 'MOOCs Certification', 'moocsYes', 'moocsNo', 'moocsListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'moocs-entry dynamic-entry';
                    div.innerHTML = `
                        <label class="form-label">Certification Name</label>
                        <input type="text" class="moocs-name input-full" value="${item.name || item.title || ''}">
                        <input type="file" class="moocs-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                        <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                        <input type="hidden" class="entry-id" value="${item.id || ''}">
                        ${getCertHtml(item.certificate_path, item.filename)}
                        <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                    `;
                    return div;
                });

                // Internship/Consultancy
                prefillSection(coData, 'Internship/Consultancy', 'internshipYes', 'internshipNo', 'internshipListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'internship-entry dynamic-entry';
                    let duration = '';
                    if (item.description && item.description.startsWith('Duration: ')) {
                        duration = item.description.replace('Duration: ', '');
                    }
                    div.innerHTML = `
                        <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 10px;">
                            <div>
                                <label class="form-label">Internship/Consultancy</label>
                                <input type="text" class="internship-name input-full" value="${item.name || item.title || ''}">
                            </div>
                            <div>
                                <label class="form-label">Duration</label>
                                <input type="text" class="internship-duration input-full" value="${duration}">
                            </div>
                        </div>
                        <input type="file" class="internship-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                        <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                        <input type="hidden" class="entry-id" value="${item.id || ''}">
                        ${getCertHtml(item.certificate_path, item.filename)}
                        <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                    `;
                    return div;
                });

                // Awards / Significant Contributions
                prefillSection(coData, 'Award/Contribution', 'awardsYes', 'awardsNo', 'awardsListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'awards-entry dynamic-entry dynamic-entry-grid';
                    div.innerHTML = `
                        <div>
                             <label class="form-label">Award/Contribution</label>
                            <input type="text" class="awards-name input-full" value="${item.name || item.title || ''}">
                        </div>
                        <div style="grid-column: 1 / -1;">
                             <input type="file" class="awards-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                             <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                             <input type="hidden" class="entry-id" value="${item.id || ''}">
                             ${getCertHtml(item.certificate_path, item.filename)}
                        </div>
                        <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                    `;
                    return div;
                });

            }
        } catch (e) { console.error(e); }

        // Extracurricular
        try {
            const extRes = await fetch(apiBase + '/student/extracurricular?t=' + Date.now());
            if (extRes.ok) {
                const extData = await extRes.json();

                // University Team Selection
                prefillSection(extData, 'University Team Selection', 'uniTeamYes', 'uniTeamNo', 'uniTeamListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'uni-team-entry dynamic-entry dynamic-entry-grid';
                    let typeVal = 'individual';
                    if (item.description && item.description.includes('Group')) typeVal = 'group';

                    div.innerHTML = `
                        <div>
                            <label class="form-label">Activity/Sport Name</label>
                            <input type="text" class="uni-team-name input-full" value="${item.title || item.name || ''}">
                        </div>
                        <div>
                            <label class="form-label">Type</label>
                            <select class="uni-team-type input-full">
                                <option value="individual" ${typeVal === 'individual' ? 'selected' : ''}>Individual (3 Marks)</option>
                                <option value="group" ${typeVal === 'group' ? 'selected' : ''}>Group (2 Marks)</option>
                            </select>
                        </div>
                        <div style="grid-column: 1 / -1;">
                             <input type="file" class="uni-team-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                             <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                             <input type="hidden" class="entry-id" value="${item.id || ''}">
                             ${getCertHtml(item.certificate_path, item.filename)}
                        </div>
                        <div class="entry-actions" style="grid-column: 1 / -1; display:flex; gap:10px; margin-top:10px;">
                            <button type="button" class="btn-save-item" style="background:#2563eb; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer;"><i class="fas fa-save"></i> Save</button>
                            <button type="button" class="btn-remove" title="Remove Entry" style="position:static; padding:8px 16px;"><i class="fas fa-trash"></i> Remove</button>
                        </div>
                    `;
                    return div;
                });

                // Outside College Activity
                prefillSection(extData, 'Outside College Activity', 'outsideYes', 'outsideNo', 'outsideListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'outside-entry dynamic-entry dynamic-entry-grid';
                    let typeVal = 'participation';
                    if (item.description && item.description.includes('prize')) typeVal = 'prize';

                    div.innerHTML = `
                        <div>
                            <label class="form-label">Event Name</label>
                            <input type="text" class="outside-name input-full" value="${item.title || item.name || ''}">
                        </div>
                        <div>
                            <label class="form-label">Achievement</label>
                            <select class="outside-type input-full">
                                <option value="participation" ${typeVal === 'participation' ? 'selected' : ''}>Participation (1 Mark)</option>
                                <option value="prize" ${typeVal === 'prize' ? 'selected' : ''}>I/II Prize Won (5 Marks)</option>
                            </select>
                        </div>
                        <div style="grid-column: 1 / -1;">
                             <input type="file" class="outside-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                             <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                             <input type="hidden" class="entry-id" value="${item.id || ''}">
                             ${getCertHtml(item.certificate_path, item.filename)}
                        </div>
                        <div class="entry-actions" style="grid-column: 1 / -1; display:flex; gap:10px; margin-top:10px;">
                            <button type="button" class="btn-save-item" style="background:#2563eb; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer;"><i class="fas fa-save"></i> Save</button>
                            <button type="button" class="btn-remove" title="Remove Entry" style="position:static; padding:8px 16px;"><i class="fas fa-trash"></i> Remove</button>
                        </div>
                    `;
                    return div;
                });

                // Within College Activity
                prefillSection(extData, 'Within College Activity', 'withinYes', 'withinNo', 'withinListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'within-entry dynamic-entry dynamic-entry-grid';
                    let typeVal = 'participation';
                    if (item.description && item.description.includes('prize')) typeVal = 'prize';

                    div.innerHTML = `
                        <div>
                            <label class="form-label">Event Name</label>
                            <input type="text" class="within-name input-full" value="${item.title || item.name || ''}">
                        </div>
                        <div>
                            <label class="form-label">Achievement</label>
                            <select class="within-type input-full">
                                <option value="participation" ${typeVal === 'participation' ? 'selected' : ''}>Participation (1 Mark)</option>
                                <option value="prize" ${typeVal === 'prize' ? 'selected' : ''}>I/II Prize Won (2 Marks)</option>
                            </select>
                        </div>
                        <div style="grid-column: 1 / -1;">
                             <input type="file" class="within-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                             <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                             <input type="hidden" class="entry-id" value="${item.id || ''}">
                             ${getCertHtml(item.certificate_path, item.filename)}
                        </div>
                        <div class="entry-actions" style="grid-column: 1 / -1; display:flex; gap:10px; margin-top:10px;">
                            <button type="button" class="btn-save-item" style="background:#2563eb; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer;"><i class="fas fa-save"></i> Save</button>
                            <button type="button" class="btn-remove" title="Remove Entry" style="position:static; padding:8px 16px;"><i class="fas fa-trash"></i> Remove</button>
                        </div>
                    `;
                    return div;
                });

                // Tech Fest Coordinator
                prefillSection(extData, 'Tech Fest Coordinator', 'techYes', 'techNo', 'techListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'tech-entry dynamic-entry dynamic-entry-grid';
                    let typeVal = 'dept';
                    if (item.description && item.description.includes('College')) typeVal = 'college';

                    div.innerHTML = `
                        <div>
                            <label class="form-label">Role/Event</label>
                            <input type="text" class="tech-name input-full" value="${item.title || item.name || ''}">
                        </div>
                        <div>
                            <label class="form-label">Level</label>
                            <select class="tech-type input-full">
                                <option value="dept" ${typeVal === 'dept' ? 'selected' : ''}>Dept. Level (1 Mark)</option>
                                <option value="college" ${typeVal === 'college' ? 'selected' : ''}>College Level (2 Marks)</option>
                            </select>
                        </div>
                        <div style="grid-column: 1 / -1;">
                             <input type="file" class="tech-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                             <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                             <input type="hidden" class="entry-id" value="${item.id || ''}">
                             ${getCertHtml(item.certificate_path, item.filename)}
                        </div>
                        <div class="entry-actions" style="grid-column: 1 / -1; display:flex; gap:10px; margin-top:10px;">
                            <button type="button" class="btn-save-item" style="background:#2563eb; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer;"><i class="fas fa-save"></i> Save</button>
                            <button type="button" class="btn-remove" title="Remove Entry" style="position:static; padding:8px 16px;"><i class="fas fa-trash"></i> Remove</button>
                        </div>
                    `;
                    return div;
                });

                // Other Coordinator
                prefillSection(extData, 'Other Coordinator', 'otherCoordYes', 'otherCoordNo', 'otherCoordListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'other-coord-entry dynamic-entry dynamic-entry-grid';
                    let typeVal = 'dept';
                    if (item.description && item.description.includes('College')) typeVal = 'college';

                    div.innerHTML = `
                        <div>
                            <label class="form-label">Occasion/Role</label>
                            <input type="text" class="other-coord-name input-full" value="${item.title || item.name || ''}">
                        </div>
                        <div>
                            <label class="form-label">Level</label>
                            <select class="other-coord-type input-full">
                                <option value="dept" ${typeVal === 'dept' ? 'selected' : ''}>Dept. Level (1 Mark)</option>
                                <option value="college" ${typeVal === 'college' ? 'selected' : ''}>College Level (2 Marks)</option>
                            </select>
                        </div>
                        <div style="grid-column: 1 / -1;">
                             <input type="file" class="other-coord-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                             <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                             <input type="hidden" class="entry-id" value="${item.id || ''}">
                             ${getCertHtml(item.certificate_path, item.filename)}
                        </div>
                        <div class="entry-actions" style="grid-column: 1 / -1; display:flex; gap:10px; margin-top:10px;">
                            <button type="button" class="btn-save-item" style="background:#2563eb; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer;"><i class="fas fa-save"></i> Save</button>
                            <button type="button" class="btn-remove" title="Remove Entry" style="position:static; padding:8px 16px;"><i class="fas fa-trash"></i> Remove</button>
                        </div>
                    `;
                    return div;
                });

                // Committee Member
                prefillSection(extData, 'Committee Member', 'committeeYes', 'committeeNo', 'committeeListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'committee-entry dynamic-entry';
                    div.innerHTML = `
                        <label class="form-label">Committee Name</label>
                        <input type="text" class="committee-name input-full" value="${item.title || item.name || ''}">
                        <input type="file" class="committee-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                        <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                        <input type="hidden" class="entry-id" value="${item.id || ''}">
                        ${getCertHtml(item.certificate_path, item.filename)}
                        <div class="entry-actions" style="display:flex; gap:10px; margin-top:10px;">
                            <button type="button" class="btn-save-item" style="background:#2563eb; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer;"><i class="fas fa-save"></i> Save</button>
                            <button type="button" class="btn-remove" title="Remove Entry" style="position:static; padding:8px 16px;"><i class="fas fa-trash"></i> Remove</button>
                        </div>
                    `;
                    return div;
                });

                // Awards
                prefillSection(extData, 'Extracurricular Award', 'extAwardsYes', 'extAwardsNo', 'extAwardsListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'ext-awards-entry dynamic-entry';
                    div.innerHTML = `
                        <label class="form-label">Award/Contribution</label>
                        <input type="text" class="ext-awards-name input-full" value="${item.title || item.name || ''}">
                        <input type="file" class="ext-awards-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                        <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                        <input type="hidden" class="entry-id" value="${item.id || ''}">
                        ${getCertHtml(item.certificate_path, item.filename)}
                        <div class="entry-actions" style="display:flex; gap:10px; margin-top:10px;">
                            <button type="button" class="btn-save-item" style="background:#2563eb; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer;"><i class="fas fa-save"></i> Save</button>
                            <button type="button" class="btn-remove" title="Remove Entry" style="position:static; padding:8px 16px;"><i class="fas fa-trash"></i> Remove</button>
                        </div>
                    `;
                    return div;
                });

                // NSS
                prefillSection(extData, 'NSS/Social Service', 'nssYes', 'nssNo', 'nssListContainer', (item) => {
                    const div = document.createElement('div');
                    div.className = 'nss-entry dynamic-entry';
                    div.innerHTML = `
                        <label class="form-label">About Activity</label>
                        <input type="text" class="nss-name input-full" value="${item.title || item.name || ''}">
                        <input type="file" class="nss-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                        <input type="hidden" class="existing-path" value="${item.certificate_path || ''}">
                        <input type="hidden" class="entry-id" value="${item.id || ''}">
                        ${getCertHtml(item.certificate_path, item.filename)}
                        <div class="entry-actions" style="display:flex; gap:10px; margin-top:10px;">
                            <button type="button" class="btn-save-item" style="background:#2563eb; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer;"><i class="fas fa-save"></i> Save</button>
                            <button type="button" class="btn-remove" title="Remove Entry" style="position:static; padding:8px 16px;"><i class="fas fa-trash"></i> Remove</button>
                        </div>
                    `;
                    return div;
                });
            }
        } catch (e) { console.error(e); }

        // --- ACADEMIC HANDLING ---
        // (Note: Academics are handled by loadAcademic() below)
    } // End of loadAllData

    // --- ACADEMIC HANDLING ---
    async function loadAcademic() {
        // Form listener moved to global scope below to prevent duplicates

        const safeSet = (id, val) => {
            const el = document.getElementById(id);
            if (el) el.value = (val !== undefined && val !== null) ? val : '';
        };

        try {
            const res = await fetch(apiBase + '/student/academic?t=' + Date.now());
            if (res.ok) {
                const data = await res.json();
                if (data) {
                    safeSet('cgpa', data.cgpa);
                    for (let i = 1; i <= 8; i++) safeSet(`sgpa${i}`, data[`sgpa_sem${i}`]);
                    // Removed backlogs

                    // Honours/Minors Fetching
                    if (data.honours_minors && data.honours_minors !== 'No') {
                        const hYes = document.getElementById('honoursYes');
                        if (hYes) { hYes.checked = true; hYes.dispatchEvent(new Event('change')); }

                        try {
                            let parsed;
                            try { parsed = JSON.parse(data.honours_minors); } catch (e) { parsed = null; }

                            if (parsed && typeof parsed === 'object') {
                                // New JSON Format
                                const type = parsed.type || 'Degree';
                                const typeRadio = document.querySelector(`input[name="degreeType"][value="${type}"]`);
                                if (typeRadio) typeRadio.checked = true;

                                const courseContainer = document.getElementById('courseListContainer');
                                if (courseContainer && parsed.courses && Array.isArray(parsed.courses)) {
                                    courseContainer.innerHTML = '';
                                    parsed.courses.forEach((c, index) => {
                                        const div = document.createElement('div');
                                        div.className = 'nptel-row dynamic-entry-grid';
                                        div.style.marginBottom = '0.5rem';
                                        const certLink = getCertHtml(c.certificate_path);
                                        div.innerHTML = `<input type="text" class="nptel-course input-full" value="${c.name || ''}" placeholder="Course Name">
                                                           <input type="file" class="nptel-file input-full mt-1" accept=".pdf,.png,.jpg,.jpeg">
                                                           <input type="hidden" class="nptel-existing-path" value="${c.certificate_path || ''}">
                                                           ${certLink}
                                                           <div class="entry-actions" style="display:flex; gap:10px; margin-top:10px;">
                                                               <button type="button" class="btn-save-academic" data-type="nptel" data-index="${index}" style="background:#2563eb; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer;"><i class="fas fa-save"></i> Save</button>
                                                               <button type="button" class="btn-remove" title="Remove Course" style="position:static; padding:8px 16px;"><i class="fas fa-trash"></i> Remove</button>
                                                           </div>`;
                                        courseContainer.appendChild(div);
                                    });
                                }
                            } else {
                                // Fallback to Old String Format
                                const parts = data.honours_minors.split(':');
                                if (parts.length > 0) {
                                    const type = parts[0].trim();
                                    const typeRadio = document.querySelector(`input[name="degreeType"][value="${type}"]`);
                                    if (typeRadio) typeRadio.checked = true;
                                    if (parts[1]) {
                                        const courses = parts[1].split(',');
                                        const courseContainer = document.getElementById('courseListContainer');
                                        if (courseContainer) {
                                            courseContainer.innerHTML = '';
                                            courses.forEach(c => {
                                                const div = document.createElement('div');
                                                div.className = 'nptel-row dynamic-entry-grid';
                                                div.style.marginBottom = '0.5rem';
                                                div.innerHTML = `<input type="text" class="nptel-course input-full" value="${c.trim()}" placeholder="Course Name"><input type="file" class="nptel-file input-full mt-1">
                                                                   <button type="button" class="btn-remove" title="Remove Course"><i class="fas fa-times"></i></button>`;
                                                courseContainer.appendChild(div);
                                            });
                                        }
                                    }
                                }
                            }
                        } catch (e) {
                            console.error('Error parsing honours data', e);
                        }
                    } else {
                        const hNo = document.getElementById('honoursNo');
                        if (hNo) { hNo.checked = true; hNo.dispatchEvent(new Event('change')); }
                    }

                    // Competitive Exams
                    if (data.competitive_exams && data.competitive_exams !== 'No') {
                        const eYes = document.getElementById('examsYes');
                        if (eYes) { eYes.checked = true; eYes.dispatchEvent(new Event('change')); }

                        let parsed = null;
                        if (typeof data.competitive_exams === 'string' && data.competitive_exams.trim().startsWith('[')) {
                            try { parsed = JSON.parse(data.competitive_exams); } catch (e) { parsed = null; }
                        }

                        const examContainer = document.getElementById('examListContainer');
                        if (examContainer) {
                            examContainer.innerHTML = '';
                            if (Array.isArray(parsed)) {
                                // New JSON Format
                                parsed.forEach((ex, index) => {
                                    const div = document.createElement('div');
                                    div.className = 'exam-entry dynamic-entry-grid';
                                    div.style.marginBottom = '0.5rem';
                                    const certLink = getCertHtml(ex.certificate_path);
                                    div.innerHTML = `
                                            <input type="text" class="exam-name input-full" value="${ex.name || ''}" placeholder="Exam Name">
                                            <input type="text" class="exam-score input-full" value="${ex.score || ''}" placeholder="Rank / Score">
                                            <div style="grid-column: 1 / -1; margin-top: 0.5rem;">
                                                <input type="file" class="exam-file input-full" accept=".pdf,.png,.jpg,.jpeg">
                                                <input type="hidden" class="exam-existing-path" value="${ex.certificate_path || ''}">
                                                ${certLink}
                                            </div>
                                            <button type="button" class="btn-remove" title="Remove Exam"><i class="fas fa-times"></i></button>`;
                                    examContainer.appendChild(div);
                                });
                            } else if (data.competitive_exams && data.competitive_exams !== 'No') {
                                // Fallback to Old String Format
                                const examList = data.competitive_exams.split(',');
                                examList.forEach(ex => {
                                    const parts = ex.split(':');
                                    if (parts[0]) {
                                        const div = document.createElement('div');
                                        div.className = 'exam-entry dynamic-entry-grid';
                                        div.style.marginBottom = '0.5rem';
                                        div.innerHTML = `
                                                <input type="text" class="exam-name input-full" value="${parts[0]?.trim() || ''}" placeholder="Exam Name">
                                                <input type="text" class="exam-score input-full" value="${parts[1]?.trim() || ''}" placeholder="Rank / Score">
                                                <div style="grid-column: 1 / -1; margin-top: 0.5rem;">
                                                    <input type="file" class="exam-file input-full" accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
                                                </div>
                                                <button type="button" class="btn-remove" title="Remove Exam"><i class="fas fa-times"></i></button>`;
                                        examContainer.appendChild(div);
                                    }
                                });
                            }
                        }
                    } else {
                        const eNo = document.getElementById('examsNo');
                        if (eNo) { eNo.checked = true; eNo.dispatchEvent(new Event('change')); }
                    }
                }
            }
        } catch (e) {
            console.error('Error loading academic', e);
        }
    }


    // --- Honours/Minors UI Logic ---
    const honoursYes = document.getElementById('honoursYes');
    const honoursNo = document.getElementById('honoursNo');
    const honoursDetails = document.getElementById('honoursDetails');
    const addCourseBtn = document.getElementById('addCourseBtn');
    const courseContainer = document.getElementById('courseListContainer');

    const toggleHonours = () => {
        if (honoursYes.checked) {
            honoursDetails.classList.remove('hidden');
            if (courseContainer && courseContainer.children.length === 0) {
                addCourseBtn.click();
            }
        } else {
            honoursDetails.classList.add('hidden');
        }
    };

    if (honoursYes && honoursNo) {
        honoursYes.addEventListener('change', toggleHonours);
        honoursNo.addEventListener('change', toggleHonours);
    }

    if (addCourseBtn) {
        addCourseBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'nptel-row dynamic-entry-grid';
            div.innerHTML = `
                    <input type="text" class="nptel-course input-full" placeholder="Course Name">
                    <input type="file" class="nptel-file input-full mt-1" accept=".pdf,.png,.jpg,.jpeg">
                    <button type="button" class="btn-remove" title="Remove Course"><i class="fas fa-times"></i></button>
                `;
            courseContainer.appendChild(div);
        });
    }

    // --- Competitive Exams UI Logic ---
    const examsYes = document.getElementById('examsYes');
    const examsNo = document.getElementById('examsNo');
    const examDetails = document.getElementById('examDetails');
    const addExamBtn = document.getElementById('addExamBtn');
    const examContainer = document.getElementById('examListContainer');

    const toggleExams = () => {
        if (examsYes.checked) {
            examDetails.classList.remove('hidden');
            if (examContainer && examContainer.children.length === 0) {
                addExamBtn.click();
            }
        } else {
            examDetails.classList.add('hidden');
        }
    };

    if (examsYes && examsNo) {
        examsYes.addEventListener('change', toggleExams);
        examsNo.addEventListener('change', toggleExams);
    }

    if (addExamBtn) {
        addExamBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'exam-entry dynamic-entry-grid';
            div.innerHTML = `
                    <input type="text" class="exam-name input-full" placeholder="Exam Name (e.g. GATE)">
                    <input type="text" class="exam-score input-full" placeholder="Rank / Score">
                    <div style="grid-column: 1 / -1; margin-top: 0.5rem;">
                        <input type="file" class="exam-file input-full" accept=".pdf,.png,.jpg,.jpeg">
                    </div>
                    <button type="button" class="btn-remove" title="Remove Exam"><i class="fas fa-times"></i></button>
                `;
            examContainer.appendChild(div);
            div.querySelector('input').focus();
        });
    }


    // --- PDF DOWNLOAD ---
    const downloadBtn = document.getElementById('downloadPdfBtn');
    if (downloadBtn) {
        downloadBtn.addEventListener('click', () => {
            window.open('downloads/generate', '_blank');
        });
    }

    // --- Co-Curricular & Extracurricular Add/Save Logic ---

    // Master Save: Co-Curricular (CONSOLIDATED)
    const validateFiles = (files) => {
        const allowed = ['pdf', 'png', 'jpg', 'jpeg'];
        const maxSize = 5 * 1024 * 1024; // 5MB
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const ext = file.name.split('.').pop().toLowerCase();
            if (!allowed.includes(ext)) {
                return `Invalid file type: ${file.name}. Only PDF, PNG, JPG, and JPEG are allowed.`;
            }
            if (file.size > maxSize) {
                return `File too large: ${file.name}. Maximum size is 5MB.`;
            }
        }
        return null;
    };

    // Master Save: Co-Curricular (CONSOLIDATED)

    // Master Save: Extracurricular (CONSOLIDATED)


    // Papers
    const papersYes = document.getElementById('papersYes');
    const papersNo = document.getElementById('papersNo');
    const paperDetails = document.getElementById('paperDetails');
    const addPaperBtn = document.getElementById('addPaperBtn');
    const paperContainer = document.getElementById('paperListContainer');
    const savePapersBtn = document.getElementById('savePapersBtn');

    if (papersYes) {
        const toggle = () => {
            if (papersYes.checked) {
                paperDetails.classList.remove('hidden');
                if (paperContainer && paperContainer.children.length === 0) {
                    addPaperBtn.click();
                }
            } else {
                paperDetails.classList.add('hidden');
            }
        };
        papersYes.addEventListener('change', toggle);
        papersNo.addEventListener('change', toggle);
    }

    if (addPaperBtn) {
        addPaperBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'paper-entry dynamic-entry dynamic-entry-grid';
            div.innerHTML = `
                    <div>
                        <label class="form-label">Name of the Journal/Conference</label>
                        <textarea class="paper-journal input-full" rows="2" placeholder="Journal Name"></textarea>
                    </div>
                    <div>
                        <label class="form-label">Title of the paper and Authors</label>
                        <textarea class="paper-title input-full" rows="2" placeholder="Title & Authors"></textarea>
                    </div>
                    <div style="grid-column: 1 / -1;">
                        <input type="file" class="paper-file input-full" accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
                    </div>
                    <button type="button" class="btn-remove" title="Remove Paper"><i class="fas fa-times"></i></button>
                `;
            paperContainer.appendChild(div);
        });
    }

    // --- GLOBAL REMOVE HANDLER ---
    document.addEventListener('click', (e) => {
        const btn = e.target.closest('.btn-remove');
        if (!btn) return;

        const row = btn.closest('.dynamic-entry, .dynamic-entry-grid, .nptel-row, .exam-entry');
        if (row && confirm('Are you sure you want to remove this entry?')) {
            row.remove();
        }
    });



    // Inter-College
    const interYes = document.getElementById('interYes');
    const interNo = document.getElementById('interNo');
    const interDetails = document.getElementById('interDetails');
    const addInterBtn = document.getElementById('addInterBtn');
    const interContainer = document.getElementById('interListContainer');
    const saveInterBtn = document.getElementById('saveInterBtn');

    if (interYes) {
        const toggle = () => {
            if (interYes.checked) {
                interDetails.classList.remove('hidden');
                if (interContainer && interContainer.children.length === 0) {
                    addInterBtn.click();
                }
            } else {
                interDetails.classList.add('hidden');
            }
        };
        interYes.addEventListener('change', toggle);
        interNo.addEventListener('change', toggle);
    }

    if (addInterBtn) {
        addInterBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'inter-entry dynamic-entry dynamic-entry-grid';
            div.innerHTML = `
                    <div>
                        <label class="form-label">College Name</label>
                        <input type="text" class="inter-college input-full" placeholder="College Name">
                    </div>
                    <div style="grid-column: 1 / -1;">
                        <label class="form-label">Description (Event, Prize, etc)</label>
                        <input type="text" class="inter-desc input-full" placeholder="Details">
                        <input type="file" class="inter-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                    </div>
                    <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                `;
            interContainer.appendChild(div);
        });
    }

    // Removed individual saveInterBtn listener

    // Intra-Dept
    const intraDeptYes = document.getElementById('intraDeptYes');
    const intraDeptNo = document.getElementById('intraDeptNo');
    const intraDeptDetails = document.getElementById('intraDeptDetails');
    const addIntraDeptBtn = document.getElementById('addIntraDeptBtn');
    const intraDeptContainer = document.getElementById('intraDeptListContainer');
    const saveIntraDeptBtn = document.getElementById('saveIntraDeptBtn');

    if (intraDeptYes) {
        const toggle = () => {
            if (intraDeptYes.checked) {
                intraDeptDetails.classList.remove('hidden');
                if (intraDeptContainer && intraDeptContainer.children.length === 0) {
                    addIntraDeptBtn.click();
                }
            } else {
                intraDeptDetails.classList.add('hidden');
            }
        };
        intraDeptYes.addEventListener('change', toggle);
        intraDeptNo.addEventListener('change', toggle);
    }

    if (addIntraDeptBtn) {
        addIntraDeptBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'intra-dept-entry dynamic-entry dynamic-entry-grid';
            div.innerHTML = `
                    <div>
                        <label class="form-label">Event Name</label>
                        <input type="text" class="dept-event input-full" placeholder="Event Name">
                    </div>
                    <div style="grid-column: 1 / -1;">
                        <label class="form-label">Description / Prize</label>
                        <input type="text" class="dept-desc input-full" placeholder="Description">
                        <input type="file" class="dept-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                    </div>
                    <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
                `;
            intraDeptContainer.appendChild(div);
        });
    }



    // Seminars
    const seminarsYes = document.getElementById('seminarsYes');
    const seminarsNo = document.getElementById('seminarsNo');
    const seminarDetails = document.getElementById('seminarDetails');
    const addSeminarBtn = document.getElementById('addSeminarBtn');
    const seminarContainer = document.getElementById('seminarListContainer');
    const saveSeminarsBtn = document.getElementById('saveSeminarsBtn');

    if (seminarsYes) {
        const toggle = () => {
            if (seminarsYes.checked) {
                seminarDetails.classList.remove('hidden');
                if (seminarContainer && seminarContainer.children.length === 0) {
                    addSeminarBtn.click();
                }
            } else {
                seminarDetails.classList.add('hidden');
            }
        };
        seminarsYes.addEventListener('change', toggle);
        seminarsNo.addEventListener('change', toggle);
    }

    if (addSeminarBtn) {
        addSeminarBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'seminar-entry dynamic-entry';
            div.innerHTML = `
                <label class="form-label">Seminar Topic</label>
                <input type="text" class="seminar-topic input-full" placeholder="Enter Seminar Topic">
                <input type="file" class="seminar-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                <button type="button" class="btn-remove" title="Remove Seminar"><i class="fas fa-times"></i></button>
            `;
            seminarContainer.appendChild(div);
        });
    }



    // Class Rep
    const repYes = document.getElementById('repYes');
    const repNo = document.getElementById('repNo');
    const repDetails = document.getElementById('repDetails');
    const addRepBtn = document.getElementById('addRepBtn');
    const repContainer = document.getElementById('repListContainer');
    const saveRepBtn = document.getElementById('saveRepBtn');

    if (repYes) {
        const toggle = () => {
            if (repYes.checked) {
                repDetails.classList.remove('hidden');
                if (repContainer && repContainer.children.length === 0) {
                    addRepBtn.click();
                }
            } else {
                repDetails.classList.add('hidden');
            }
        };
        repYes.addEventListener('change', toggle);
        repNo.addEventListener('change', toggle);
    }

    if (addRepBtn) {
        addRepBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'rep-entry dynamic-entry';
            div.innerHTML = `
                <label class="form-label">Semester (e.g. 3, 4)</label>
                <input type="number" class="rep-semester input-full" placeholder="Enter Semester" min="1" max="8">
                <input type="file" class="rep-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            repContainer.appendChild(div);
        });
    }



    // Membership
    const membershipYes = document.getElementById('membershipYes');
    const membershipNo = document.getElementById('membershipNo');
    const membershipDetails = document.getElementById('membershipDetails');
    const addMembershipBtn = document.getElementById('addMembershipBtn');
    const membershipContainer = document.getElementById('membershipListContainer');
    const saveMembershipBtn = document.getElementById('saveMembershipBtn');

    if (membershipYes) {
        const toggle = () => {
            if (membershipYes.checked) {
                membershipDetails.classList.remove('hidden');
                if (membershipContainer && membershipContainer.children.length === 0) {
                    addMembershipBtn.click();
                }
            } else {
                membershipDetails.classList.add('hidden');
            }
        };
        membershipYes.addEventListener('change', toggle);
        membershipNo.addEventListener('change', toggle);
    }

    if (addMembershipBtn) {
        addMembershipBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'membership-entry dynamic-entry';
            div.innerHTML = `
                <label class="form-label">Professional Body Name</label>
                <input type="text" class="membership-name input-full" placeholder="Enter Body Name">
                <input type="file" class="membership-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            membershipContainer.appendChild(div);
        });
    }



    // MOOCs
    const moocsYes = document.getElementById('moocsYes');
    const moocsNo = document.getElementById('moocsNo');
    const moocsDetails = document.getElementById('moocsDetails');
    const addMoocsBtn = document.getElementById('addMoocsBtn');
    const moocsContainer = document.getElementById('moocsListContainer');
    const saveMoocsBtn = document.getElementById('saveMoocsBtn');

    if (moocsYes) {
        const toggle = () => {
            if (moocsYes.checked) {
                moocsDetails.classList.remove('hidden');
                if (moocsContainer && moocsContainer.children.length === 0) {
                    addMoocsBtn.click();
                }
            } else {
                moocsDetails.classList.add('hidden');
            }
        };
        moocsYes.addEventListener('change', toggle);
        moocsNo.addEventListener('change', toggle);
    }

    if (addMoocsBtn) {
        addMoocsBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'moocs-entry dynamic-entry';
            div.innerHTML = `
                <label class="form-label">Certification Name</label>
                <input type="text" class="moocs-name input-full" placeholder="Enter Certification Name">
                <input type="file" class="moocs-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            moocsContainer.appendChild(div);
        });
    }



    // Internship
    const internshipYes = document.getElementById('internshipYes');
    const internshipNo = document.getElementById('internshipNo');
    const internshipDetails = document.getElementById('internshipDetails');
    const addInternshipBtn = document.getElementById('addInternshipBtn');
    const internshipContainer = document.getElementById('internshipListContainer');
    const saveInternshipBtn = document.getElementById('saveInternshipBtn');

    if (internshipYes) {
        const toggle = () => {
            if (internshipYes.checked) {
                internshipDetails.classList.remove('hidden');
                if (internshipContainer && internshipContainer.children.length === 0) {
                    addInternshipBtn.click();
                }
            } else {
                internshipDetails.classList.add('hidden');
            }
        };
        internshipYes.addEventListener('change', toggle);
        internshipNo.addEventListener('change', toggle);
    }

    if (addInternshipBtn) {
        addInternshipBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'internship-entry dynamic-entry';
            div.innerHTML = `
                <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 10px;">
                    <div>
                        <label class="form-label">Internship/Consultancy</label>
                        <input type="text" class="internship-name input-full" placeholder="Enter Description">
                    </div>
                    <div>
                        <label class="form-label">Duration</label>
                        <input type="text" class="internship-duration input-full" placeholder="e.g. 2 months">
                    </div>
                </div>
                <input type="file" class="internship-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                <button type="button" class="btn-remove" title="Remove Internship"><i class="fas fa-times"></i></button>
            `;
            internshipContainer.appendChild(div);
        });
    }



    // Awards
    const awardsYes = document.getElementById('awardsYes');
    const awardsNo = document.getElementById('awardsNo');
    const awardsDetails = document.getElementById('awardsDetails');
    const addAwardsBtn = document.getElementById('addAwardsBtn');
    const awardsContainer = document.getElementById('awardsListContainer');
    const saveAwardsBtn = document.getElementById('saveAwardsBtn');

    if (awardsYes) {
        const toggle = () => {
            if (awardsYes.checked) {
                awardsDetails.classList.remove('hidden');
                if (awardsContainer && awardsContainer.children.length === 0) {
                    addAwardsBtn.click();
                }
            } else {
                awardsDetails.classList.add('hidden');
            }
        };
        awardsYes.addEventListener('change', toggle);
        awardsNo.addEventListener('change', toggle);
    }

    if (addAwardsBtn) {
        addAwardsBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'awards-entry dynamic-entry';
            div.innerHTML = `
                <label class="form-label">Award / Contribution</label>
                <input type="text" class="awards-name input-full" placeholder="Enter Details">
                <input type="file" class="awards-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            awardsContainer.appendChild(div);
        });
    }



    // --- Extracurricular UI Logic ---
    // University Team
    const uniTeamYes = document.getElementById('uniTeamYes');
    const uniTeamNo = document.getElementById('uniTeamNo');
    const uniTeamDetails = document.getElementById('uniTeamDetails');
    const addUniTeamBtn = document.getElementById('addUniTeamBtn');
    const uniTeamContainer = document.getElementById('uniTeamListContainer');
    const saveUniTeamBtn = document.getElementById('saveUniTeamBtn');

    if (uniTeamYes) {
        const toggle = () => {
            if (uniTeamYes.checked) {
                uniTeamDetails.classList.remove('hidden');
                if (uniTeamContainer && uniTeamContainer.children.length === 0) {
                    addUniTeamBtn.click();
                }
            } else {
                uniTeamDetails.classList.add('hidden');
            }
        };
        uniTeamYes.addEventListener('change', toggle);
        uniTeamNo.addEventListener('change', toggle);
    }

    if (addUniTeamBtn) {
        addUniTeamBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'uni-team-entry dynamic-entry dynamic-entry-grid';
            div.innerHTML = `
                <div>
                    <label class="form-label">Activity/Sport Name</label>
                    <input type="text" class="uni-team-name input-full" placeholder="Enter Activity Name">
                </div>
                <div>
                    <label class="form-label">Type</label>
                    <select class="uni-team-type input-full">
                        <option value="individual">Individual (3 Marks)</option>
                        <option value="group">Group (2 Marks)</option>
                    </select>
                </div>
                <div style="grid-column: 1 / -1;">
                    <input type="file" class="uni-team-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                </div>
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            uniTeamContainer.appendChild(div);
        });
    }



    // Outside College
    const outsideYes = document.getElementById('outsideYes');
    const outsideNo = document.getElementById('outsideNo');
    const outsideDetails = document.getElementById('outsideDetails');
    const addOutsideBtn = document.getElementById('addOutsideBtn');
    const outsideContainer = document.getElementById('outsideListContainer');
    const saveOutsideBtn = document.getElementById('saveOutsideBtn');

    if (outsideYes) {
        const toggle = () => {
            if (outsideYes.checked) {
                outsideDetails.classList.remove('hidden');
                if (outsideContainer && outsideContainer.children.length === 0) {
                    addOutsideBtn.click();
                }
            } else {
                outsideDetails.classList.add('hidden');
            }
        };
        outsideYes.addEventListener('change', toggle);
        outsideNo.addEventListener('change', toggle);
    }

    if (addOutsideBtn) {
        addOutsideBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'outside-entry dynamic-entry dynamic-entry-grid';
            div.innerHTML = `
                <div>
                    <label class="form-label">Event Name</label>
                    <input type="text" class="outside-name input-full" placeholder="Enter Event Name">
                </div>
                <div>
                    <label class="form-label">Achievement</label>
                    <select class="outside-type input-full">
                        <option value="participation">Participation (1 Mark)</option>
                        <option value="prize">I/II Prize Won (5 Marks)</option>
                    </select>
                </div>
                <div style="grid-column: 1 / -1;">
                    <input type="file" class="outside-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                </div>
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            outsideContainer.appendChild(div);
        });
    }



    // Within College
    const withinYes = document.getElementById('withinYes');
    const withinNo = document.getElementById('withinNo');
    const withinDetails = document.getElementById('withinDetails');
    const addWithinBtn = document.getElementById('addWithinBtn');
    const withinContainer = document.getElementById('withinListContainer');
    const saveWithinBtn = document.getElementById('saveWithinBtn');

    if (withinYes) {
        const toggle = () => {
            if (withinYes.checked) {
                withinDetails.classList.remove('hidden');
                if (withinContainer && withinContainer.children.length === 0) {
                    addWithinBtn.click();
                }
            } else {
                withinDetails.classList.add('hidden');
            }
        };
        withinYes.addEventListener('change', toggle);
        withinNo.addEventListener('change', toggle);
    }

    if (addWithinBtn) {
        addWithinBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'within-entry dynamic-entry dynamic-entry-grid';
            div.innerHTML = `
                <div>
                    <label class="form-label">Event Name</label>
                    <input type="text" class="within-name input-full" placeholder="Enter Event Name">
                </div>
                <div>
                    <label class="form-label">Achievement</label>
                    <select class="within-type input-full">
                        <option value="participation">Participation (1 Mark)</option>
                        <option value="prize">I/II Prize Won (2 Marks)</option>
                    </select>
                </div>
                <div style="grid-column: 1 / -1;">
                    <input type="file" class="within-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                </div>
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            withinContainer.appendChild(div);
        });
    }



    // Tech Fest 
    const techYes = document.getElementById('techYes');
    const techNo = document.getElementById('techNo');
    const techDetails = document.getElementById('techDetails');
    const addTechBtn = document.getElementById('addTechBtn');
    const techContainer = document.getElementById('techListContainer');
    const saveTechBtn = document.getElementById('saveTechBtn');

    if (techYes) {
        const toggle = () => {
            if (techYes.checked) {
                techDetails.classList.remove('hidden');
                if (techContainer && techContainer.children.length === 0) {
                    addTechBtn.click();
                }
            } else {
                techDetails.classList.add('hidden');
            }
        };
        techYes.addEventListener('change', toggle);
        techNo.addEventListener('change', toggle);
    }

    if (addTechBtn) {
        addTechBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'tech-entry dynamic-entry dynamic-entry-grid';
            div.innerHTML = `
                <div>
                    <label class="form-label">Role/Event</label>
                    <input type="text" class="tech-name input-full" placeholder="Enter Details">
                </div>
                <div>
                    <label class="form-label">Level</label>
                    <select class="tech-type input-full">
                        <option value="dept">Dept. Level (1 Mark)</option>
                        <option value="college">College Level (2 Marks)</option>
                    </select>
                </div>
                <div style="grid-column: 1 / -1;">
                    <input type="file" class="tech-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                </div>
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            techContainer.appendChild(div);
        });
    }



    // Other Coordinator
    const otherCoordYes = document.getElementById('otherCoordYes');
    const otherCoordNo = document.getElementById('otherCoordNo');
    const otherCoordDetails = document.getElementById('otherCoordDetails');
    const addOtherCoordBtn = document.getElementById('addOtherCoordBtn');
    const otherCoordContainer = document.getElementById('otherCoordListContainer');
    const saveOtherCoordBtn = document.getElementById('saveOtherCoordBtn');

    if (otherCoordYes) {
        const toggle = () => {
            if (otherCoordYes.checked) {
                otherCoordDetails.classList.remove('hidden');
                if (otherCoordContainer && otherCoordContainer.children.length === 0) {
                    addOtherCoordBtn.click();
                }
            } else {
                otherCoordDetails.classList.add('hidden');
            }
        };
        otherCoordYes.addEventListener('change', toggle);
        otherCoordNo.addEventListener('change', toggle);
    }

    if (addOtherCoordBtn) {
        addOtherCoordBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'other-coord-entry dynamic-entry dynamic-entry-grid';
            div.innerHTML = `
                <div>
                    <label class="form-label">Occasion/Role</label>
                    <input type="text" class="other-coord-name input-full" placeholder="Enter Occasion">
                </div>
                <div>
                    <label class="form-label">Level</label>
                    <select class="other-coord-type input-full">
                        <option value="dept">Dept. Level (1 Mark)</option>
                        <option value="college">College Level (2 Marks)</option>
                    </select>
                </div>
                <div style="grid-column: 1 / -1;">
                    <input type="file" class="other-coord-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                </div>
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            otherCoordContainer.appendChild(div);
        });
    }



    // Committee
    const committeeYes = document.getElementById('committeeYes');
    const committeeNo = document.getElementById('committeeNo');
    const committeeDetails = document.getElementById('committeeDetails');
    const addCommitteeBtn = document.getElementById('addCommitteeBtn');
    const committeeContainer = document.getElementById('committeeListContainer');
    const saveCommitteeBtn = document.getElementById('saveCommitteeBtn');

    if (committeeYes) {
        const toggle = () => {
            if (committeeYes.checked) {
                committeeDetails.classList.remove('hidden');
                if (committeeContainer && committeeContainer.children.length === 0) {
                    addCommitteeBtn.click();
                }
            } else {
                committeeDetails.classList.add('hidden');
            }
        };
        committeeYes.addEventListener('change', toggle);
        committeeNo.addEventListener('change', toggle);
    }

    if (addCommitteeBtn) {
        addCommitteeBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'committee-entry dynamic-entry';
            div.innerHTML = `
                <label class="form-label">Committee Name</label>
                <input type="text" class="committee-name input-full" placeholder="Enter Committee Name">
                <input type="file" class="committee-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            committeeContainer.appendChild(div);
        });
    }



    // NSS
    const nssYes = document.getElementById('nssYes');
    const nssNo = document.getElementById('nssNo');
    const nssDetails = document.getElementById('nssDetails');
    const addNssBtn = document.getElementById('addNssBtn');
    const nssContainer = document.getElementById('nssListContainer');
    const saveNssBtn = document.getElementById('saveNssBtn');

    if (nssYes) {
        const toggle = () => {
            if (nssYes.checked) {
                nssDetails.classList.remove('hidden');
                if (nssContainer && nssContainer.children.length === 0) {
                    addNssBtn.click();
                }
            } else {
                nssDetails.classList.add('hidden');
            }
        };
        nssYes.addEventListener('change', toggle);
        nssNo.addEventListener('change', toggle);
    }

    if (addNssBtn) {
        addNssBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'nss-entry dynamic-entry';
            div.innerHTML = `
                <label class="form-label">About Activity</label>
                <input type="text" class="nss-name input-full" placeholder="Enter Activity Description">
                <input type="file" class="nss-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            nssContainer.appendChild(div);
        });
    }



    // Ext Awards
    const extAwardsYes = document.getElementById('extAwardsYes');
    const extAwardsNo = document.getElementById('extAwardsNo');
    const extAwardsDetails = document.getElementById('extAwardsDetails');
    const addExtAwardsBtn = document.getElementById('addExtAwardsBtn');
    const extAwardsContainer = document.getElementById('extAwardsListContainer');
    const saveExtAwardsBtn = document.getElementById('saveExtAwardsBtn');

    if (extAwardsYes) {
        const toggle = () => {
            if (extAwardsYes.checked) {
                extAwardsDetails.classList.remove('hidden');
                if (extAwardsContainer && extAwardsContainer.children.length === 0) {
                    addExtAwardsBtn.click();
                }
            } else {
                extAwardsDetails.classList.add('hidden');
            }
        };
        extAwardsYes.addEventListener('change', toggle);
        extAwardsNo.addEventListener('change', toggle);
    }

    if (addExtAwardsBtn) {
        addExtAwardsBtn.addEventListener('click', () => {
            const div = document.createElement('div');
            div.className = 'ext-awards-entry dynamic-entry';
            div.innerHTML = `
                <label class="form-label">Award/Contribution</label>
                <input type="text" class="ext-awards-name input-full" placeholder="Enter Details">
                <input type="file" class="ext-awards-file input-full mt-2" accept=".pdf,.png,.jpg,.jpeg">
                <button type="button" class="btn-remove" title="Remove Entry"><i class="fas fa-times"></i></button>
            `;
            extAwardsContainer.appendChild(div);
        });
    }



    // Final Submit
    // --- DECLARATION LOGIC ---
    // Signature Preview
    const declSigInput = document.getElementById('declSignature');
    if (declSigInput) {
        declSigInput.addEventListener('change', (e) => {
            const file = e.target.files[0];
            const preview = document.getElementById('signaturePreview');
            const img = preview.querySelector('img');

            if (file) {
                const reader = new FileReader();
                reader.onload = (ev) => {
                    img.src = ev.target.result;
                    preview.style.display = 'block';
                }
                reader.readAsDataURL(file);
            } else {
                preview.style.display = 'none';
            }
        });
    }

    // --- RECOMMENDATION LETTER LOGIC ---
    // File Preview
    const recFile = document.getElementById('recLetterFile');
    if (recFile) {
        recFile.addEventListener('change', (e) => {
            const fileName = e.target.files[0]?.name;
            const preview = document.getElementById('recLetterPreview');
            if (fileName) {
                document.getElementById('recFileName').innerText = fileName;
                preview.style.display = 'block';
            } else {
                preview.style.display = 'none';
            }
        });
    }

    // Save Recommendation
    const saveRecBtn = document.getElementById('saveRecBtn');
    if (saveRecBtn) {
        saveRecBtn.addEventListener('click', async (e) => {
            e.preventDefault();
            const btn = saveRecBtn;
            const originalText = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
            btn.disabled = true;

            const fileInput = document.getElementById('recLetterFile');
            if (!fileInput.files[0]) {
                alert('Please select a file to upload.');
                btn.innerHTML = originalText;
                btn.disabled = false;
                return;
            }

            const validationError = validateFiles(fileInput.files);
            if (validationError) {
                alert(validationError);
                btn.innerHTML = originalText;
                btn.disabled = false;
                return;
            }

            const fd = new FormData();
            fd.append('recommendation_letter', fileInput.files[0]);

            try {
                const res = await fetch(apiBase + '/student/recommendation', {
                    method: 'POST',
                    body: fd
                });
                if (res.ok) {
                    alert('Recommendation Letter uploaded successfully!');
                    location.reload();
                } else {
                    let errMsg = 'Upload failed';
                    try {
                        const errData = await res.json();
                        errMsg = errData.error || errMsg;
                    } catch (e) {
                        const raw = await res.text();
                        if (raw) errMsg = raw.substring(0, 100);
                    }
                    alert(errMsg);
                }
            } catch (error) {
                console.error(error);
                alert('Network error.');
            } finally {
                btn.innerHTML = originalText;
                btn.disabled = false;
            }
        });
    }

    // Final Submit
    function validateFinalSubmit() {
        const place = document.getElementById('declPlace').value.trim();
        const sigInput = document.getElementById('declSignature');
        const isChecked = document.getElementById('declCheck').checked;
        const submitBtn = document.getElementById('finalSubmitBtn');
        const sigPreview = document.getElementById('signaturePreview');
        const hasSignature = (sigInput.files && sigInput.files[0]) || (sigPreview && sigPreview.style.display !== 'none');

        if (place && hasSignature && isChecked) {
            submitBtn.disabled = false;
            submitBtn.style.opacity = '1';
        } else {
            submitBtn.disabled = true;
            submitBtn.style.opacity = '0.5';
        }
    }

    if (declPlace) declPlace.addEventListener('input', validateFinalSubmit);
    if (declCheck) declCheck.addEventListener('change', validateFinalSubmit);
    if (declSigInput) declSigInput.addEventListener('change', validateFinalSubmit);

    const finalSubmitBtn = document.getElementById('finalSubmitBtn');
    if (finalSubmitBtn) {
        finalSubmitBtn.addEventListener('click', async () => {
            if (finalSubmitBtn.disabled) return;

            const btn = finalSubmitBtn;
            const originalText = btn.innerHTML;

            const place = document.getElementById('declPlace').value.trim();
            const date = document.getElementById('declDate').value.trim();
            const sigFile = document.getElementById('declSignature').files[0];
            const isChecked = document.getElementById('declCheck').checked;
            const sigPreview = document.getElementById('signaturePreview');
            const hasExistingSig = sigPreview && sigPreview.style.display !== 'none';

            if (!isChecked || !place || (!sigFile && !hasExistingSig)) {
                alert('Please ensure Place is entered, Signature is uploaded, and Declaration is checked.');
                return;
            }

            if (sigFile) {
                const validationError = validateFiles([sigFile]);
                if (validationError) {
                    alert(validationError);
                    return;
                }
            }

            if (!confirm('Are you sure you want to submit your application? Once submitted, you cannot make changes.')) return;

            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Submitting...';
            btn.disabled = true;

            const fd = new FormData();
            fd.append('declaration_place', place);
            fd.append('declaration_date', date);
            if (sigFile) fd.append('signature', sigFile);

            try {
                const res = await fetch(apiBase + '/student/submit', {
                    method: 'POST',
                    body: fd
                });

                let data;
                const text = await res.text();
                try {
                    data = JSON.parse(text);
                } catch (e) {
                    console.error('Invalid JSON response:', text);
                    throw new Error('Server returned an unexpected response format.');
                }

                if (res.ok) {
                    alert(data.message || 'Application submitted successfully!');
                    window.location.reload();
                } else {
                    alert('Error: ' + (data.error || 'Submission failed'));
                }
            } catch (err) {
                console.error(err);
                alert('Submission Error: ' + err.message);
                btn.innerHTML = originalText;
                btn.disabled = false;
                validateFinalSubmit();
            }
        });
    }

    // Call validation on load in case browser pre-filled fields
    setTimeout(validateFinalSubmit, 500);


    // --- ACADEMIC FORM GLOBAL LISTENER ---
    const academicForm = document.getElementById('academicForm');
    if (academicForm) {
        academicForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const btn = academicForm.querySelector('button[type="submit"]');
            const originalText = btn ? btn.innerHTML : 'Save Academic Details';
            if (btn) {
                btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
                btn.disabled = true;
            }

            const fd = new FormData();
            fd.append('cgpa', safeGet('cgpa'));
            for (let i = 1; i <= 7; i++) fd.append(`sgpa_sem${i}`, safeGet(`sgpa${i}`));

            try {
                const res = await fetch(apiBase + '/student/academic', { method: 'POST', body: fd });
                if (res.ok) {
                    alert('Academic SGPA Details Saved');
                } else {
                    let errMsg = 'Server error saving academic details';
                    try {
                        const data = await res.json();
                        errMsg = data.error || errMsg;
                    } catch (e) {
                        const raw = await res.text();
                        if (raw) errMsg = raw.substring(0, 100);
                    }
                    alert(errMsg);
                }
            } catch (err) {
                console.error(err);
                alert('Network error: ' + err.message);
            } finally {
                if (btn) {
                    btn.innerHTML = originalText;
                    btn.disabled = false;
                }
            }
        });
    }

    // --- SECTION SAVING SYSTEM ---

    async function saveSection(btn, containerId, category, type = 'co_curricular') {
        const container = document.getElementById(containerId);
        if (!container) return;

        const entries = container.querySelectorAll('.dynamic-entry');

        const originalText = btn.innerHTML;
        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
        btn.disabled = true;

        const fd = new FormData();
        fd.append('type', type);
        fd.append('activity_type', category);

        const dataArr = [];
        let hasError = false;

        entries.forEach((row, index) => {
            const entryId = row.querySelector('.entry-id')?.value || '';
            const nameInput = row.querySelector('input[type="text"]:not(.existing-path), textarea:not(.existing-path)');
            const name = nameInput?.value.trim() || '';

            if (!name) return; // Skip empty entries

            let description = '';
            let score = 1;
            let level = 'Participant';

            // Category specific logic
            if (row.classList.contains('inter-entry') || row.classList.contains('intra-dept-entry')) {
                description = row.querySelector('.inter-desc, .dept-desc')?.value.trim() || '';
            } else if (row.classList.contains('rep-entry')) {
                const sem = row.querySelector('.rep-semester')?.value || '';
                description = sem ? `Semester ${sem}` : '';
            } else if (row.classList.contains('internship-entry')) {
                const dur = row.querySelector('.internship-duration')?.value.trim() || '';
                description = dur ? `Duration: ${dur}` : '';
            } else if (row.querySelector('select')) {
                const sel = row.querySelector('select');
                const val = sel.value;
                description = sel.options[sel.selectedIndex].text;
                if (val === 'individual') { score = 3; level = 'Individual'; }
                else if (val === 'group') { score = 2; level = 'Group'; }
                else if (val === 'prize') {
                    if (category.includes('Outside')) { score = 5; level = 'Winner'; }
                    else { score = 2; level = 'Winner'; }
                }
                else if (val === 'college') { score = 2; level = 'College'; }
            }

            const itemData = { id: entryId, name: name, description: description, level: level, score: score };

            const fileInput = row.querySelector('input[type="file"]');
            if (fileInput?.files[0]) {
                const vErr = validateFiles(fileInput.files);
                if (vErr) { alert(`Error in entry ${index + 1}: ${vErr}`); hasError = true; return; }
                fd.append(`file_${index}`, fileInput.files[0]);
            }

            dataArr.push(itemData);
        });

        if (hasError) { btn.innerHTML = originalText; btn.disabled = false; return; }

        fd.append('entries', JSON.stringify(dataArr));

        try {
            const res = await fetch(apiBase + '/student/activities/save-section', { method: 'POST', body: fd });
            const data = await res.json();
            if (res.ok) {
                alert(`${category} section saved successfully!`);
                location.reload();
            } else { alert('Error: ' + (data.error || 'Failed to save section')); }
        } catch (e) { console.error(e); alert('Network error.'); } finally {
            btn.innerHTML = originalText; btn.disabled = false;
        }
    }

    async function saveAcademicSection(btn, containerId, itemType) {
        const container = document.getElementById(containerId);
        if (!container) return;
        const entries = container.querySelectorAll('.nptel-row, .exam-entry');

        const originalText = btn.innerHTML;
        btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Saving...';
        btn.disabled = true;

        const fd = new FormData();
        fd.append('item_type', itemType);

        const dataArr = [];
        let hasError = false;

        entries.forEach((row, index) => {
            let itemData = {};
            if (itemType === 'nptel') {
                const input = row.querySelector('.nptel-name, .nptel-course');
                const name = input?.value.trim() || '';
                if (!name) return;
                itemData = { name: name };
            } else {
                const name = row.querySelector('.exam-name')?.value.trim() || '';
                if (!name) return;
                itemData = { name: name, score: row.querySelector('.exam-score')?.value.trim() || '' };
            }

            const fileInput = row.querySelector('input[type="file"]');
            if (fileInput?.files[0]) {
                const vErr = validateFiles(fileInput.files);
                if (vErr) { alert(`Error in entry ${index + 1}: ${vErr}`); hasError = true; return; }
                fd.append(`file_${index}`, fileInput.files[0]);
            }
            dataArr.push(itemData);
        });

        if (hasError) { btn.innerHTML = originalText; btn.disabled = false; return; }
        if (itemType === 'nptel') {
            fd.append('honours_minors_type', document.querySelector('input[name="degreeType"]:checked')?.value || 'Honours');
        }

        fd.append('entries', JSON.stringify(dataArr));

        try {
            const res = await fetch(apiBase + '/student/academic/save-section', { method: 'POST', body: fd });
            const data = await res.json();
            if (res.ok) {
                alert('Academic section saved successfully!');
                location.reload();
            } else { alert('Error: ' + (data.error || 'Failed to save')); }
        } catch (e) { alert('Connection error.'); } finally {
            btn.innerHTML = originalText; btn.disabled = false;
        }
    }

    // Wire up section save buttons
    const sectionButtons = [
        { id: 'saveHonoursBtn', container: 'courseListContainer', cat: 'nptel', isAcad: true },
        { id: 'saveExamsBtn', container: 'examListContainer', cat: 'exam', isAcad: true },
        { id: 'savePapersBtn', container: 'paperListContainer', cat: 'Papers Published' },
        { id: 'saveInterBtn', container: 'interListContainer', cat: 'Inter-College Activity' },
        { id: 'saveIntraBtn', container: 'intraDeptListContainer', cat: 'Intra-Department Winner' },
        { id: 'saveSeminarsBtn', container: 'seminarListContainer', cat: 'Seminars Delivered' },
        { id: 'saveRepBtn', container: 'repListContainer', cat: 'Class Representative' },
        { id: 'saveMembershipBtn', container: 'membershipListContainer', cat: 'Professional Body Membership' },
        { id: 'saveMoocsBtn', container: 'moocsListContainer', cat: 'MOOCs Certification' },
        { id: 'saveInternshipBtn', container: 'internshipListContainer', cat: 'Internship/Consultancy' },
        { id: 'saveAwardsBtn', container: 'awardsListContainer', cat: 'Award/Contribution' },
        { id: 'saveUniTeamBtn', container: 'uniTeamListContainer', cat: 'University Team Selection', type: 'extracurricular' },
        { id: 'saveOutsideBtn', container: 'outsideListContainer', cat: 'Outside College Activity', type: 'extracurricular' },
        { id: 'saveWithinBtn', container: 'withinListContainer', cat: 'Within College Activity', type: 'extracurricular' },
        { id: 'saveTechBtn', container: 'techListContainer', cat: 'Tech Fest Coordinator', type: 'extracurricular' },
        { id: 'saveOtherCoordBtn', container: 'otherCoordListContainer', cat: 'Other Coordinator', type: 'extracurricular' },
        { id: 'saveCommitteeBtn', container: 'committeeListContainer', cat: 'Committee Member', type: 'extracurricular' },
        { id: 'saveNssBtn', container: 'nssListContainer', cat: 'NSS/Social Service', type: 'extracurricular' },
        { id: 'saveExtAwardsBtn', container: 'extAwardsListContainer', cat: 'Extracurricular Award', type: 'extracurricular' }
    ];

    sectionButtons.forEach(config => {
        const btn = document.getElementById(config.id);
        if (btn) {
            btn.addEventListener('click', () => {
                if (config.isAcad) {
                    saveAcademicSection(btn, config.container, config.cat);
                } else {
                    saveSection(btn, config.container, config.cat, config.type || 'co_curricular');
                }
            });
        }
    });


    // Initialize
    initDashboard();

});
