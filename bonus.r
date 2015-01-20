#	This file ranks the total points that several "Big Threes" in the league create, to see
#   which Big 3 is the "best". However, this experiment is defunct due to either inconclusive or obvious
#   results.
#
#   DAL: Dirk Nowitzki, Monta Ellis, Chandler Parsons
#	CHI: Derrick Rose, Joakim Noah, Pau Gasol
#	CLE: Lebron James, Kevin Love, Kyrie Irving
#	GSW: Andre Iguodala, Stephen Curry, David Lee
#	POR: Damian Lillard, LaMarcus Aldridge, Nicholas Batum
#	LAC: Chris Paul, Blake Griffin, DeAndre Jordan
#	SAS: Tim Duncan, Manu Ginobli, Tony Parker
#	MEM: Mike Conley, Zach Randolph, Mark Gasol
#	OKC: Kevin Durant, Russell Westbrook, Serge Ibaka


# MIA = stat[stat[,2] == "LeBron James" | stat[,2] == "Chris Bosh" |
# 	stat[,2] == "Dwyane Wade",2:3]

# GSW = stat[stat[,2] == "Andre Iguodala" | stat[,2] == "Stephen Curry" |
# 	stat[,2] == "David Lee",2:3]

# POR = stat[stat[,2] == "Damian Lillard" | stat[,2] == "LaMarcus Aldridge" |
# 	stat[,2] == "Nicolas Batum",2:3]

# LAC = stat[stat[,2] == "Chris Paul" | stat[,2] == "Blake Griffin" |
# 	stat[,2] == "DeAndre Jordan",2:3]

# OKC = stat[stat[,2] == "Kevin Durant" | stat[,2] == "Russell Westbrook" |
# 	stat[,2] == "Serge Ibaka",2:3]


# Big3_names = c("MIA", "GSW", "POR", "LAC", "OKC")
# Big3_points = c(sum(MIA[,2]), sum(GSW[,2]), sum(POR[,2]), sum(LAC[,2]), 
# 	 sum(OKC[,2]))

# BigThrees = data.frame(Big3_names, Big3_points)

# BigThrees <- BigThrees[order(-BigThrees$Big3_points),]


#70% of top 5
#50% of top 8
#

teamnames = teaminfo[,"Nickname"]
for (i in teamnames){
	full = stat[stat[,1] == i,3]
	part = full[1:3]
	starters = full[1:5]
	eight = full[1:8]
	percentageFive = sum(part)/sum(starters)
	percentageEight = sum(part)/sum(eight)
	if (percentageFive >= .65 & percentageEight >= .5 & full[3] > 15){
		print(i)
	}
}





