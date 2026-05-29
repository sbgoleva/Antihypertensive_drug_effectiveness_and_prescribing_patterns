# Antihypertensive_drug_effectiveness_and_prescribing_patterns
Racial and Ethnic Disparities in Antihypertensive Medication Prescribing Patterns and Effectiveness

# Racial and Ethnic Disparities in Antihypertensive Medication Prescribing Patterns and Effectiveness

## Publication

This work has been published in *CPT: Pharmacometrics & Systems Pharmacology* (2024):

**Racial and Ethnic Disparities in Antihypertensive Medication Prescribing Patterns and Effectiveness**
Slavina B. Goleva, Ariel Williams, David J. Schlueter, Jacob M. Keaton, Tam C. Tran, Bennett J. Waxse, Tracey M. Ferrara, Thomas Cassini, Huan Mo, Joshua C. Denny

🔗 [https://ascpt.onlinelibrary.wiley.com/doi/10.1002/cpt.3360](https://ascpt.onlinelibrary.wiley.com/doi/10.1002/cpt.3360)

---

## Overview

This repository contains the analysis code supporting the above publication. The primary focus is to understand **racial and ethnic disparities in antihypertensive drug effectiveness and prescribing patterns** across self-identified Hispanic/Latino (Hispanic), Non-Hispanic Black (Black), and Non-Hispanic White (White) populations enrolled in the NIH All of Us Research Program — a US longitudinal cohort.

Using a self-controlled case study method with electronic health record and survey data from **17,718 participants** diagnosed with essential hypertension and prescribed at least one of 19 commonly used antihypertensive medications, this work found:

- Black and Hispanic participants were started on antihypertensive medications at significantly higher systolic blood pressure (SBP) than White participants.
- More Black participants were prescribed multiple antihypertensive medications (58.46%) compared to White (52.35%) or Hispanic (49.9%) participants.
- First-line hypertension medications differed by race and ethnicity.
- Following the 2017 ACC/AHA High Blood Pressure Guideline release, ~64% of Black participants were prescribed a recommended first-line drug, compared to 76% of White and 82% of Hispanic participants.
- Most antihypertensive drugs showed smaller effect sizes in Hispanic and Black participants compared to White participants, reaching statistical significance in 6 of 19 drugs.

These results suggest that Black and Hispanic populations may benefit from earlier intervention, screening, and personalized first-line medication selection.

---

## Contact

For questions, comments, or concerns, please contact:
- **Slavina Goleva** — slavinag@gmail.com
- **Josh Denny** — joshua.denny@nih.gov

---

## Repository Structure

### Data Preparation

| File | Description |
|------|-------------|
| `01_Create_and_Clean_datasets.ipynb` | Creates and cleans the primary datasets used throughout the analysis |

### Medication Effectiveness Analysis

| File | Description |
|------|-------------|
| `02.1_Med_Effectiveness_Analysis.ipynb` | Primary analysis of antihypertensive medication effectiveness across racial/ethnic groups |
| `02.2_demographics_significance.ipynb` | Statistical analysis of demographic differences across groups |
| `02.3_effectiveness_class.ipynb` | Effectiveness analysis stratified by drug class |
| `03_number_meds_analysis.ipynb` | Analysis of the number of antihypertensive medications prescribed per participant and differences |

### Visualization — Main Analysis

| File | Description |
|------|-------------|
| `04.1.1_Sankey_plots.ipynb` | Sankey plots illustrating prescribing patterns and transitions between first and second line med classes |
| `04.1.3_Sankey_Plots_Meds.ipynb` | Sankey plots focused on individual medications rather than classes |
| `04.2_Sunburst_Plots.ipynb` | Sunburst plots visualizing hierarchical prescribing patterns between first and second line |
| `05.1_plotting_by_class.ipynb` | Plots of effectiveness and prescribing patterns by drug class |
| `05_Plotting_SBPs_DeltaSBP.ipynb` | Plots of starting SBP and change in SBP (ΔSBPs) across groups and medications |

### Review Analyses

The following notebooks were developed during the peer review process to address reviewer comments and expand on the primary findings.

| File | Description |
|------|-------------|
| `review2_max_dose_analysis.ipynb` | Analysis of maximum medication doses |
| `review3_plotting_max_dose.ipynb` | Visualization of maximum dose findings |
| `review4_plotting_1_med.ipynb` | Plots for participants prescribed exactly one medication |
| `review5_sdi_surveys.ipynb` | Analysis of social deprivation index (SDI) survey data |
| `review6_combination_therapy_adjust_analysis.ipynb` | Adjusted analysis accounting for combination therapy |
| `review7_sdi_analysis.ipynb` | SDI-adjusted effectiveness analysis |
| `review8_sdi_adjustment_analysis_plotting.ipynb` | Visualization of SDI-adjusted analysis results |
| `review9_sdi_demographics_significance.ipynb` | Significance testing of demographic differences with SDI adjustment |
| `review10_washout_analysis.ipynb` | Washout period sensitivity analysis |
| `review11_washout1year_plotting.ipynb` | Visualization of 1-year washout period analysis |
| `review12_create_clean_outpatient_visits.ipynb` | Creates and cleans the outpatient visit dataset used in the review analyses |
| `review13_number_meds_analysis_2018.ipynb` | Number of medications analysis restricted to post-2018 data |
| `review14_office_visit_analysis.ipynb` | Analysis using office visit data |
| `review15_office_visit_plotting.ipynb` | Visualization of office visit analysis results |
| `review16_sankey_plot_2018.ipynb` | Sankey plots restricted to post-2018 prescribing data |
| `review17_1st_drug_plotting.ipynb` | Plots of first prescribed antihypertensive drug by group |
