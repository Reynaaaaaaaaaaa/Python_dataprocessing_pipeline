"""
    Script number 5

    After freebayes made the .vcf files, the next step is to process these. This is done with phred quality filters and depth
    filters. The original article is very clear of where they filter on:
        "VCFfilter: We suggest -f "QUAL > 30 " (Depth over 10 reads), "DP > 10" (minimum Phred-scaled probability of error over 30)"

    So that is what this script will do

    note: this is a freebayes tool so in order to run this tool, run it in a conda virtual env with python 2.7
"""

rule filter_quality:
    """
        This rule will perform a filter of the freebayes .vcf data and will trim everything lower than 30
    """
    input: "data/variants/{sample}.vcf"

    output: "data/variants_filtered/{sample}.vcf"

    conda: config["freebayes"]

    message: "Filtering quality with QUAL > 30"

    log: "logs/rule5/quality/{sample}.vcf.log"

    benchmark: "benchmarks/rule5/quality/{sample}.vcf.txt"

    shell: "vcffilter -f 'QUAL > 30' {input} > {output} 2> {log}"


rule filter_depth:
    """
        rule will filter everything with a phred score lower than 10 
    """
    input: "data/variants_filtered/{sample}.vcf"

    output: "data/variants_clean/{sample}.vcf"

    conda: config["freebayes"]

    message: "Filtering depth with DP > 10"

    log: "logs/rule5/depth/{sample}.vcf.log"

    benchmark: "benchmarks/rule5/filter/{sample}.vcf.txt"

    shell: "vcffilter -f 'DP > 10' {input} > {output} 2> {log}"