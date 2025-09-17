# Dataprocessing
Authors: Reyna 
Date: 14/10/2022  

This repo contains the final assignment of the course "Dataprocessing". The complete pipeline of an existing article has been redone, the original article can be found [here](https://bmcgenomics.biomedcentral.com/articles/10.1186/s12864-019-5504-9), the matching GitHub repo can be found [here](https://github.com/cfarkas/Genotype-variants). 


## What is this repository for?
This repo consists of a Snakemake pipeline that will start with 4 bam files. These bam files will get processed and the Knock out samples will get intersected, after that the mutations will be compared to the wild type baseline. These mutations will be merged and the relative mutation variation can be plotted over the chromosomes. Giving a total mutation variation map of each chromosome as a [result](https://github.com/Reindert1/Dataprocessing/tree/main/results).


## How do I set up the project?
The project is made in Snakemake using Python 2.7, which is necessary for a tool that is used along the way. If you still desire to run in Python 3.7 or higher, remove all print statements in the Freebayes tool after you downloaded it. Since the owner hasn't changed this and making setting up easier, Python 2.7 is recommended to prevent the user from fixing someone else's bugs.

The tool is ran in a conda virtual environment, this is due to certain tools requiring the additional functionality it can offer. A complete setup can be found under setup.

### Requirements
Libraries and additional software:
- Python 2.7: download [here](https://www.python.org/downloads/) 
- Miniconda3: download [here](https://docs.conda.io/en/latest/miniconda.html)
- Snakemake: in conda venv run: `conda install -c bioconda snakemake`
- Freebayes (v0.9.21): in conda venv run: `conda install -c bioconda freebayes`
- vcftools (v1.0.0): in conda venv run: `conda install -c bioconda vcflib`
- Samtools (v1.15.0): in conda venv run: `conda install -c bioconda samtools`
- Picard (v2.18.7): in conda venv run: `conda install -c bioconda picard`

Visualization tools: 
- R (v4.0.4): download [here](https://cran.r-project.org/)
- dplyR: in R run: `install.packages("dplyr")`
- gridExtra: in R run: `install.packages("gridExtra")`
- reshape2: in R run: `install.packages("reshape2")`   
- ggplot2: in R run: `install.packages("ggplot2")`
- DescTools: in R run: `install.packages("DescTools")`


### Setup
Now that everything is downloaded, the next step is to create a conda environment, this will be done from scratch in these steps:

*Activate miniconda3*


Starting conda source and accessing additional functionality


`source miniconda3/bin/activate`


You will now see "(base)" before your terminal

*Make virtual environment*


Create your own environment for the requirements 


`conda create -n <name of choice> -c bioconda freebayes` 


Note: The `-c bioconda freebayes` will activate the library and base the environment of Freebayes. This is necessary for the tool to work.

*Activate new environment*


If you don't see your environment name instead of base, run this command


`conda activate <name of environment>`


You will now see your environment name instead of base and the virtual environment is now active


*Export freebayes.yaml*


The pipeline needs the tool, this file will have the configuration in it. A template is added to the repo if something went wrong


`conda env export > config/freebayes.yaml`


You can now run the entire repo with


`snakemake -s workflow/Snakefile.smk --use-conda`

## Downloading bam data
The data ran through the pipeline can be found on a Galaxy server. Unfortunately Snakemake cannot download these files. All four samples should be downloaded and be set under data/input/

- Download the bam files [here](https://usegalaxy.org/u/carlosfarkas/h/test-sall2-ko-rna-seq-gse123168-1) files.

## Output
The output of the pipeline will be an annotated chromosome map of the total variation in the knock-out samples compared to the wild type.
[Final result](results/out.pdf)

## Support
For questions or support you can send me an [email](mailto:r.f.visser@st.hanze.nl)

## Credits:
My teacher F. Feenstra and her Snakemake [tutorials](https://fennaf.gitbook.io/bfvh4dsp1/) 


