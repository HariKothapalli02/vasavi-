
const apiBase = (window.APP_BASE_URL || "").replace(/\/$/, "");

document.addEventListener('DOMContentLoaded', () => {
    // Logout
    const logoutBtn = document.getElementById('logoutBtn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', async () => {
            await fetch(apiBase + '/auth/logout', { method: 'POST' });
            window.location.href = apiBase + '/index.php';
        });
    }

    loadStudents();
});

async function loadStudents() {
    const list = document.getElementById('studentList');
    const loading = document.getElementById('loading');

    try {
        const res = await fetch(apiBase + '/panel/students');

        if (!res.ok) {
            const errorData = await res.json().catch(() => ({}));
            throw new Error(errorData.error || `Server returned ${res.status}`);
        }

        const students = await res.json();

        loading.style.display = 'none';

        if (!students || !Array.isArray(students) || students.length === 0) {
            list.innerHTML = `
                <div class="empty-state">
                    <i class="fa-solid fa-clipboard-check"></i>
                    <h3>No students assigned yet</h3>
                    <p>When the Super Admin assigns students to your panel, they will appear here.</p>
                </div>
            `;
            return;
        }

        list.innerHTML = students.map(s => {
            const isEvaluated = s.is_evaluated > 0;
            const badge = isEvaluated
                ? '<span style="background: #10b981; color: white; font-size: 0.75rem; padding: 4px 10px; border-radius: 20px; font-weight: 600;">Evaluated</span>'
                : '<span style="background: #f59e0b; color: white; font-size: 0.75rem; padding: 4px 10px; border-radius: 20px; font-weight: 600;">Pending</span>';

            return `
                <a href="panel-evaluate.php?id=${s.id}" class="student-item" style="text-decoration:none; color:inherit; display:flex; justify-content:space-between; align-items:center;">
                    <div style="display: flex; align-items: center; gap: 1rem;">
                        <div style="width: 40px; height: 40px; background: #e2e8f0; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: 700; color: #64748b; flex-shrink: 0;">
                            ${(s.name || '?').charAt(0)}
                        </div>
                        <div style="min-width: 0;">
                            <div style="font-weight: 600; font-size: 1.05rem; color: var(--text-dark); white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${s.name}</div>
                            <div style="font-size: 0.85rem; color: var(--text-muted); white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${s.roll_number} &bull; ${s.department}</div>
                        </div>
                    </div>
                    <div style="margin-left: 10px; flex-shrink: 0;">
                        ${badge}
                    </div>
                </a>
            `;
        }).join('');

    } catch (err) {
        console.error('Students load error:', err);
        if (loading) loading.style.display = 'none';
        if (list) {
            list.innerHTML = `
                <div style="padding: 2rem; text-align: center; color: #ef4444;">
                    <i class="fa-solid fa-circle-exclamation" style="font-size: 2rem; margin-bottom: 1rem;"></i>
                    <p style="font-weight: 600;">Failed to load students</p>
                    <p style="font-size: 0.85rem; opacity: 0.8;">${err.message}</p>
                </div>
            `;
        }
    }
}
