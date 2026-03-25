<?php
// src/api/pdf.php
require_once __DIR__ . '/../includes/db.php';
require_once __DIR__ . '/../includes/crypto.php';

// Prevent warnings from corrupting PDF output
error_reporting(0);
ini_set('display_errors', 0);

// DEBUG LOGGING
function log_debug($msg) {
    // file_put_contents(__DIR__ . '/../../debug_pdf.log', date('[Y-m-d H:i:s] ') . $msg . PHP_EOL, FILE_APPEND);
}

log_debug("Starting PDF generation script.");

require_once __DIR__ . '/../fpdf.php';

if (!isset($_SESSION['user'])) {
    log_debug("No session found. returning 401.");
    http_response_code(401);
    die('Unauthorized');
}

$userId = $_SESSION['user']['id'];
if (($_SESSION['user']['role'] === 'admin' || $_SESSION['user']['role'] === 'panel') && isset($_GET['user_id'])) {
    $userId = $_GET['user_id'];
}
log_debug("Target User ID for PDF: " . $userId);

// Fetch Data
$user = db_get("SELECT * FROM users WHERE id = ?", [$userId]);
$academic = db_get("SELECT * FROM academic_records WHERE user_id = ?", [$userId]);
$coCurricular = db_all("SELECT * FROM co_curricular WHERE user_id = ?", [$userId]);
$extracurricular = db_all("SELECT * FROM extracurricular WHERE user_id = ?", [$userId]);
$finalScores = db_get("SELECT * FROM final_scores WHERE user_id = ?", [$userId]);

class PDF extends FPDF {
    function Header() {
        // Add header image navv.jpg
        $headerImg = __DIR__ . '/../../navv.jpg';
        if (file_exists($headerImg)) {
            $this->Image($headerImg, 0, 0, 210);
            $this->Ln(35); // Add space after header image
        } else {
            $this->SetFont('Arial', 'B', 16);
            $this->Cell(0, 10, 'Best Outgoing Student Application', 0, 1, 'C');
            $this->SetFont('Arial', '', 10);
            $this->Cell(0, 5, 'Sri Vasavi Engineering College', 0, 1, 'C');
            $this->Ln(10);
        }
    }

    function Footer() {
        $this->SetY(-15);
        $this->SetFont('Arial', 'I', 8);
        $this->Cell(0, 10, 'Page ' . $this->PageNo() . '/{nb}', 0, 0, 'C');
    }

    function SectionTitle($label) {
        $this->SetFont('Arial', 'B', 12);
        $this->SetFillColor(230, 230, 230);
        $this->Cell(0, 8, "  $label", 0, 1, 'L', true);
        $this->Ln(4);
    }
    
    function FancyTable($header, $data, $widths) {
        $this->SetFillColor(240, 240, 240);
        $this->SetTextColor(0);
        $this->SetDrawColor(128, 0, 0); // Maroon-ish borders
        $this->SetLineWidth(.3);
        $this->SetFont('Arial', 'B', 9);
        
        // Header
        for($i=0; $i<count($header); $i++)
            $this->Cell($widths[$i], 7, $header[$i], 1, 0, 'C', true);
        $this->Ln();
        
        // Data
        $this->SetFont('Arial', '', 9);
        foreach($data as $row) {
            $h = 6;
            // Handle multi-line for title
            $nb = 0;
            foreach($row as $col_index => $col_val) {
                $nb = max($nb, $this->NbLines($widths[$col_index], $col_val));
            }
            $h = 6 * $nb;
            
            // Check page break
            $this->CheckPageBreak($h);
            
            for($i=0; $i<count($row); $i++) {
                $x = $this->GetX();
                $y = $this->GetY();
                $this->Rect($x, $y, $widths[$i], $h);
                $this->MultiCell($widths[$i], 6, $row[$i], 0, 'L');
                $this->SetXY($x + $widths[$i], $y);
            }
            $this->Ln($h);
        }
    }

    // Helper for MultiCell height calculation
    function NbLines($w, $txt) {
        $cw = &$this->CurrentFont['cw'];
        if($w == 0) $w = $this->w - $this->rMargin - $this->x;
        $wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
        $s = str_replace("\r", '', $txt);
        $nb = strlen($s);
        if($nb > 0 and $s[$nb-1] == "\n") $nb--;
        $sep = -1; $i = 0; $j = 0; $l = 0; $nl = 1;
        while($i < $nb) {
            $c = $s[$i];
            if($c == "\n") { $i++; $sep = -1; $j = $i; $l = 0; $nl++; continue; }
            if($c == ' ') $sep = $i;
            $l += $cw[$c];
            if($l > $wmax) {
                if($sep == -1) { if($i == $j) $i++; }
                else $i = $sep + 1;
                $sep = -1; $j = $i; $l = 0; $nl++;
            } else $i++;
        }
        return $nl;
    }

