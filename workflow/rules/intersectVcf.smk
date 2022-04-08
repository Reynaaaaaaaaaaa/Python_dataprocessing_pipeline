"""
    script number 8

    With the primitives, the .vcf files can be intersected. This is to find overlapping regions in the data.
    The original article uses bcftools, instead of vcf tools which they use for all other tools and can do the same.
    But for authenticity, bcftools will be used since the article uses it too.


    IMPORTANT:
    The output of this script is two intersection files, one of the outputs is the merged KO intersection
    So from 3 samples to one merged and intersected

    The other output is the WT intersection file.

    The intersection files show multiple replicates, the filtered .vcf.gz samples (primitives show only one replicate)

    These intersection files can be used to * annotate * genotypes from a 10mm build
"""

rule intersect_KO_vcf:
    """
        With the combined KO zip files, the intersection can be done over the KO samples
    """
    input: "data/zips/merged_KO.vcf.gz",

    output: "data/intersection/KO_intersection.vcf"

    message: "intersecting merged KO vcf files!"

    log: "logs/rule8/intersect/intersect_KO.vcf.log"

    shell: "bcftools isec -p {output} -Oz {input}  2> {log}"

rule intersect_WT_vcf:
    """
        WT sample can't be merged, so it needs to be separated from the KO
    """
    input: "data/zips/WT.vcf.gz",

    output: "data/intersection/WT_intersection.vcf"

    message: "intersecting WT vcf file!"

    log: "logs/rule8/intersect/intersect_WT.vcf.log"

    shell: "bcftools isec -p {output} -Oz {input}  2> {log}"

