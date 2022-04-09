"""
    script number 7

    Before the intersection can be done, some preprocessing needs to happen first. Picard only accepts .gz files.
    So zipping all the samples is step 1
"""

rule zip_vcf:
    """
        Before Picard can run, it needs zip files in order to run
    """
    input: "data/primitives/{sample}.vcf"

    output: "data/primitives/{sample}.vcf.gz"

    message: "Zipping samples for intersection"

    log: "logs/rule7/zip/{sample}.vcf.gz.log"

    shell: "bgzip -ci {input} > {output} 2> {log}"
