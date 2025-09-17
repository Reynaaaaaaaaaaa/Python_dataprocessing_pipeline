rule gather_primitives:
    """
        Runs VcfAllelicPrimitives with a default length of 200 and won't retain MNP
    """
    input: "data/variants_clean/{sample}.vcf"
    output: "data/primitives/{sample}.vcf"
    conda: config["freebayes"]
    message: "Gathering primitives from samples"
    log: "logs/rule6/primitives/{sample}.vcf.log"
    benchmark: "benchmarks/rule6/primitives/{sample}.vcf.txt"
    shell:
        """
        python workflow/scripts/file_checks.py {input} --type vcf 2>> {log} || (cat {log} && exit 1)
        vcfallelicprimitives -g {input} > {output} 2>> {log}
        """