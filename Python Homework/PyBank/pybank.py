import pandas as pd
data = pd.read_csv('03-Python_Homework_Instructions_PyBank_Resources_budget_data.csv') #Get the data
profitTotal = 0 #Set the default values
prevItem = 867884
change =[]
for item in data['Profit/Losses'].iteritems(): #Get information about the profit
	change.append(item[1] - prevItem)
	profitTotal += item[1]
	prevItem = item[1]
results = f"Financial Analysis\n--------------------\nTotal Months: {len(data['Date'].unique())}\nTotal: ${profitTotal}\nAverage Change: ${sum(change)/(len(change)-1)}\nGreatest increase in profits: ${max(change)}\nGreatest decrease in profits: ${min(change)}"
print(results) #Print the results
file = open("results.txt","w+") #Record the results to a text document
file.write(results)
file.close()