    function CheckPageBreak($h) {
        if($this->GetY() + $h > $this->PageBreakTrigger)
            $this->AddPage($this->CurOrientation);
    }
}

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();

// --- Personal Information ---
$pdf->SectionTitle('Personal Information');

// Profile Photo
$tempPhoto = null;
if ($user['profile_photo']) {
    $photoId = str_replace('FILE:', '', $user['profile_photo']);
    $fileRecord = db_get("SELECT * FROM file_uploads WHERE id = ?", [$photoId]);
    if ($fileRecord) {
        try {
            $imgData = decrypt_data($fileRecord['data'], $fileRecord['iv']);
            $ext = explode('/', $fileRecord['mime_type'])[1] ?? 'jpg';
            $tempPhoto = sys_get_temp_dir() . '/temp_photo_' . $userId . '.' . $ext;
            file_put_contents($tempPhoto, $imgData);
            // Adjusted Y position to account for the new header image
            $currentY = $pdf->GetY() + 5;
            $pdf->Image($tempPhoto, 160, $currentY, 30);
        } catch (Exception $e) {}
    }
}

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(40, 8, 'Full Name', 1);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(90, 8, $user['name'], 1);
$pdf->Ln();

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(40, 8, 'Roll Number', 1);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(90, 8, $user['roll_number'], 1);
$pdf->Ln();

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(40, 8, 'Department', 1);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(90, 8, $user['department'], 1);
$pdf->Ln();

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(40, 8, 'Email-ID', 1);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(90, 8, $user['email'], 1);
$pdf->Ln();

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(40, 8, 'Contact No', 1);
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(90, 8, $user['contact_number'] ?: 'N/A', 1);
$pdf->Ln(10);

$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 6, 'Bio:', 0, 1);
$pdf->SetFont('Arial', '', 10);
// Fix bio encoding and ensure it fits well
$bio = $user['bio'] ?: 'N/A';
if (function_exists('iconv')) {
    $bio = iconv('UTF-8', 'windows-1252//TRANSLIT', $bio);
} else {
    $bio = utf8_decode($bio);
}
$pdf->MultiCell(130, 5, $bio); 
$pdf->Ln(10);

// --- Academic Performance ---
$pdf->SectionTitle('Academic Performance');

$pdf->SetFont('Arial', 'B', 11);
$pdf->Cell(130, 8, 'Description', 1, 0, 'C', true);
$pdf->Cell(60, 8, 'Marks Allotted', 1, 1, 'C', true);

$pdf->SetFont('Arial', '', 10);
$pdf->Cell(130, 8, 'CGPA Performance (' . ($academic['cgpa'] ?? 'N/A') . ')', 1);
$pdf->Cell(60, 8, $academic['cgpa_score'] ?? '0', 1, 1, 'C');

$honours = 'No';
if (!empty($academic['honours_minors']) && $academic['honours_minors'] !== 'No') {
    $h = json_decode($academic['honours_minors'], true);
    if(is_array($h)) {
        $honours = $h['type'] . ' (' . count($h['courses']) . ' courses)';
    } else {
        $honours = $academic['honours_minors'];
    }
}
$pdf->Cell(130, 8, 'Honours/Minors: ' . $honours, 1);
$pdf->Cell(60, 8, $academic['honours_score'] ?? '0', 1, 1, 'C');

$examsText = 'None';
if (!empty($academic['competitive_exams']) && $academic['competitive_exams'] !== 'None') {
    $exams = json_decode($academic['competitive_exams'], true);
    if (is_array($exams)) {
        $examList = [];
        foreach ($exams as $ex) {
            $name = $ex['name'] ?? 'N/A';
            $score = $ex['score'] ?? 'N/A';
            $examList[] = "$name (Score: $score)";
        }
        $examsText = implode(', ', $examList);
    } else {
        $examsText = $academic['competitive_exams'];
    }
}
$pdf->Cell(130, 8, 'Competitive Exams: ' . $examsText, 1);
$pdf->Cell(60, 8, $academic['exams_score'] ?? '0', 1, 1, 'C');

$pdf->SetFont('Arial', 'B', 10);
$pdf->SetFillColor(250, 250, 200);
$pdf->Cell(130, 8, 'Total Academic Score', 1, 0, 'R', true);
$pdf->Cell(60, 8, $finalScores['academic_score'] ?? '0', 1, 1, 'C', true);
$pdf->Ln(5);

// SGPA Grid
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(0, 6, 'Semester-wise SGPA:', 0, 1);
$w = 27.14;
$pdf->SetFont('Arial', 'B', 9);
for($i=1; $i<=7; $i++) $pdf->Cell($w, 7, "Sem $i", 1, 0, 'C', true);
$pdf->Ln();
$pdf->SetFont('Arial', '', 9);
for($i=1; $i<=7; $i++) {
    $val = $academic["sgpa_sem$i"] ?? '-';
    $pdf->Cell($w, 7, $val, 1, 0, 'C');
}
$pdf->Ln(10);


