# This file is meant to use Belloti's Points Created Statistic to gauge 
# player performance in the 2013-14 season. Through this, we will create two 
# tables:
# TABLE 1: This will show the top 25 players as per the Points Created Statistic
# TABLE 2: This will compare the Points created of big Three's in the league
#
# Performing this statistics will not only provide insight into the league and
# team performance, it will also judge how good the Points Created statistic is


setwd("/Users/kmeelu/cs/doingR/bellotis_points_created")

players = read.csv("leagues_NBA_2014_per_game_per_game.csv")
teaminfo = read.csv("spread.csv")

#Set the value of Ball Possessions to the value in 2013-14 season
VBP = 1.066

players = players[players[, 1] != "Rk",]
#Create a 1 column table of the players
names = players[,"Player"]
teams = players[,"Tm"]

#All the elements that are required for the Points Created stat
PTS = as.numeric(as.character(players[,"PTS"]))
AST = as.numeric(as.character(players[,"AST"]))
TRB = as.numeric(as.character(players[,"TRB"]))
STL = as.numeric(as.character(players[,"STL"]))
BLK = as.numeric(as.character(players[,"BLK"]))
TOV = as.numeric(as.character(players[,"TOV"]))
FGMiss = as.numeric(as.character(players[,"FGA"])) - 
	as.numeric(as.character(players[,"FG"]))
FTMiss = as.numeric(as.character(players[,"FTA"])) - 
	as.numeric(as.character(players[,"FT"]))
PF = as.numeric(as.character(players[,"PF"]))

#Points Created = PTS + AST * (2-VBP) + (REB+STL+BLK) *VBP - 
#                 (FGMiss + FTMiss + TOV) * VBP -0.5 * VBP *PF 
ptsC = (PTS + AST * (2-VBP) 
			+ (TRB+ STL + BLK)* VBP 
			- (TOV + FTMiss + FGMiss)*VBP 
			- 0.5 * VBP * PF)


#PART 1: Who are the top 25 players in the league - see points_created_leaders.csv

stat = data.frame (teams, names, ptsC)

stat <- stat[order(-stat$ptsC),]
topTwenty = stat[1:25,]

write.csv(topTwenty, file ="points_created_leaders")
write.csv(stat, file ="full_stats")

#PART 2: We'll evaluate the following stars over their careers:
#
#	Dwight Howard
#	Kobe Bryant
#	Kevin Durant
#	Lebron James
#	Tim Duncan
#	Tracy McGrady
#
#   This information is saved in the stars folder

kbryant = read.csv("stars/kbryant.csv")
dhoward = read.csv("stars/dhoward.csv")
kdurant = read.csv("stars/kdurant.csv")
ljames = read.csv("stars/ljames.csv")
tduncan = read.csv("stars/tduncan.csv")
tmcgrady = read.csv("stars/tmcgrady.csv")

findPTC <- function(p1) {
	PTS = as.numeric(as.character(p1[,"PTS"]))
	AST = as.numeric(as.character(p1[,"AST"]))
	TRB = as.numeric(as.character(p1[,"TRB"]))
	STL = as.numeric(as.character(p1[,"STL"]))
	BLK = as.numeric(as.character(p1[,"BLK"]))
	TOV = as.numeric(as.character(p1[,"TOV"]))
	FGMiss = as.numeric(as.character(p1[,"FGA"])) - 
		as.numeric(as.character(p1[,"FG"]))
	FTMiss = as.numeric(as.character(p1[,"FTA"])) - 
		as.numeric(as.character(p1[,"FT"]))
	PF = as.numeric(as.character(p1[,"PF"]))

	ptsC = (PTS + AST * (2-VBP) 
			+ (TRB+ STL + BLK)* VBP 
			- (TOV + FTMiss + FGMiss)*VBP 
			- 0.5 * VBP * PF)

	return (ptsC)

}

kbryant_pc = data.frame("Season" = kbryant[,"Season"], "Team" = kbryant[, "Tm"], "Points Created" = findPTC(kbryant))
dhoward_pc = data.frame("Season" = dhoward[,"Season"], "Team" = dhoward[, "Tm"], "Points Created" = findPTC(dhoward))
kdurant_pc = data.frame("Season" = kdurant[,"Season"], "Team" = kdurant[, "Tm"], "Points Created" = findPTC(kdurant))
ljames_pc = data.frame("Season" = ljames[,"Season"], "Team" = ljames[, "Tm"], "Points Created" = findPTC(ljames))
tduncan_pc = data.frame("Season" = tduncan[,"Season"], "Team" = tduncan[, "Tm"], "Points Created" = findPTC(tduncan))
tmcgrady_pc = data.frame("Season" = tmcgrady[,"Season"], "Team" = tmcgrady[, "Tm"], 
                         "Points Created" = findPTC(tmcgrady))

# write.csv(stat, file ="full_stats")






