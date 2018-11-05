---
title: "running R on the cluster"
author: 'Noëlle Schenk'
date: "2018 M11 5"
output: html_document
---

# cluster
For the university Bern, there is the [UBELIX](https://docs.id.unibe.ch/ubelix/) cluster. There you find all details about using the cluster, getting an account, etc. The programming language within the cluster is `bash`, and the one of the job-script is [slurm](https://slurm.schedmd.com/).

Usually, code is run on the cluster itself, uploading all necessary data and a data-processing script. The script is run with a so-called "job-script". The results are then downloaded again and the input data either deleted or left on the cluster for further analysis.

# R
For details, see documentation about R on [UBELIX page](https://docs.id.unibe.ch/ubelix/software/r)

test script `foo.R`, which contains the R code to be run.
```{r}
set.seed(3000)
valx<-seq(-2,2,0.01)
valy<-2*valx+rnorm(length(valx),0,4)
# Save plot to pdf
pdf('histplot.pdf')
hist(valy,prob=TRUE,breaks=20, main="Histogram and PDF",xlab="y", ylim=c(0,0.15))
curve(dnorm(x,mean(valy),sd(valy)),add=T,col="red")
dev.off()
```

job-script written in `slurm` to run the R script `foo.R`. There are several options:
```{bash}
#! /bin/bash
#SBATCH --mail-user=<put your valid email address here!>
#SBATCH --mail-type=end,fail
#SBATCH --time=01:00:00
#SBATCH --mem-per-cpu=2G
 
# Put your code below this line
R CMD BATCH --no-save --no-restore foo.R
```
