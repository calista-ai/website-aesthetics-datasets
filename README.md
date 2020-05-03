# Datasets on Website Aesthetics for Machine Learning

This repository contains datasets which can be used for quantifying website aesthetics.

## Table of Contents

1. [Comparison-Based vs Rating-Based Ranking Systems](#comparison-based-vs-rating-based-ranking-systems)

2. [Comparison-Based Dataset](#comparison-based-dataset)
3. [Rating-Based Dataset](#rating-based-dataset)

## Comparison-Based vs Rating-Based Ranking Systems

**Rating-based evaluation**: The user is asked to rate an item by providing an explicit numerical value on a scale

*Example*:
![rating_based_evaluation_example](media/rating_based_evaluation.png)

**Comparison-based evaluation**: The user is asked to compare 2 items at a time and choose which of the two is preferable

*Example*:
![comparison_based_evaluation_example](media/comparison_based_evaluation.png)

## Comparison-Based Dataset

Asking users to compare pairs of items is a more natural and reliable alternative to numerical ratings. Because of the virtues of comparison-based evaluation as a data collection method, we created a dataset to study and quantify website aesthetics.

Data were collected via [Calista Crowdsourcing App](https://github.com/calista-ai/crowdsourcing-app) that is currently running on [https://data.calista.app](https://data.calista.app).

**Note: This dataset will be regularly updated as we collect new data**

### Description

This dataset contains **aesthetic evaluations on 100 webpages** that were randomly selected from the Top 5000 websites list by Alexa Rankings.

During the evaluation process, 2 webpages were displayed at a time and the users were asked to choose which website design is more attractive.

From the total of 249 user sessions that were completed through our application, 174 passed the answer consistency check (69.88%). Through this process, we managed to collect **5094 pairwise comparisons**.

We also utilized the **Bradley-Terry model in order to extract a rank for each webpage** through the comparison-based data collected.

### Files


## Rating-Based Dataset
