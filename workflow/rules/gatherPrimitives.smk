"""
    script number 6

    After the vcf files have been filtered, the primitives are extracted
    The original article says:
        "VcfAllelicPrimitives: Split allelic primitives into multiple VCF lines, default settings"
    so this snakemake pipeline component will run the VcfAllelicPrimitives tool from vcflib with the default settings

"""

rule gather_primitives:
    """
        Runs VcfAllelicPrimitives with a default length of 200 and won't retain MNP
    """
    input: "data/variants_clean/{sample}.vcf"

    output: "data/primitives/{sample}.vcf"

    conda: config["freebayes"]

    message: "Gathering primitives from samples"

    log: "logs/rule6/primitives/{sample}.vcf.log"

    shell: "vcfallelicprimitives -g {input} > {output} 2> {log}"