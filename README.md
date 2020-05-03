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

* *[alexa_rankings/top-5000-websites.json](https://github.com/calista-ai/website-aesthetics-datasets/tree/master/comparison-based-dataset/alexa_rankings/top-5000-websites.json)*: Contains the Top 5000 websites list by Alexa Rankings.

    Format:

    ```bash
    {
        "Webpage URL": "Category"
    }
    ```

* *[images/](https://github.com/calista-ai/website-aesthetics-datasets/tree/master/comparison-based-dataset/images)*: Contains the webpage screenshots in PNG format. The file *[website_data.json](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/images/website_data.json)* has information about the webpages.

    Format:

    ```bash
    {
        "Webpage URL": {
            "category": "The website category according to the Top 5000 Website list",
            "sampleIndex": "The website position in the file top-5000-websites.json",
            "idInDataset": "The webpage ID in the dataset. Its screenshot is ID.png"
        }
    }
    ```

* *[data/votesessions.json](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/data/votesessions.json)*: Contains the data from each user session collected through the crowdsourcing application

    Format:

    ```bash
    [
        {
            "_id": {
                "$oid": "ObjectID"
            },
            "acc": "Gets the value true if the user session was accepted. Otherwise, false",
            "d": "Date and time that the vote session started",
            "vot": [
                {
                    "imL": "Image ID displayed at the left side",
                    "imR": "Image ID displayed at the left",
                    "imC": "The ID of the image that was chosen by the user"
                },
                ...
            ],
            "__v": "Not useful for analysis"
        },
        ...
    ]
    ```

    **Note**: A user session is considered as **accepted** on two conditions:

    * The user evaluated all the session's pairwise image comparisons (a session has 32 comparisons)

    * The user passed the answer consistency check. Otherwise the user's answers are not considered reliable and the session is not accepted.

* *[data/votesessions.csv](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/data/votesessions.csv)*: The same information with *[data/votesessions.json](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/data/votesessions.json)* in CSV format.

* *[data/comparisons.json](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/data/comparisons.json)*: Contains the filtered comparison-based data of the accepted user sessions.

    Format:

    ```bash
    [
        {
            "_id": "Comparison ID",
            "im1": "First image ID",
            "im2": "Second image ID",
            "w1": "Times that the first image won",
            "w2": "Times that the second image won",
            "t": "Total number of evaluations by users (t = w1 + w2)",
            "u": "Not useful for analysis"
        },
        ...
    ]
    ```

* *[data/comparisons.csv](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/data/comparisons.csv)*: The same information with *[data/comparisons.json](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/data/comparisons.json)* in CSV format.

* *[rank_websites.R](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/rank_websites.R)*: A script that utilizes the Bradley-Terry model to extract a rank for each website based on the filtered comparison-based data. The final aesthetics scores are on the scale 1-10.

* *[website_scores.csv](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/website_scores.csv)*: Contains the output of *[rank_websites.R](https://github.com/calista-ai/website-aesthetics-datasets/blob/master/comparison-based-dataset/rank_websites.R)*.

## Rating-Based Dataset
