###2. For this clustering exercise, you are going to use the data on women professional
#golfers’ performance on the LPGA, 2008 tour (“lpga2008.csv” dataset). The dataset has
#the following attributes:
#  i. Golfer: name of the player
#ii. Average Drive distance
#iii. Fairway Percentage
#iv. Greens in regulation: in percentage
#v. Average putts per round
#vi. Sand attempts per round
#vii. Sand saves: in percentage
#viii. Total Winnings per round
#ix. Log: Calculated as (Total Win/Round)
#2 of 2
#x. Total Rounds
#xi. Id: Unique ID representing each player
#(Implement this exercise in R language; import ‘cluster’ library)
#Use agglomerative clustering and divisive clustering on this dataset to find out which
#players have similar performance in the same season. Visualize the clusters using
#dendrograms for both types of clustering models.

golfers <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/lpga2008.csv', header=TRUE, sep=',')
View(golfers)





