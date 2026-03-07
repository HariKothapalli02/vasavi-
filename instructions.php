<?php require_once __DIR__ . '/src/includes/auth_check.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructions - Best Outgoing Student System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .instructions-container {
            max-width: 900px;
            margin: 4rem auto;
            padding: 2rem;
        }
        .instruction-card {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 10px 40px -10px rgba(0, 0, 0, 0.08);
            padding: 3rem;
            border: 1px solid #f0f0f0;
        }
        .instruction-header {
            text-align: center;
            margin-bottom: 3rem;
            border-bottom: 2px solid #f0f2f5;
            padding-bottom: 1.5rem;
        }
        .instruction-header h1 {
            color: #1e293b;
            font-size: 2rem;
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .instruction-header p {
            color: #64748b;
            font-weight: 600;
            font-size: 1.1rem;
        }
        .instruction-section {
            margin-bottom: 2.5rem;
        }
        .instruction-section h2 {
            font-size: 1.25rem;
            color: #4f46e5;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        .instruction-list {
            list-style: none;
            padding: 0;
        }
        .instruction-list li {
            margin-bottom: 1rem;
            padding-left: 1.5rem;
            position: relative;
            color: #334155;
            line-height: 1.6;
            font-size: 0.95rem;
        }
        .instruction-list li::before {
            content: "•";
            position: absolute;
            left: 0;
            color: #4f46e5;
            font-weight: bold;
        }
        .table-responsive {
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            margin: 1.5rem 0;
            border-radius: 12px;
        }
        .marks-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 500px; /* Ensure table doesn't get squashed */
            border: 1px solid #e2e8f0;
        }
        .marks-table th {
            background: #f8fafc;
            color: #475569;
            font-weight: 600;
            text-align: left;
            padding: 1rem;
            border-bottom: 2px solid #e2e8f0;
            white-space: nowrap;
        }
        .marks-table td {
            padding: 1rem;
            border-bottom: 1px solid #e2e8f0;
            color: #1e293b;
            font-size: 0.9rem;
        }
        .marks-table tr:last-child td {
            border-bottom: none;
        }
        .marks-table .subtotal-row {
            background: #f1f5f9;
            font-weight: 700;
        }
        .marks-table .total-row {
            background: #4f46e5;
            color: white;
            font-weight: 800;
        }
        .marks-table .total-row td {
            color: white;
        }
        .back-btn-container {
            text-align: center;
            margin-top: 3rem;
        }
        .btn-back {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.75rem 2rem;
            background: #f1f5f9;
            color: #475569;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.2s;
            text-decoration: none;
        }
        .btn-back:hover {
            background: #e2e8f0;
            color: #1e293b;
            transform: translateX(-5px);
        }
        .nested-list {
            padding-left: 1.5rem;
            margin-top: 0.5rem;
        }
        .nested-list li::before {
            content: "◦";
        }
        .badge-warning {
            background: #fffbeb;
            color: #92400e;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.85rem;
            font-weight: 600;
            border: 1px solid #fde68a;
        }

        /* Mobile Marks Cards (Hidden by default) */
        .marks-cards {
            display: none;
            flex-direction: column;
            gap: 1rem;
            margin: 1.5rem 0;
        }
        .mark-card {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 1.25rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        .mark-card .section-label {
            font-size: 0.75rem;
            text-transform: uppercase;
            font-weight: 700;
            color: #4f46e5;
        }
        .mark-card .category-text {
            font-weight: 600;
            color: #1e293b;
            font-size: 1rem;
        }
        .mark-card .max-marks {
            font-size: 0.9rem;
            color: #64748b;
            display: flex;
            justify-content: space-between;
        }
        .mark-card.total-row {
            background: #4f46e5;
            color: white;
            border: none;
        }
        .mark-card.total-row .section-label,
        .mark-card.total-row .category-text,
        .mark-card.total-row .max-marks {
            color: white;
        }

        /* Mobile Tweaks */
        @media (max-width: 768px) {
            .table-responsive {
                display: none; /* Hide traditional table on small screens */
            }
            .marks-cards {
                display: flex; /* Show card layout instead */
            }
            .instructions-container {
                margin: 1rem auto;
                padding: 1rem;
            }
            .instruction-card {
                padding: 1.5rem;
                border-radius: 15px;
            }
            .instruction-header {
                margin-bottom: 2rem;
            }
            .instruction-header h1 {
                font-size: 1.5rem;
            }
            .instruction-header p {
                font-size: 1rem;
            }
            .instruction-section h2 {
                font-size: 1.15rem;
            }
            .instruction-list li {
                font-size: 0.9rem;
            }
            .btn-back {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body class="landing-page">
    <div id="canvas-container"></div>

    <!-- 3D Decorative Floating Elements -->
    <div class="floating-3d-accent accent-1">📄</div>
    <div class="floating-3d-accent accent-2">💡</div>
    <div class="floating-3d-accent accent-3">🔔</div>
    
    <div class="instructions-container">
        <div class="instruction-card">
            <div class="instruction-header">
                <h1>Best Outgoing Student Award</h1>
                <p>INSTRUCTIONS TO THE APPLICANT</p>
            </div>

            <div class="instruction-section">
                <ul class="instruction-list">
                    <li>Students with disciplinary issues are not eligible to apply (Malpractice, Ragging, etc.).</li>
                    <li>Students with backlog history are not eligible.</li>
                    <li>A candidate should get at least <strong>5 marks each in B & C parts</strong> to be eligible.</li>
                </ul>
            </div>

            <div class="instruction-section">
                <h2>Marks Distribution</h2>
                <div class="table-responsive">
                    <table class="marks-table">
                        <thead>
                            <tr>
                                <th>Section</th>
                                <th>Category</th>
                                <th>Max Marks</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>A</td>
                                <td>Academics upto 7th Semester (+ Honours/Minors + GATE/CAT/GRE etc.)</td>
                                <td>65 (55+5+5)</td>
                            </tr>
                            <tr>
                                <td>B</td>
                                <td>Co-curricular Activities</td>
                                <td>15</td>
                            </tr>
                            <tr>
                                <td>C</td>
                                <td>Extracurricular Activities</td>
                                <td>15</td>
                            </tr>
                            <tr class="subtotal-row">
                                <td colspan="2">Sub Total</td>
                                <td>95</td>
                            </tr>
                            <tr>
                                <td>D</td>
                                <td>Interview & Committee’s Assessment</td>
                                <td>05</td>
                            </tr>
                            <tr class="total-row">
                                <td colspan="2">Total</td>
                                <td>100</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Mobile Card Layout -->
                <div class="marks-cards">
                    <div class="mark-card">
                        <span class="section-label">Section A</span>
                        <span class="category-text">Academics upto 7th Semester</span>
                        <div class="max-marks"><span>Max Marks:</span> <strong>55</strong></div>
                    </div>
                    <div class="mark-card">
                        <span class="section-label">Section A+</span>
                        <span class="category-text">Honours/Minors & GATE/CAT/GRE etc.</span>
                        <div class="max-marks"><span>Max Marks:</span> <strong>10</strong></div>
                    </div>
                    <div class="mark-card">
                        <span class="section-label">Section B</span>
                        <span class="category-text">Co-curricular Activities</span>
                        <div class="max-marks"><span>Max Marks:</span> <strong>15</strong></div>
                    </div>
                    <div class="mark-card">
                        <span class="section-label">Section C</span>
                        <span class="category-text">Extracurricular Activities</span>
                        <div class="max-marks"><span>Max Marks:</span> <strong>15</strong></div>
                    </div>
                    <div class="mark-card">
                        <span class="section-label">Section D</span>
                        <span class="category-text">Interview & Committee Assessment</span>
                        <div class="max-marks"><span>Max Marks:</span> <strong>05</strong></div>
                    </div>
                    <div class="mark-card total-row">
                        <span class="section-label">Grand Total</span>
                        <span class="category-text">Total Score</span>
                        <div class="max-marks"><span>Maximum:</span> <strong>100</strong></div>
                    </div>
                </div>
            </div>

            <div class="instruction-section">
                <h2>Required Documents</h2>
                <p class="text-muted" style="margin-bottom: 1rem;">Students should submit copies of certificates/proofs along with the nomination form:</p>
                <ul class="instruction-list">
                    <li><strong>A. Academics:</strong> Academic Performance proof, Honours/Minors Degree proof from respective department, and GATE/CAT/MAT score card.</li>
                    <li><strong>B. Co-curricular Activities (15 Marks Max):</strong>
                        <ul class="nested-list">
                            <li>Paper Publications (Copy of the first page).</li>
                            <li>Inter-College Events (Certificate from the host Institution).</li>
                            <li>Intra-College Events (Certificate issued by Principal/Department).</li>
                            <li>Intra-Departmental activities (Certificate from Faculty Incharge and HOD).</li>
                        </ul>
                    </li>
                    <li><strong>C. Extra-Curricular Activities (15 Marks Max):</strong>
                        <ul class="nested-list">
                            <li><strong>Outside College:</strong> Individual/Group prizes (1-3 marks/event) or University team selection (2 marks).</li>
                            <li><strong>Within College:</strong> Individual/Group prizes (0.5-2 marks/event).</li>
                            <li><strong>Leadership:</strong> College Level Coordinator (2 marks), Dept Level (1 mark), Committee member (1 mark).</li>
                            <li><strong>Social Service:</strong> Participation in NSS / Blood Donation / Social Activity (2 marks).</li>
                        </ul>
                    </li>
                </ul>
            </div>

            <div class="back-btn-container">
                <a href="index.php" class="btn-back">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
                    Back to Login
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <script src="js/background-3d.js"></script>
    <script src="js/tilt-effect.js"></script>
</body>
</html>
