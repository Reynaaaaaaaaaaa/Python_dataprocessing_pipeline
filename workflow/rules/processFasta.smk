"""
    Script number 3

    getData downloads a file called "mm10.2bit", this will be converted to a .fasta file
    The original article uses an external script found from http://hgdownload.cse.ucsc.edu/admin/exe/

    Warning: before the twoBitToFa is usable, change the rights
    $ chmod 755 twoBitToFa
"""

rule make_fata:
    """
        With the newly downloaded file from getData, the writer of the article uses a command like: 
        twoBitToFa mm10.2bit mm10.fa
        
        Within snakemake, this can be rewritten with input / output
    """
    input: "data/input/mm10.2bit"

    output: "data/fasta/mm10.fa"

    log: "logs/rule2/makeFasta/mm10.fa.log"

    message: "Converting mm10 to fasta type"

    shell: "twoBitToFa {input} {output} >{log} 2>&1"

rule index_fasta:
    """
    TODO:
    # in: mm10.fa
    # out: mm10.fa i / mm10.fa.fai
    """
    input: "data/fasta/mm10.fa"

    output: "data/fasta/mm10.fa.fai"

    log: "logs/rule2/indexFasta/mm10.fa.fai.log"

    message: "Indexing fasta to data/fasta/"

    shell: "samtools faidx {input} >{log} 2>&1"