$pdf->AddPage();
// --- Co-Curricular ---
$pdf->SectionTitle('Co-Curricular Activities');
$pdf->SetFont('Arial', 'B', 10);
if (count($coCurricular) > 0) {
    $header = ['Title', 'Activity Type', 'Marks'];
    $data = [];
    foreach($coCurricular as $row) {
        $data[] = [
            $row['title'],
            $row['activity_type'],
            $row['score'] ?? '0'
        ];
    }
    $pdf->FancyTable($header, $data, [120, 40, 30]);
    
    $pdf->SetFont('Arial', 'B', 10);
    $pdf->SetFillColor(250, 250, 200);
    $pdf->Cell(160, 8, 'Total Co-Curricular Score', 1, 0, 'R', true);
    $pdf->Cell(30, 8, $finalScores['co_curricular_score'] ?? '0', 1, 1, 'C', true);
} else {
    $pdf->Cell(0, 10, 'No records found.', 1, 1);
}
$pdf->Ln(10);

// --- Extracurricular ---
$pdf->SectionTitle('Extracurricular Activities');
if (count($extracurricular) > 0) {
    $header = ['Title', 'Level', 'Description', 'Marks'];
    $data = [];
    foreach($extracurricular as $row) {
        $data[] = [
            $row['title'],
            $row['level'],
            $row['description'],
            $row['score'] ?? '0'
        ];
    }
    $pdf->FancyTable($header, $data, [60, 30, 70, 30]);

    $pdf->SetFont('Arial', 'B', 10);
    $pdf->SetFillColor(250, 250, 200);
    $pdf->Cell(160, 8, 'Total Extracurricular Score', 1, 0, 'R', true);
    $pdf->Cell(30, 8, $finalScores['extracurricular_score'] ?? '0', 1, 1, 'C', true);
} else {
    $pdf->Cell(0, 10, 'No records found.', 1, 1);
}
$pdf->Ln(10);

// --- Total Score ---
$pdf->SetFont('Arial', 'B', 14);
$pdf->SetFillColor(200, 255, 200);
$pdf->Cell(160, 10, 'FINAL OVERALL SCORE', 1, 0, 'R', true);
$pdf->Cell(30, 10, $finalScores['total_score'] ?? '0', 1, 1, 'C', true);

// --- Signatures & Declaration ---
$pdf->Ln(20);
$currentY = $pdf->GetY();

// Ensure enough space for signature block
if ($currentY > 230) {
    $pdf->AddPage();
    $currentY = $pdf->GetY();
}

// Prepare Student Signature
$tempSig = null;
if (!empty($user['signature_path'])) {
    $sigId = str_replace('FILE:', '', $user['signature_path']);
    $sigRecord = db_get("SELECT * FROM file_uploads WHERE id = ?", [$sigId]);
    if ($sigRecord) {
        try {
            $sigData = decrypt_data($sigRecord['data'], $sigRecord['iv']);
            $ext = explode('/', $sigRecord['mime_type'])[1] ?? 'jpg';
            $tempSig = sys_get_temp_dir() . '/temp_sig_' . $userId . '.' . $ext;
            file_put_contents($tempSig, $sigData);
        } catch (Exception $e) {}
    }
}

// Draw Student Signature Image if exists
if ($tempSig) {
    $pdf->Image($tempSig, 15, $currentY, 0, 20); // Fixed height 20mm to prevent overlap
}

// Labels Section
$labelY = $currentY + 22;

// Left side: Student
$pdf->SetXY(10, $labelY);
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(95, 7, 'Signature of the Student', 0, 2, 'L');
$pdf->SetFont('Arial', '', 9);
$pdf->Cell(95, 5, 'Date: ' . ($user['declaration_date'] ?: 'N/A'), 0, 2, 'L');
$pdf->Cell(95, 5, 'Place: ' . ($user['declaration_place'] ?: 'N/A'), 0, 0, 'L');

// Right side: HOD
$pdf->SetXY(105, $labelY); 
$pdf->SetFont('Arial', 'B', 11); // HOD Name first
$pdf->Cell(95, 7, ($academic['hod_name'] ?: 'Pending Evaluation'), 0, 2, 'R');
$pdf->SetFont('Arial', 'B', 10); // Signature Label next
$pdf->Cell(95, 6, 'Signature of the HOD / Evaluator', 0, 2, 'R');
$pdf->SetFont('Arial', '', 9); // Evaluation Date last
$pdf->Cell(95, 5, 'Evaluated On: ' . ($academic['hod_evaluation_date'] ?: 'N/A'), 0, 0, 'R');
$pdf->Ln(15);

// Cleanup temp files
if ($tempPhoto && file_exists($tempPhoto)) {
    @unlink($tempPhoto);
}
if ($tempSig && file_exists($tempSig)) {
    @unlink($tempSig);
}

$pdf->Output('D', 'pdf.pdf');
exit;
?>
