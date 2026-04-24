<!-- src/includes/modals.php -->
<!-- Topper CGPA Modal -->
<div id="topperModal" class="modal-overlay" style="display: none; align-items: center; justify-content: center; padding: 1rem;">
    <div class="modal-content" style="width: 100%; max-width: 500px; padding: 1.5rem; max-height: 90vh; display: flex; flex-direction: column; overflow: hidden;">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:1rem; flex-shrink: 0;">
            <h3 style="margin:0;"><i class="fa-solid fa-ranking-star" style="color:var(--primary-color);"></i> Set Topper CGPAs</h3>
            <button class="btn-close" onclick="closeTopperModal()"></button>
        </div>
        <p style="color:var(--text-muted); font-size:0.9rem; margin-bottom:1rem; flex-shrink: 0;">
            Set the baseline for calculating the Academic CGPA Score (Max-55).
        </p>
        <form id="topperForm" style="display: flex; flex-direction: column; overflow: hidden; flex: 1;">
            <div id="topperInputsContainer" style="overflow-y: auto; padding-right: 10px; margin-bottom: 5px; flex: 1;">
                <div style="text-align:center;"><i class="fa-solid fa-spinner fa-spin"></i> Loading...</div>
            </div>
            <div style="display:flex; justify-content:flex-end; gap:1rem; margin-top:1rem; padding-top: 1rem; border-top: 1px solid var(--border-color); flex-shrink: 0;">
                <button type="button" class="btn-secondary" onclick="closeTopperModal()" style="border:none; background:transparent; color:#64748b; cursor:pointer;">Cancel</button>
                <button type="submit" class="btn-primary" style="padding: 0.5rem 1rem; border-radius: 6px; cursor:pointer;"><i class="fa-solid fa-save"></i> Save Configuration</button>
            </div>
        </form>
    </div>
</div>

<!-- Panel Members Modal -->
<div id="panelModal" class="modal-overlay" style="display: none; align-items: center; justify-content: center; padding: 1rem;">
    <div class="modal-content" style="width: 100%; max-width: 500px; padding: 1.5rem; max-height: 90vh; display: flex; flex-direction: column; overflow: hidden;">
        <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:1rem; flex-shrink: 0;">
            <h3 style="margin:0;"><i class="fa-solid fa-id-card-clip" style="color:var(--primary-color);"></i> Manage Panel Names</h3>
            <button class="btn-close" onclick="closePanelModal()"></button>
        </div>
        <p style="color:var(--text-muted); font-size:0.9rem; margin-bottom:1rem; flex-shrink: 0;">
            Set the actual names for the panel members. These names will appear in the evaluation details.
        </p>
        <form id="panelForm" style="display: flex; flex-direction: column; overflow: hidden; flex: 1;">
            <div id="panelInputsContainer" style="overflow-y: auto; padding-right: 10px; margin-bottom: 5px; flex: 1;">
                <div style="text-align:center;"><i class="fa-solid fa-spinner fa-spin"></i> Loading...</div>
            </div>
            <div style="display:flex; justify-content:flex-end; gap:1rem; margin-top:1rem; padding-top: 1rem; border-top: 1px solid var(--border-color); flex-shrink: 0;">
                <button type="button" class="btn-secondary" onclick="closePanelModal()" style="border:none; background:transparent; color:#64748b; cursor:pointer;">Cancel</button>
                <button type="submit" class="btn-primary" style="padding: 0.5rem 1rem; border-radius: 6px; cursor:pointer;"><i class="fa-solid fa-save"></i> Save Names</button>
            </div>
        </form>
    </div>
</div>
