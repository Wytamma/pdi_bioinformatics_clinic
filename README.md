# Example workflow 

This workflow makes use of four of my packages:
1. [monitauR](https://github.com/Wytamma/monitauR) - Easily and remotely monitor the progress of your R scripts.
2. [GISAIDR](https://github.com/Wytamma/GISAIDR) - Programmatically interact with the GISAID covid database.
3. [Dynamic BEAST](https://github.com/Wytamma/dynamic-beast) - create a dynamic version of BEAST2 XML files
4. [beastiary](https://github.com/Wytamma/beastiary) - Real-time and remote MCMC trace inspection

# Download data from gisaid 

Use `GISAIDR` to download covid sequences from early outbreak in Australia. 

```bash
$ Rscript 01_Download_data.R
```

# Align and build a tree

Align the sequences (kalign) and build a tree (iqtree2).

```bash
$ Rscript 02_Align_seqs.R
$ Rscript 03_Build_tree.R
```

# Assess temporal signal and build model 

Use TempEst to test for temporal signal and construct a bayesian phylodynamic model using BEAUti.

# Perform a phylodynamic 

Run the model using `beast`.

```bash
$ Rscript 04_Run_beast.R
```

# Use beastiary to track and inspect results

```bash
$ beastiary *.log
```