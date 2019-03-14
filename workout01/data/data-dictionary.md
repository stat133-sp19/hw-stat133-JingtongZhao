---
title: "data-dictionary"
author: "Jingtong Zhao"
date: "3/12/2019"
output: html_document
---


This dictionary includes a short description for the variables in the following files:

* andre-iguodala.csv
* draymond-green.csv
* kevin-durant.csv
* klay-thompson.csv
* stephen-curry.csv

##Dictionary:
**team_name**: name of the team

**game_date**: date of the game

**season**: season of the game

**period**: an NBA game is divided in 4 periods of 12 mins each. For example, a value for period = 1 refers to the first period (the first 12 mins of the game)

**minutes_remaining**:the amount of time in minutes, respectively, that remained to be played in a given period

**second_remaining**:the amount of time in seconds, respectively, that remained to be played in a given period

**shot_made_flag**: indicates whether a shot was made (y) or missed (n)

**action_type**: has to do with the basketball moves used by players, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer

**shot_type**: indicates whether a shot is a 2-point field goal, or a 3-point field goal

**shot_distance**: distance to the basket (measured in feet)

**x**: the court x-coordinates (measured in inches) where a shot occurred

**y**: the court y-coordinates (measured in inches) where a shot occurred
