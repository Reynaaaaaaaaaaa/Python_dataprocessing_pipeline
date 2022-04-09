"""
    script number 8

    With the primitives, the .vcf files can be intersected. This is to find overlapping regions in the data.
    The original article uses bcftools, instead of vcf tools which they use for all other tools and can do the same.
    Since bcftools is very strict and doesnt accept bgzip index files and bfctools index is very slow and hard to use,
    Picard is used instead. Its easier to use and only needs one additional step: a sequence dictionary


    IMPORTANT:
    The output of this script is a sequence dictionary and a merged Knock out sample. The merge will compare all
    variation on the genome and compare it to the mm10. In the last step, plot will visualize how much variation there
    is per chromosome.

    These intersection files can be used to * annotate * genotypes from the 10mm build
"""


rule create_sequence_dictionary:
    """
        For the merge of the KO a reference needs to be made, this is done with the mm10 file
    """
    input: "data/fasta/mm10.fa"

    output: "data/intersection/reference.dict"

    message: "Creating a sequence dictionary"

    log: "logs/rule8/seq_dict/reference.dict.log"

    benchmark: "benchmarks/rule8/seq_dict/reference.dict.txt"

    shell: "java -jar picard.jar CreateSequenceDictionary R={input} O={output} 2> {log}"


rule merge_KO:
    """
        Knock out files will be overlapped and the total variation is saved in the merged, with mm10 as baseline
    """
    input:
        KO1 = "data/primitives/KO1.vcf.gz",
        KO2 = "data/primitives/KO2.vcf.gz",
        KO3 = "data/primitives/KO3.vcf.gz",
        ref = "data/intersection/reference.dict"

    output: "data/intersection/merged_KO.vcf.gz"

    message: "Merging knock out samples"

    log: "logs/rule8/merge/merged_KO.vcf.log"

    benchmark: "benchmarks/rule8/merge/merged_KO.vcf.txt"

    shell: "java -jar picard.jar MergeVcfs I={input.KO1} I={input.KO2} I={input.KO3} D={input.ref} O={output} 2> {log}"


