<?php require_once __DIR__ . '/src/includes/auth_check.php'; require_auth(['student']); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard | Best Outgoing Student</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
    </script>
</head>

<body class="admin-body">
    <div class="dashboard-container">
        <!-- Sidebar -->
        <nav class="sidebar">
            <div class="sidebar-header">
                <div class="logo-icon">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                <div class="header-text">
                    <h2 style="color: var(--text-main);">Student Portal</h2>
                    <span style="font-size: 0.8rem; color: var(--text-muted);">Best Outgoing Student</span>
                </div>
            </div>

            <div class="nav-links">
                <button class="nav-item tab-btn active" data-tab="profile">
                    <i class="fas fa-user-circle"></i>
                    <span>My Profile</span>
                </button>
                <button class="nav-item tab-btn" data-tab="academic">
                    <i class="fas fa-book-open"></i>
                    <span>Academic Records</span>
                </button>
                <button class="nav-item tab-btn" data-tab="co-curricular">
                    <i class="fas fa-trophy"></i>
                    <span>Co-Curricular</span>
                </button>
                <button class="nav-item tab-btn" data-tab="extracurricular">
                    <i class="fas fa-running"></i>
                    <span>Extracurricular</span>
                </button>
                <button class="nav-item tab-btn" data-tab="recommendation">
                    <i class="fas fa-file-signature"></i>
                    <span>Declaration</span>
                </button>
            </div>

            <div class="sidebar-footer">
                <a href="downloads/generate" target="_blank" class="btn-primary"
                    style="justify-content: center; text-decoration: none;">
                    <i class="fas fa-file-pdf"></i> <span>Download PDF</span>
                </a>
                <button id="logoutBtn" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </button>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Top Bar -->
            <header class="top-bar">
                <div class="welcome-text"></div>
            </header>

            <!-- Profile Tab -->
            <div id="profile" class="tab-content active">
                <div class="glass-card">
                    <div class="card-header">
                        <h2><i class="fas fa-id-card" style="color: var(--primary-color);"></i> Personal Information
                        </h2>
                    </div>
                    <div style="padding: 2rem;">
                        <div id="debug-info"></div>
                        <form id="profileInlineForm">
                            <div class="profile-grid">
                                <div class="form-group"
                                    style="grid-column: 1 / -1; display: flex; flex-direction: column; align-items: center; justify-content: center; margin-bottom: 1.5rem;">
                                    <div class="profile-photo-container">
                                        <img id="pPhotoPreview"
                                            src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                                            alt="Profile Photo">
                                    </div>
                                    <input type="file" id="pPhoto" accept=".pdf,.doc,.docx,.jpg,.jpeg,.png"
                                        style="margin-top: 0.5rem; max-width: 250px;">
                                    <small style="color: var(--text-muted);">Recommended: Square Image (JPG/PNG) or Document (PDF/DOC)</small>
                                </div>
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input type="text" id="pName" placeholder="Your full name" readonly disabled style="opacity: 0.7;">
                                </div>
                                <div class="form-group">
                                    <label>Department</label>
                                    <input type="text" id="pDept" placeholder="Your department" readonly disabled style="opacity: 0.7;">
                                </div>
                                <div class="form-group">
                                    <label>Roll Number</label>
                                    <input type="text" id="pRoll" placeholder="Your roll number" readonly disabled style="opacity: 0.7;">
                                </div>
                                <div class="form-group">
                                    <label>Contact Number</label>
                                    <input type="tel" id="pContact" placeholder="Your contact number" readonly disabled style="opacity: 0.7;">
                                </div>
                                <div class="form-group">
                                    <label>Email Id</label>
                                    <input type="email" id="pEmail" placeholder="Your email address" readonly disabled style="opacity: 0.7;">
                                </div>
                                <div class="form-group" style="grid-column: 1 / -1;">
                                    <label>About Me (Bio)</label>
                                    <textarea id="pBio" rows="4" maxlength="1000"
                                        placeholder="Briefly describe your achievements and goals..."></textarea>
                                    <div
                                        style="text-align: right; font-size: 0.85rem; color: var(--text-muted); margin-top: 0.25rem;">
                                        <span id="bioCharCount">0</span>/1000
                                    </div>
                                </div>
                            </div>
                            <button id="saveProfileBtn" class="btn-primary" style="margin-top: 2rem; width: 100%; font-size: 1.1rem; padding: 1rem;">
                                <i class="fas fa-save"></i> Save Profile
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Academic Tab -->
            <div id="academic" class="tab-content">
                <div class="glass-card">
                    <div class="card-header">
                        <h2><i class="fas fa-graduation-cap" style="color: var(--primary-color);"></i> Academic Details
                        </h2>
                    </div>
                    <div style="padding: 2rem;">
                        <form id="academicForm">
                            <div class="form-group">
                                <label
                                    style="font-size: 1.1rem; margin-bottom: 1rem; border-bottom: 1px solid var(--border-color); padding-bottom: 0.5rem;">Semester
                                    Wise SGPA</label>
                                <div class="dashboard-grid">
                                    <!-- SGPA Inputs -->
                                    <div><label>Sem 1</label><input type="number" step="0.01" id="sgpa1"
                                            placeholder="0.00" class="locked-field" disabled></div>
                                    <div><label>Sem 2</label><input type="number" step="0.01" id="sgpa2"
                                            placeholder="0.00" class="locked-field" disabled></div>
                                    <div><label>Sem 3</label><input type="number" step="0.01" id="sgpa3"
                                            placeholder="0.00" class="locked-field" disabled></div>
                                    <div><label>Sem 4</label><input type="number" step="0.01" id="sgpa4"
                                            placeholder="0.00" class="locked-field" disabled></div>
                                    <div><label>Sem 5</label><input type="number" step="0.01" id="sgpa5"
                                            placeholder="0.00" class="locked-field" disabled></div>
                                    <div><label>Sem 6</label><input type="number" step="0.01" id="sgpa6"
                                            placeholder="0.00" class="locked-field" disabled></div>
                                    <div><label>Sem 7</label><input type="number" step="0.01" id="sgpa7"
                                            placeholder="0.00" class="locked-field" disabled></div>
                                    <!-- Removed Sem 8 -->
                                </div>
                            </div>

                            <div class="form-group cgpa-input-group">
                                <label for="cgpa" style="font-weight: 700;">Overall CGPA (out of 10) <br><small
                                        style="color: var(--text-muted); font-weight: 400;">(Max-55 Marks in
                                        evaluation)</small></label>
                                <input type="number" step="0.01" id="cgpa" placeholder="Enter CGPA"
                                    style="font-size: 1.2rem; font-weight: bold; color: var(--primary-color);" class="locked-field" disabled>
                            </div>

                            <!-- Removed Backlogs -->

                            <div style="background: rgba(255, 193, 7, 0.1); border-left: 4px solid #ffc107; padding: 1rem; margin: 1rem 0; border-radius: 4px;">
                                <p style="margin: 0; color: #856404; font-size: 0.9rem;">
                                    <i class="fas fa-info-circle"></i> <strong>Note:</strong> Your academic data (SGPA and CGPA) has been pre-loaded from official records and cannot be modified.
                                </p>
                            </div>

                            <!-- Honours/Minors -->
                            
                                <div class="form-group">
                                    <label>Pursuing Honours/Minors Degree (05 Marks)</label>
                                    <div style="display: flex; gap: 2rem; margin-top: 0.5rem;">
                                        <label style="display:flex; align-items:center; cursor:pointer;">
                                            <input type="radio" name="pursuingHonours" value="yes" id="honoursYes">
                                            <span style="margin-left: 0.5rem;">Yes</span>
                                        </label>
                                        <label style="display:flex; align-items:center; cursor:pointer;">
                                            <input type="radio" name="pursuingHonours" value="no" id="honoursNo"
                                                checked>
                                            <span style="margin-left: 0.5rem;">No</span>
                                        </label>
                                    </div>
                                </div>
                                <div id="honoursDetails" class="hidden"
                                    style="margin-top: 1rem; padding-top: 1rem; border-top: 1px dashed var(--border-color);">
                                    <div class="form-group">
                                        <label>Degree Type</label>
                                        <div style="display: flex; gap: 2rem;">
                                            <label><input type="radio" name="degreeType" value="Honours" checked>
                                                Honours</label>
                                            <label><input type="radio" name="degreeType" value="Minors"> Minors</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>NPTEL Courses Completed</label>
                                        <div id="courseListContainer">
                                            <div class="nptel-row dynamic-entry-grid" style="margin-bottom: 0.5rem;">
                                                <input type="text" class="nptel-course input-full"
                                                    placeholder="Enter NPTEL Course Name">
                                                <input type="file" class="nptel-file input-full mt-1"
                                                    accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
                                                <button type="button" class="btn-remove" title="Remove Course"><i class="fas fa-times"></i></button>
                                            </div>
                                        </div>
                                        <button type="button" id="addCourseBtn" class="btn-secondary"><i
                                                class="fas fa-plus"></i> Add Course</button>
                                    </div>
                                </div>
                            

                            <!-- Competitive Exams -->
                            
                                <div class="form-group">
                                    <label>Qualification in GATE/CAT/MAT/GRE etc. (05 Marks)</label>
                                    <div style="display: flex; gap: 2rem; margin-top: 0.5rem;">
                                        <label style="display:flex; align-items:center; cursor:pointer;">
                                            <input type="radio" name="qualifiedExams" value="yes" id="examsYes">
                                            <span style="margin-left: 0.5rem;">Yes</span>
                                        </label>
                                        <label style="display:flex; align-items:center; cursor:pointer;">
                                            <input type="radio" name="qualifiedExams" value="no" id="examsNo" checked>
                                            <span style="margin-left: 0.5rem;">No</span>
                                        </label>
                                    </div>
                                </div>
                                <div id="examDetails" class="hidden"
                                    style="margin-top: 1rem; padding-top: 1rem; border-top: 1px dashed var(--border-color);">
                                    <label>Exam Details</label>
                                    <div id="examListContainer">
                                        <div class="exam-entry dynamic-entry-grid"
                                            style="margin-bottom: 0.5rem;">
                                            <input type="text" class="exam-name input-full" placeholder="Exam Name (e.g. GATE)">
                                            <input type="text" class="exam-score input-full" placeholder="Rank / Score">
                                            <div style="grid-column: 1 / -1; margin-top: 0.5rem;">
                                                <input type="file" class="exam-file input-full" accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
                                            </div>
                                            <button type="button" class="btn-remove" title="Remove Exam"><i class="fas fa-times"></i></button>
                                        </div>
                                    </div>
                                    <button type="button" id="addExamBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Exam</button>
                                </div>
                            

                        </form>
                    </div>
                </div>
            </div>

            <!-- Co-Curricular Tab -->
            <div id="co-curricular" class="tab-content">
                <div class="glass-card">
                    <div class="card-header">
                        <h2><i class="fas fa-trophy" style="color: var(--primary-color);"></i> Co-Curricular Activities
                        </h2>
                    </div>
                    <div style="padding: 2rem;" class="activities-wrapper">

                        <!-- Paper Publications -->
                        <div class="activity-section">
                            <label class="activity-label">a) Paper Publications (Max 3 marks/paper)</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasPapers" value="yes" id="papersYes"> Yes</label>
                                <label><input type="radio" name="hasPapers" value="no" id="papersNo" checked> No</label>
                            </div>
                            <div id="paperDetails" class="hidden activity-details">
                                <div id="paperListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addPaperBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Paper</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Inter-College -->
                        <div class="activity-section">
                            <label class="activity-label">b) Inter-College Activities (Max 3 marks/event)</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasInterCollege" value="yes" id="interYes"> Yes</label>
                                <label><input type="radio" name="hasInterCollege" value="no" id="interNo" checked>
                                    No</label>
                            </div>
                            <div id="interDetails" class="hidden activity-details">
                                <div id="interListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addInterBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Event</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Intra-Dept -->
                        <div class="activity-section">
                            <label class="activity-label">c) Intra-Department Activities (Max 1 mark/event)</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasIntraDept" value="yes" id="intraDeptYes">
                                    Yes</label>
                                <label><input type="radio" name="hasIntraDept" value="no" id="intraDeptNo" checked>
                                    No</label>
                            </div>
                            <div id="intraDeptDetails" class="hidden activity-details">
                                <div id="intraDeptListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addIntraDeptBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Event</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Seminars -->
                        <div class="activity-section">
                            <label class="activity-label">d) Departmental Seminars (Max 2 marks/seminar)</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasSeminars" value="yes" id="seminarsYes"> Yes</label>
                                <label><input type="radio" name="hasSeminars" value="no" id="seminarsNo" checked>
                                    No</label>
                            </div>
                            <div id="seminarDetails" class="hidden activity-details">
                                <div id="seminarListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addSeminarBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Seminar</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Class Rep -->
                        <div class="activity-section">
                            <label class="activity-label">e) Class Representative (Max 2 marks/sem)</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasRep" value="yes" id="repYes"> Yes</label>
                                <label><input type="radio" name="hasRep" value="no" id="repNo" checked> No</label>
                            </div>
                            <div id="repDetails" class="hidden activity-details">
                                <div id="repListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addRepBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Semester</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Membership -->
                        <div class="activity-section">
                            <label class="activity-label">f) Professional Body Membership (1 mark/membership)</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasMembership" value="yes" id="membershipYes">
                                    Yes</label>
                                <label><input type="radio" name="hasMembership" value="no" id="membershipNo" checked>
                                    No</label>
                            </div>
                            <div id="membershipDetails" class="hidden activity-details">
                                <div id="membershipListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addMembershipBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Membership</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- MOOCs -->
                        <div class="activity-section">
                            <label class="activity-label">g) MOOCs Certifications (Max 2 marks/cert)</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasMoocs" value="yes" id="moocsYes"> Yes</label>
                                <label><input type="radio" name="hasMoocs" value="no" id="moocsNo" checked> No</label>
                            </div>
                            <div id="moocsDetails" class="hidden activity-details">
                                <div id="moocsListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addMoocsBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Certification</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Internship -->
                        <div class="activity-section">
                            <label class="activity-label">h) Internship / Consultancy (Max 2 marks each)</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasInternship" value="yes" id="internshipYes">
                                    Yes</label>
                                <label><input type="radio" name="hasInternship" value="no" id="internshipNo" checked>
                                    No</label>
                            </div>
                            <div id="internshipDetails" class="hidden activity-details">
                                <div id="internshipListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addInternshipBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Internship</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Awards -->
                        <div class="activity-section">
                            <label class="activity-label">i) Awards / Significant Contributions (Max 2 marks)</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasAwards" value="yes" id="awardsYes"> Yes</label>
                                <label><input type="radio" name="hasAwards" value="no" id="awardsNo" checked> No</label>
                            </div>
                            <div id="awardsDetails" class="hidden activity-details">
                                <div id="awardsListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addAwardsBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Contribution</button>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>


            <!-- Extracurricular Tab -->
            <div id="extracurricular" class="tab-content">
                <div class="glass-card">
                    <div class="card-header">
                        <h2><i class="fas fa-running" style="color: var(--primary-color);"></i> Extracurricular
                            Activities</h2>
                    </div>
                    <div style="padding: 2rem;" class="activities-wrapper">

                        <!-- University Team -->
                        <div class="activity-section">
                            <label class="activity-label">a) University Team Selection</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasUniTeam" value="yes" id="uniTeamYes"> Yes</label>
                                <label><input type="radio" name="hasUniTeam" value="no" id="uniTeamNo" checked>
                                    No</label>
                            </div>
                            <div id="uniTeamDetails" class="hidden activity-details">
                                <div id="uniTeamListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addUniTeamBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Selection</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Outside College -->
                        <div class="activity-section">
                            <label class="activity-label">b) Outside the College Activities</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasOutside" value="yes" id="outsideYes"> Yes</label>
                                <label><input type="radio" name="hasOutside" value="no" id="outsideNo" checked>
                                    No</label>
                            </div>
                            <div id="outsideDetails" class="hidden activity-details">
                                <div id="outsideListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addOutsideBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Event</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Within College -->
                        <div class="activity-section">
                            <label class="activity-label">c) Within the College Activities</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasWithin" value="yes" id="withinYes"> Yes</label>
                                <label><input type="radio" name="hasWithin" value="no" id="withinNo" checked> No</label>
                            </div>
                            <div id="withinDetails" class="hidden activity-details">
                                <div id="withinListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addWithinBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Event</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Tech Fest -->
                        <div class="activity-section">
                            <label class="activity-label">d) Tech Fest Coordinator</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasTech" value="yes" id="techYes"> Yes</label>
                                <label><input type="radio" name="hasTech" value="no" id="techNo" checked> No</label>
                            </div>
                            <div id="techDetails" class="hidden activity-details">
                                <div id="techListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addTechBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Role</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Other Coordinator -->
                        <div class="activity-section">
                            <label class="activity-label">e) Other Coordinator Roles</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasOtherCoord" value="yes" id="otherCoordYes">
                                    Yes</label>
                                <label><input type="radio" name="hasOtherCoord" value="no" id="otherCoordNo" checked>
                                    No</label>
                            </div>
                            <div id="otherCoordDetails" class="hidden activity-details">
                                <div id="otherCoordListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addOtherCoordBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Role</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Committee -->
                        <div class="activity-section">
                            <label class="activity-label">f) Committee Member</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasCommittee" value="yes" id="committeeYes">
                                    Yes</label>
                                <label><input type="radio" name="hasCommittee" value="no" id="committeeNo" checked>
                                    No</label>
                            </div>
                            <div id="committeeDetails" class="hidden activity-details">
                                <div id="committeeListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addCommitteeBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Committee</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- NSS -->
                        <div class="activity-section">
                            <label class="activity-label">g) NSS / Social Service</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasNss" value="yes" id="nssYes"> Yes</label>
                                <label><input type="radio" name="hasNss" value="no" id="nssNo" checked> No</label>
                            </div>
                            <div id="nssDetails" class="hidden activity-details">
                                <div id="nssListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addNssBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Activity</button>
                                </div>
                            </div>
                        </div>
                        <div class="section-divider"></div>

                        <!-- Ext Awards -->
                        <div class="activity-section">
                            <label class="activity-label">h) Extracurricular Awards</label>
                            <div class="radio-toggle">
                                <label><input type="radio" name="hasExtAwards" value="yes" id="extAwardsYes">
                                    Yes</label>
                                <label><input type="radio" name="hasExtAwards" value="no" id="extAwardsNo" checked>
                                    No</label>
                            </div>
                            <div id="extAwardsDetails" class="hidden activity-details">
                                <div id="extAwardsListContainer"></div>
                                <div class="actions">
                                    <button type="button" id="addExtAwardsBtn" class="btn-secondary"><i
                                            class="fas fa-plus"></i> Add Contribution</button>
                                </div>
                            </div>
                        </div>


                        </div>
                    </div>
                </div>

            <!-- Recommendation Letter Tab (Corrected Order) -->
            <div id="recommendation" class="tab-content">
                <div class="glass-card">
                    <div class="card-header">
                        <h2><i class="fas fa-file-signature" style="color: var(--primary-color);"></i> Recommendation & Declaration</h2>
                    </div>
                    <div style="padding: 2rem;">
                        <p style="margin-bottom: 1.5rem; color: var(--text-muted);">
                            Upload a recommendation letter from a faculty member or mentor. This document will be reviewed by the admin.
                        </p>
                        <form id="recommendationForm">
                            <div class="form-group">
                                <label for="recLetterFile">Upload Letter (PDF, DOCX, JPG, PNG)</label>
                                <input type="file" id="recLetterFile" accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
                                <div id="recLetterPreview" style="margin-top: 1rem; display: none;">
                                    <p style="font-weight: 500; color: var(--primary-color);">
                                        <i class="fas fa-check-circle"></i> File selected: <span id="recFileName"></span>
                                    </p>
                                </div>
                                <div id="currentRecLetter" style="margin-top: 1rem; display: none;">
                                    <p style="font-weight: 500;">Current File:</p>
                                    <a href="#" target="_blank" id="recFileLink" style="display: flex; align-items: center; gap: 0.5rem; color: var(--primary-color);">
                                        <i class="fas fa-file-alt"></i> View Uploaded Letter
                                    </a>
                                </div>
                            </div>
                            <button type="submit" id="saveRecBtn" class="btn-primary">
                                <i class="fas fa-save"></i> Upload Letter
                            </button>
                        </form>

                        <!-- Declaration Section (Moved from Extracurricular) -->
                        <div id="declarationSection" class="card" style="margin-top: 2rem; padding: 2rem; border-left: 5px solid var(--primary-color);">
                            <h3 style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 1.5rem; color: var(--primary-color);">
                                <i class="fa-solid fa-file-signature"></i> DECLARATION
                            </h3>
                            
                            <p style="font-size: 1.05rem; margin-bottom: 2rem; line-height: 1.6; color: var(--text-main);">
                                I hereby declare that all the details furnished above are true to my knowledge. 
                                I forfeit the award if I furnish wrong information.
                            </p>
    
                            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2rem; margin-bottom: 2rem;">
                                <div class="form-group">
                                    <label for="declPlace" style="font-weight: 600;">Place</label>
                                    <input type="text" id="declPlace" placeholder="Enter Place (e.g. Hyderabad)" required>
                                </div>
                                <div class="form-group">
                                    <label for="declDate" style="font-weight: 600;">Date</label>
                                    <input type="text" id="declDate" value="<?php echo date('d-m-Y'); ?>" readonly style="background: #f3f4f6; cursor: not-allowed;">
                                </div>
                            </div>
    
                            <div class="form-group" style="margin-bottom: 2rem;">
                                <label for="declSignature" style="font-weight: 600;">Signature of the Student</label>
                                <div style="display: flex; gap: 1rem; align-items: center; flex-wrap: wrap;">
                                    <input type="file" id="declSignature" accept=".pdf,.doc,.docx,.jpg,.jpeg,.png" style="flex: 1; min-width: 250px;">
                                    <span style="font-size: 0.85rem; color: var(--text-muted);">Upload a clear image of your signature or a scanned document (JPG/PNG/PDF)</span>
                                </div>
                                <div id="signaturePreview" style="margin-top: 1rem; display: none;">
                                    <img src="" alt="Signature Preview" style="max-height: 80px; border: 1px solid #ddd; padding: 5px; border-radius: 4px; background: white;">
                                </div>
                            </div>
    
                            <div class="form-group" style="display: flex; align-items: center; gap: 0.75rem; padding-top: 1rem; border-top: 1px solid var(--border-color);">
                                <input type="checkbox" id="declCheck" style="width: 1.2rem; height: 1.2rem; accent-color: var(--primary-color);">
                                <label for="declCheck" style="margin: 0; font-weight: 700; cursor: pointer; color: var(--text-main);">I accept the above declaration</label>
                            </div>
                        </div>
    
                        <!-- Final Submit (Moved from Extracurricular) -->
                        <div
                            style="margin-top: 3rem; text-align: center; padding: 2rem; background: rgba(0,0,0,0.03); border-radius: var(--radius-lg);">
                            <p style="margin-bottom: 1rem; color: var(--text-muted);">Ensure all information is correct
                                before final submission.</p>
                            <button id="finalSubmitBtn" class="btn-primary"
                                style="background: #ef4444; font-size: 1.1rem; padding: 1rem 3rem;" disabled>
                                <i class="fas fa-paper-plane"></i> Final Submit
                            </button>
                        </div>
                    </div>
                </div>
            </div>



            <!-- Download PDF Button (Hidden but kept for ID ref if needed, found in top bar now) -->
            <button id="downloadPdfBtn" style="display:none;"></button>

        </main>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
        window.IS_SUPER_ADMIN = <?php echo (!isset($_SESSION['user']['department']) || empty($_SESSION['user']['department'])) ? 'true' : 'false'; ?>;
        window.userRole = "<?php echo $_SESSION['user']['role']; ?>";
    </script>
    <script src="js/responsive.js"></script>
    <script src="js/dashboard.js?v=<?php echo time(); ?>"></script>
</body>

</html>