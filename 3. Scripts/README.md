# Scripts

In the folders, all scripts can be found that are needed to obtain the results presented in the thesis.<br>
Note that for all scripts the paths for loading in the data files might need to be changed manually.

### 3.1 TIMSS Preprocessing

The script in this folder is used to process the raw TIMSS data to the format that can be used in the main analyses of the thesis (DIF detection and DIF explanation). 

### 3.2 TIMSS analyses

In this folder, the scripts for the DIF detection and DIF explanation of the TIMSS data can be found. The `html` files are the results of these scripts (`dif_detection_timss.Rmd` and `dif_explanation_timss.Rmd`), and the numbers of these documents are used in as the findings in the final thesis manuscript (Table 5 and Table 6). 
The descriptive analyses are run with the script `descriptives_timss.R`. The results of these analyses are used in the thesis manuscript for Table 3, Table 4, Figure 3, and Figure 4.
All input files for these scripts can be found in folder 2.2.

### 3.3 Simulations

In this folder, the scripts for the simulation parts of the thesis can be found. The script `Simulation_script.Rmd` contains the written function, run for the simulations. It also containts the simulations itself. The output of the script is `Simulation_outcomes`, which can be found in folder 2.3. 
In the script `Simulation_Findings.Rmd`, the Simulation_outcomes are analysed to the results presented in Table 1 and Table 2 of the thesis manuscript. 
To learn more about how the simulation was set up and its conditions, please read section 3.1 of the Master thesis manuscript (Folder 1.2).

*Please note that the numbering of the conditions in the scripts is not the same numbering as presented in the tables in the thesis document.* 
