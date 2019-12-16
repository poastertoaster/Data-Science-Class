import pandas as pd
data = pd.read_csv('03-Python_Homework_Instructions_PyPoll_Resources_election_data.csv')['Candidate'].value_counts() #Find the candidates and their vote totals
voteTotal = 0
for item in data.iteritems(): #Go through the candidates and add their total to the overall count
	voteTotal += item[1]
winner = [winner for winner in data.iteritems() if winner[1] == max(data)] #Find the winner by finding who has the most votes
print(f'--------------------\n{winner[0][0].upper()} WINS!\n--------------------') #Print the results.
for item in data.iteritems():
	print(f'{item[0]} - {int((item[1]/voteTotal)*100)}% ({item[1]} of {voteTotal} votes)')
file = open("results.txt","w+") #Write the results to a text file
file.write(f'--------------------\n{winner[0][0].upper()} WINS!\n--------------------\n')
for item in data.iteritems():
	file.write(f'{item[0]} - {int((item[1]/voteTotal)*100)}% ({item[1]} of {voteTotal} votes)\n')
file.close()