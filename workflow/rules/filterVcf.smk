"""
    Script number 5

    After freebayes made the .vcf files, the next step is to process these. This is done with phred quality filters and depth
    filters. The original article is very clear of where they filter on:
        "VCFfilter: We suggest -f "QUAL > 30 " (Depth over 10 reads), "DP > 10" (minimum Phred-scaled probability of error over 30)"

    So that is what this script will do
"""

rule filter_quality:
    """
        This rule will perform a filter of the freebayes .vcf data and will trim everything lower than 30
    """
    input: ""
    output: ""


rule filter_depth:
    """
        rule will filter everything with a phred score lower than 10 
    """
    input: ""
    output: ""