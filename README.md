# Master Thesis Thijs Carrière

*Version 0.1, May 11th 2022*

In this repository, you can find all documents and code related to my Master Thesis project for the [Research Master MSBBSS](https://www.uu.nl/masters/en/methodology-and-statistics-behavioural-biomedical-and-social-sciences) at Utrecht University. 

*Name of the project: Using Process Data in the Explanation and Detection of Differential Item Functioning*

*Abstract*: <br>
Differential Item Functioning (DIF) is a broadly studied property of test items. DIF can be an unwanted form of bias, but can also indicate a meaningful difference. To distinguish between the two, the source of the DIF needs to be explained. With the growth of computerized testing, process data have become more widely available. Process data are data that are collected during the response process but are not the response itself, such as response times. These data might hold additional information that is not captured in the response itself, and might therefore be useful in explaining DIF. In this study, a new model based on the MIMIC model is suggested that can be used to investigate whether DIF can be explained with process data. The model is first tested with simulations, where the sample size, strength of the DIF, latent differences between groups, and the number of DIF items are altered. Next, the model is applied to empirical Trends in International Mathematics and Science Study (TIMSS) data to see whether DIF in TIMSS can be explained with response times. Based on the findings it is discussed how the proposed model can be used to explain DIF with process data, but that the current state of process data might form a hindrance for wider use. Further research with a wider variety of process data is recommended.

## Repository organization
The repository contains the following folders:

**1. Texts:**<br>
In this folder, the documents that form the deliverable manuscripts of this project are presented. This includes the research report and the master thesis.
<br><br>
**2. Data:**<br>
In this folder, all data used in this project can be found. The three subfolders give:
- the public raw TIMSS data, used for the empirical example (2.1)
- the TIMSS data after preprocessing, used for the analyses of the thesis (2.2)
- the data obtained by the simulations, used for the simulation outcomes in the thesis (2.3)<br>

**3. Scripts:**<br>
In this folder, all scripts can be found that are used in the analyses and pre-processing of the project. With the use of these scripts, all results can be obtained and recreated. In what order these scripts should be run is explained in this folder as well.

## Steps to reproduce all results of the study
To reproduce all results presented in the final manuscript of this project, the following steps need to be taken:

### Simulations
1. The script `Simulation_script.Rmd` (Folder 3.3) should be run to obtain the simulated data, `Simulations_outcomes.RData` (Folder 2.3).
2. The obtained data can be analyzed with the script `Simulation_Findings.Rmd` (Folder 3.3). This script gives the simulated outcomes, presented in the manuscript.

### TIMSS data
1. The raw used TIMSS data must be downloaded, as described in Folder 2.1.
2. The script `Preprocessing_Timss.Rmd` (Folder 3.1) can be run to preprocess the data to the format used for the main analyses. The resulted data files of this script can also be found in Folder 2.2.
3. The script `descriptives_timss.R` (Folder 3.2) should be run to obtain the general descriptives and plots of the TIMSS data.
4. The script `dif_detection_timss.Rmd` (Folder 3.2) should be run to obtain the results off the dif detection as presented in the manuscript (Table 5).
5. The script `dif_explanation_timss.Rmd` (Folder 3.3) should be run to obtain the results off the dif explanation as presented in the manuscript (Table 6). 

## License
All work in this archive is licensed under a [Creative Common Attribution 4.0 license](http://creativecommons.org/licenses/by/4.0/).<br><br>
<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br><br>
This means that you can <br>
- share: copy and redistribute the material in any medium or format
- adapt: remix, transform, and build upon the material for any purpose, even commercially.

Under the following terms:
- Attribution: you must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use.
- No additional restrictions: you may not apply legal terms or technological measures that legally restrict others from doing anything the license permits.

## Maintenance
This archive is open access and can be used in line with the license. Maintenance and updating are the responsibility of the author, Thijs Carrière.
If you have any questions about this project, you can always contact me by sending an e-mail to t.c.carriere@uu.nl.
