# Final Project: The Cinematic Universe
![Image of Avengers Assemble!](info201avengers.png)

## Domain of Interest

**Why are you interested in this field/domain?**

Our synergy in our introductory group discussions brought us to a shared interest in movies and their back-end processes and facts. Thus, we decided to explore datasets regarding Movies. Jody enjoys comedies. Lynette and Jeffrey revel in action movies, especially MCU's Avengers. All in the while, Zhi appreciates romance. There is more than beneath the eye of paying for a movie stub at the theater as there are many components before and after movie releases. Some pre-release factors consisting of budgeting, timeline, and production planning enhance the quality and enjoyability of the movie. While, a few post-factors incorporate ratings, price, marketing, and theater distribution network - all of which aim to drive long-term profitability and to attract a global audience. We are motivated to analyze movie trends, statistics, and logistics such as calculating maximum and minimum revenues, obtaining names of most and least profitable movies or genres, computing the number of tickets sold per movie, and grouping movies based on ranges of budgets.

**What other examples of data driven project have you found related to this domain (share at least 3)?**

- [Data Science: Analysis of Movies released in the cinema between 2000 and 2017](https://medium.com/datadriveninvestor/data-science-analysis-of-movies-released-in-the-cinema-between-2000-and-2017-b2d9e515d032) utilizes the Internet Movie Database (IMDb) to analyze movie data between the year 2000 and the year 2017.

- [Exploring Movie Data with Interactive Visualizations](https://towardsdatascience.com/exploring-movie-data-with-interactive-visualizations-c22e8ce5f663) utilizes The Movie Database (TMDB) data from 1910-2016. Their goal for the project was to understand temporal patterns affecting movie profitability, changes in popular genres, identifying important actors/directors, and observing changes in movie ratings and vote averages over time.

- [Lorenz Hering’s Movie Data Analysis project](https://www.kaggle.com/lorenzhering/movie-data-analysis) utilizes TMDb's data set that contains information about 10,866 movies published between 1960 and 2015. His goal was to answer the questions of which genres were most common, have the highest avg. budget/revenue/profit/vote/popularity/vote count, number of movies with voting avg. >=8, and analyzing the development of means of variables per genre over the years.


**What data-driven questions do you hope to answer about this domain (share at least 3)?**

- What is the most profitable movie up from movies between 2000 and 2017?
    - This can be investigated this by filtering datasets by movies from 2000 and 2017, arranging a newly created profit column from high amount to low amount, and viewing the top ten movies with the highest grossed (revenue - budget) amount.  

- Does budgeting affect movie popularity and/or profitability?
    - This can be effectively analyzed by drawing faceted scatter plots with the budgeting columns and the popularity (revenue/profit as well) columns and observing trends and correlations.

- What was the most popular movie?
    - This can be measured by highest revenue and highest popularity obtained by our datasets. In addition, movie datasets have files that contain movie ratings that we can use to compare and supplement our findings.

- What were the top 3 genres of movies?
    - This criteria can be evaluated by grouping movies based on categories/genre and then determining based on computations of highest budget, highest revenue, highest popularity, and highest ratings - all of which signal level of demand for the movie genres.

# Finding Data

## Source 1

**Where did you download the data (e.g., a web URL)?**

https://www.kaggle.com/rounakbanik/the-movies-dataset/version/7

**How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**

This dataset was directly found on Kaggle by Rounak Banik who was interested in performing analysis and storytelling about the movies and its components. From that, he built a revenue forecasting model, determined success metrics, and crafted a recommender system for movies. The data source originates from an ensemble of data collected from TMDB and GroupLens. The Movie Details, Credits and Keywords have been collected from the TMDB Open API. Their API provides additional information on other movies, actors and actresses, crew members, and TV shows. The main Movies Metadata file. Contains information on 45,000 movies featured in the Full MovieLens dataset. Features include posters, backdrops, budget, revenue, release dates, languages, production countries and companies.

**How many observations (rows) are in your data?**

There are 45,467 observations(rows).

**How many features (columns) are in the data?**

There are 24 features(columns).

**What questions (from above) can be answered using the data in this dataset?**

- What is the most profitable movie up from movies between 2000 and 2017?
- Does budgeting affect movie popularity and/or profitability?
- What was the most popular movie?
- What were the top 3 genres of movies?

## Source 2

**Where did you download the data (e.g., a web URL)?**

- https://grouplens.org/datasets/movielens/latest/

**How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**

This dataset was collected by GroupLens, which is a research lab in the Department of Computer Science and Engineering at the University of Minnesota. It was a collaborative effort by 283228 users between January 09, 1995 and September 26, 2018 to create the dataset. Their goal was to collect data about movies to create a website that helps people find movies to watch. GroupLens was able to create datasets that contained scores, tags, links, genres, and ratings. But, the one dataset that we’re most concerned about is the movies.csv, which contains movie titles and genres that will help us answer our data-driven questions.

**How many observations (rows) are in your data?**

There are 193886 observations (rows).

**How many features (columns) are in the data?**

There are 3 features (columns).

**What questions (from above) can be answered using the data in this dataset?**

- What were the top 3 genres of movies?

## Source 3

**Where did you download the data (e.g., a web URL)?**

https://www.kaggle.com/juzershakir/tmdb-movies-dataset

**How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?**

This dataset was collected by Juzer Shakir, who investigated datasets for 10K+ movies from The Movie Database (TMDb). Shakir initially created his dataset to discover which movies had the highest profits and hits. But, overtime, he found that he wanted to learn more about the characteristics of movies and what similarities they had. This resulted in the current features that Shakir offers in his dataset: id, imbd_id, popularity, budget, revenue, original_title, cast, homepage, director, tagline, keywords, overview, runtime, genres, production_companies, release_date, vote_count, vote_average, release_year, budget_adj, and revenue_adj.

**How many observations (rows) are in your data?**

There are 10866 observations (rows)

**How many features (columns) are in the data?**

There are 21 features (columns).

**What questions (from above) can be answered using the data in this dataset?**

- What is the most profitable movie up from movies between 2000 and 2017?
- What was the most popular movie?
- What were the top 3 genres of movies?
