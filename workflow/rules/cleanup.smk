"""
    Rule for optional cleanup of large intermediate files. 
    Only deletes files if config["cleanup_intermediates"] is set True.
"""

rule cleanup_intermediates:
    message: "Cleaning up intermediate files to save space"
    run:
        import os, glob
        if config.get("cleanup_intermediates", False):
            # Example: remove all filtered VCFs except primitives
            for file in glob.glob("data/variants_clean/*.vcf"):
                if os.path.exists(file):
                    os.remove(file)
            # Add additional patterns as needed
