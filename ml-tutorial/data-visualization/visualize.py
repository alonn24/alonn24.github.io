import sys
import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd

sys.path.append('../utils/')
import input_api

df = pd.read_csv("../keras/data/sales_data_training.csv")
scaled_df, _, _ = input_api.read_df("../keras/data/sales_data_training.csv", True)


def clustermap(): sns.clustermap(scaled_df)


def violinplot(): sns.violinplot(x="critic_rating", data=df)


def swarmplot(x, y): sns.swarmplot(x=x, y=y, data=df)


# clustermap()
# violinplot()
swarmplot('critic_rating', 'total_earnings')
plt.show()
