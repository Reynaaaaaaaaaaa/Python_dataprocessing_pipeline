"""
    Script number 9

    With the intersection files done, the genome annotation can start. This is done via an exteral R script which is
    disclosed in the original article. This will generate a plot with all the results of the intersection.

    What the plot shows is all KO variation on the regions of the wild type. But this variation is plotted per chromosome

    To avoid confusion about versions the existing file
    "genotype_variants_mouse_linux.R" has been renamed to "annotateGenotype.R"

"""

rule plot_result:
    input:
        KO = "data/intersection/KO_intersection.vcf",
        WT = "data/intersection/WT_intersection.vcf"

    output: "result/out.pdf"

    log: "logs/rule9/plot/out.pdf.log"

    message: "Generating final output"

    shell: "Rscript workflow/scripts/annotateGenotype.R {input.KO} {input.WT} 2> {log}"