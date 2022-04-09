"""
    Script number 9

    With the intersection files prepared, the genome annotation can start. This is done via an external R script which is
    disclosed in the original article. This will generate a plot with all the results of the intersection.

    What the plot shows is all KO variation on the regions of the wild type. But this variation is plotted per chromosome.
    This is called a singular intersection, since all knock out files are combined and compared to one base line

    To avoid confusion about versions the existing file
    "genotype_variants_mouse_linux.R" has been renamed to "annotateGenotype.R"

"""

rule unzip_merge:
    """
        The plot rule doesn't accept the zipped knock out file, so it needs to be unzipped
    """

    input: "data/intersection/merged_KO.vcf.gz"

    output: "data/intersection/merged_KO.vcf"

    message: "Unzipping merged knock out"

    log: "logs/rule9/unzip/merged_KO.vcf.log"

    shell: "gunzip -c {input} > {output} 2> {log}"


rule plot_result:
    """
        Will call an external R script and plot the graphs 
    """
    input:
        R_location = config["R_script"],
        KO = "data/intersection/merged_KO.vcf",
        WT = "data/primitives/WT.vcf"

    output: "out.pdf"

    log: "logs/rule9/plot/out.pdf.log"

    message: "Generating final output"

    shell: "Rscript {input.R_location} {input.KO} {input.WT} 2> {log}"