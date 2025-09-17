rule sort_bam:
    """
        Calls samtools to sort the input and save it in sorted bam
        uses expand samples from config to easily change everything in the config and not in every script
    """
    input: "data/input/{samples}.bam"
    output: "data/bam/sorted_{samples}.bam"
    log: "logs/rule1/sort/{samples}.bam.log"
    shell:
        """
        python workflow/scripts/file_checks.py {input} --type bam 2>> {log} || (cat {log} && exit 1)
        samtools sort -o {output} {input} >> {log} 2>&1
        """