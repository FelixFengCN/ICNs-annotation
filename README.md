# ICNs-annotation
This repository provides the data and code associated with our study:

Guozheng Feng, Jiayu Chen, Jing Sui, Vince D. Calhoun.
Cellular and molecular associations with intrinsic brain organization.
https://doi.org/10.1101/2025.04.28.651051

If you use this repository, please cite the above paper (https://doi.org/10.1101/2025.04.28.651051) and Github repository [![DOI](https://zenodo.org/badge/969851378.svg)](https://doi.org/10.5281/zenodo.17411036).

🔗 Additional Resources
Custom data and analysis scripts are also available at:

Data: https://trendscenter.org/data/

Supplementary code: https://github.com/FelixFengCN/ICNs-annotation

🛠 Software Environment
The following environments were used for data analysis:

MATLAB R2020b

Python 3.9.21

R 4.1

📦 Original Data and Processing

ICN template:
Neuromark_fMRI_1.0 template available at: http://trendscenter.org/software/gift

Transcriptomic data (AHBA):
From http://human.brain-map.org, processed using the abagen toolbox

Single-nucleus RNA-seq data:
Available at: CellXGene (https://cellxgene.cziscience.com/collections/d17249d2-0e6e-4500-abb8-e6c93fa1ac6f), processed and deconvoluted using BayesPrism
The resulting cell-type maps were accessible at https://trendscenter.org/data/.

Neurotransmitter PET imaging:
Available at: https://github.com/netneurolab/hansen_receptors

Mitochondrial phenotype maps:
Available at: https://neurovault.org/collections/16418/

Cognitive probabilistic maps:
Downloaded from Neurosynth

Resulting cell-type maps:
Available at: https://trendscenter.org/data/

📁 Data Files (in data/)
This folder contains small test datasets for verifying the analysis scripts.

f_ic_6_celltype_t3.mat

    ic: Spatial values of the 6th IC overlapping with AHBA samples

    ic_null: 1,000 spatial permutations (Moran test via BrainSpace)

    celltype: Spatial values from 24 cell-type maps


f_ic_3_mitochondrion_t3.mat

    ic: Spatial values of the 3rd IC overlapping with mitochondrial maps

    ic_null: 500 spatial permutations (Moran test; reduced from 1,000 due to file size)

    mitochondrion: Spatial values from 6 mitochondrial maps


Note: Neurotransmitter test file is not included due to size but follows the same structure as the mitochondrial file.

🧠 Code Overview (in Codes/)

analysis_ic_celltype_corr_f.m

Computes spatial correlations between ICNs and cell-type maps.

analysis_ic_mitochondral_multiplecorr.R

Computes correlations between ICNs and mitochondrial maps, and performs relative importance analysis using the relaimpo R package.

analysis_ic_neurotransmitter_multiplecorr.R

Performs correlation and importance analysis for neurotransmitter maps.

clustering.py

Performs network clustering and Adjusted Rand Index (ARI) calculation.
Diffusion embedding from BrainSpace is used to project similarity networks into a shared space.
K-means clustering groups the projected connections, and ARI quantifies the consistency with functional domain labels.

analysis_mediation.R

Conducts mediation analysis using the PROCESS module in R.
Cellular/molecular maps are predictors, cognitive probabilistic measures are outcomes, and ICNs serve as mediators.

📊 Results (in results/)

This folder contains numerical data underlying the main figures and tables reported in the manuscript.

📜 License

All code and example data are released for research and academic use only. Please cite the original publication when using any part of this repository.
