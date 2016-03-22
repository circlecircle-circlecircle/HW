library(SportsAnalytics)
NBA1415<-fetch_NBAPlayerStatistics("14-15")

MaxPoint<-aggregate(TotalPoints~Team,NBA1415,max)
NBA1415MaxPoint<-merge(NBA1415,MaxPoint)
output<-NBA1415MaxPoint[order(NBA1415MaxPoint$TotalPoints,decreasing = T),c("Team","Name","TotalPoints")]
library(knitr)
kable(output, digits=2)

HardestPerson<-aggregate(TotalMinutesPlayed~Team,NBA1415,max)
NBA1415Hardest<-merge(NBA1415,HardestPerson)
output<-NBA1415Hardest[order(NBA1415Hardest$TotalMinutesPlayed,decreasing = T),c("Team","Name","TotalMinutesPlayed")]
library(knitr)
kable(output, digits=2)

EffectivePlayer<-aggregate(TotalPoints/TotalMinutesPlayed~Name,NBA1415,max)
NBA1415EffectivePlayer<-merge(NBA1415,EffectivePlayer)
EffectivePlayerTeam<-aggregate(TotalPoints/TotalMinutesPlayed~Team,NBA1415EffectivePlayer,max)
NBA1415EffectivePlayerTeam<-merge(NBA1415EffectivePlayer,EffectivePlayerTeam)
output<-NBA1415EffectivePlayerTeam[order(NBA1415EffectivePlayerTeam$`TotalPoints/TotalMinutesPlayed`,decreasing = T),c("Team","Name","TotalPoints/TotalMinutesPlayed")]
library(knitr)
kable(output, digits=2)

ThreeMadeName<-aggregate(ThreesMade/ThreesAttempted~Name,NBA1415,max)
NBA1415Name<-merge(NBA1415,ThreeMadeName)
ThreeMadeTeam<-aggregate(ThreesMade/ThreesAttempted~Team,NBA1415,max)
NBA1415Team<-merge(NBA1415Name,ThreeMadeTeam)
output<-NBA1415Team[order(NBA1415Team$`ThreesMade/ThreesAttempted`,decreasing = T),c("Team","Name","ThreesMade/ThreesAttempted")]
library(knitr)
kable(output, digits=2)