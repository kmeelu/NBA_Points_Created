# Evaluating Players with the Points Created Statistic
In the late 1980s, Bob Belloti, a sports analyst, came up with his "points created" statistic. This statistic is meant to count how many points a player contributes in any given period of time (e.g. a quarter, a game, a season, a career). 

The details and reasoning behind this statistic is sound and can be explored into more detail at the following link: http://bit.ly/1DZtELb. Essentially, the statistic for a given player can be calculated as such:

Points Created = PTS + AST * (2-VBP) + (REB + STL + BLK) * VBP - (FGMiss + FTMiss + TOV) * VBP – 0.5 * VBP * PF

Where PTS = points, AST = assists, REB = rebounds, STL = steals, BLK = blocks, FGMiss = number of missed field goals, FTMiss = number of missed free throws, TOV = turnovers, PF = personal fouls, and VBP = value of ball possession. The key to this formula is the VBP value, which Belloti defines as the league average points per 100 possessions in the previous year. 

Thus, this project outlines certain components of the points created statistic. That is, the file topPlayers.R contains the code that write the points_created_leaders file (which defines the league leaders in Points Created in the 2013-14 season) and the code that writes the files in the stars folders (which defines the points created trend for a select few "superstars" in the NBA). 

If you detect any errors or have questions regarding this project, please contact me, either on github or via email at kshitijh.meelu@yale.edu
