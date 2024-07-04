This project is part of the Digital Causality Lab from the ISA-Zentrum at Hamburg University. In this project, we describe how a Differences-in-Differences-Design works theoretically and illustrate this with example data. 


A DiD is a statistical technique used to estimate the causal effect of a treatment by comparing the differences in outcomes over time between a group that is exposed to the treatment and a group that is not. It helps to control for time-invariant unobserved heterogeneity. Here, a treatment group is exposed to the intervention or treatment.The group of subjects or entities that are not exposed to the intervention or treatment, serving as a baseline to compare the treatment group's outcomes. In our example, some districts receive a minimum wage, while others are not.

A DiD design has assumption that, in the absence of treatment, the treatment and control groups would have followed the same trend over time. This is also known as the parallel trend assumption. Anything that derivatives from that assumed parallel trend is considered to be the treatment effect (D). This is the effect that we are going to calculate with our dataset testdata. For this project, we want to highlight the effect of the common trend, meaning that even without intervention, the outcome in the treatment group is also rising. Without accounting for the common trends, we end up overestimating the effects of our treatment and risking to infer wrong policy implications.

This project is useful for anyone, who wants to understand how a DiD-Design works. We also draw attention to the assumptions and limitations of a DiD-Design. This project is for you, if you want to get a 
broad intuition about causality and DiD. 

To get started, download the dataset testdata.csv and save it together with the R script in one folder. This notebook will walk you through the code and gives background information on the kex concepts of a DiD: INSERT NOTEBOOK 
