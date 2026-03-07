-- SQL Command to add the Final Submission Lock column
ALTER TABLE final_scores ADD COLUMN IF NOT EXISTS is_final_submitted TINYINT DEFAULT 0;
