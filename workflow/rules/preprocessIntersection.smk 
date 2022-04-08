"""
    script number 7

    Before the intersection can be done, some preprocessing needs to happen first. The bcftools only accepts zipped .gz
    files. So zipping all the samples is step 1
    There are 3 knock out samples and only 1 wild type. The wild type needs to be crossed with the merged wild type.
"""

rule zip_vcf:
    """
        Before bcftools can run, it needs zip files in order to run
    """
    input: "data/primitives/{sample}.vcf"

    output: "data/zips/{sample}.vcf.gz"

    message: "Zipping samples for intersection"

    log: "logs/rule7/zip/{sample}.vcf.gz.log"

    shell: "bgzip -c {input} > {output} 2> {log}"


rule merge_KO:
    """
        Another step is to merge the KO samples to run the intersect with WT
    """
    input:
        KO1 = "data/zips/KO1.vcf.gz",
        KO2 = "data/zips/KO2.vcf.gz",
        KO3 = "data/zips/KO3.vcf.gz"

    output: "data/zips/merged_KO.vcf.gz"

    message: "Merging KO samples"

    log: "logs/rule7/merge/merged_KO.vcf.gz.log"

    shell: "bcftools merge --merge all {input.KO1} {input.KO2} {input.KO3} > {output} 2> {log}"
