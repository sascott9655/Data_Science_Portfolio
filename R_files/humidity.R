#Trying to go on a bike ride today. Hopefully the humidity is not too high. 
humidity = 45


if (humidity<40) {
	print("Perfect for a trip")
} else if (humidity>70) {
	print("Not suitable for a trip")
} else {
	print("May or may not be suitable for a trip")
}

# We have the forecast for the next 7 days on humidity
#Humidity percentages are stored in a vector
humidity <- c(20,30,60,70,65,40,35)

count <- 1
while (count <= 7) {
cat ("Weather for day", count, ":")
if (humidity[count] < 40) {
print ("Perfect for a trip")
} else if (humidity[count] > 70) {
	print("Not suitable for a trip!")
} else {
	print("May or may not be suitable for a trip")
}
count = count + 1
}

#for for loops it would be for(count in 1:7) instead of the while loop convention


