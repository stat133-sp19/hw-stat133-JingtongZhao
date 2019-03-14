########################################################
## title: shots data
## description: to create a csv data file shots-data.csv that will contain the
## required variables to be used in the visualization phase.
## input(s): stephen-curry.csv,andre-iguodala.csv,draymond-green.csv,kevin-durant.csv,klay-thompson.csv
## output(s): stephen-curry-summary.txt,andre-iguodala-summary.txt,draymond-green-summary.txt,
## kevin-durant-summary.txt,klay-thompson-summary.txt,shots-data.csv,shots-data-summary.txt
########################################################


curry = read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
ai = read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
dg = read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
kd = read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
kt = read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)

curry$name = 'Stephen Curry'
ai$name = 'Andre Iguodala'
dg$name = 'Draymond Green'
kd$name = 'Kevin Duran'
kt$name = 'Klay Thompson'
#Change the original values of shot_made_flag to more descriptive values: replace "n"
# with "shot_no", and "y" with "shot_yes". Hint: you can use logical subsetting for
# this operation (no need to use programming structures that we haven’t covered yet).
curry[curry$shot_made_flag == "n","shot_made_flag"] = 'shot_no'
curry[curry$shot_made_flag == "y","shot_made_flag"] = 'shot_yes'
ai[ai$shot_made_flag == "n","shot_made_flag"] = 'shot_no'
ai[ai$shot_made_flag == "y","shot_made_flag"] = 'shot_yes'
dg[dg$shot_made_flag == "n","shot_made_flag"] = 'shot_no'
dg[dg$shot_made_flag == "y","shot_made_flag"] = 'shot_yes'
kd[kd$shot_made_flag == "n","shot_made_flag"] = 'shot_no'
kd[kd$shot_made_flag == "y","shot_made_flag"] = 'shot_yes'
kt[kt$shot_made_flag == "n","shot_made_flag"] = 'shot_no'
kt[kt$shot_made_flag == "y","shot_made_flag"] = 'shot_yes'

# Add a column minute that contains the minute number where a shot occurred. For
# instance, if a shot took place during period = 1 and minutes_remaining = 8, then
# this should correspond to a value minute = 4. Likewise, if a shot took place during
# period = 4 and minutes_remaining = 2 then this should correspond to a value
# minute = 46. Hint: you can use logical subsetting for these operations (no need to use
# programming structures that we haven’t covered yet).
curry$minute = curry$period*12-curry$minutes_remaining
ai$minute = ai$period*12-ai$minutes_remaining
dg$minute = dg$period*12-dg$minutes_remaining
kd$minute = kd$period*12-kd$minutes_remaining
kt$minute = kt$period*12-kt$minutes_remaining

sink(file = '../output/andre-iguodala-summary.txt')
summary(ai)
# closing sinking operation
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(dg)
# closing sinking operation
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(kd)
# closing sinking operation
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(kt)
# closing sinking operation
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
# closing sinking operation
sink()

#Use the row binding function rbind() to stack the tables into one single data frame
#(or tibble object).
bind = rbind(ai,curry,dg,kd,kt)

# Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder
#data/. Use a relative path for this operation.
write.csv(x=bind,file = '../data/shots-data.csv')

# closing sinking operation


# Use sink() to send the summary() output of the assembled table. Send this output to
# a text file named shots-data-summary.txt inside the output/ folder. Use a relative
# path when exporting the R output.
sink(file = '../output/shots-data-summary.txt')
summary(bind)
# closing sinking operation
sink()