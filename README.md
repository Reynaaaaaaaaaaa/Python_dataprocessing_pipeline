## Error Handling & Logging Improvements

- The pipeline now checks for missing or corrupt BAM and VCF files before key steps.
- If a required input is missing or empty, a clear error message is logged and the pipeline halts.
- Log files for each rule are more informative and capture both validation errors and tool outputs.
- See `workflow/scripts/file_checks.py` for the validation logic.