##Without using the multiplication operator (*), write a multiplication script
##that takes two
##numbers as input and outputs the product using either a “for” loop
##or a “while” loop.
##Show your script. 

mult = function(x,y) {
count = 0
	for (i in 1:x) {
	  for (j in 1:y) {
		if(j <= y) {
		  count = count + 1
		}
		j = j + 1
	  }
	 i = i + 1
	}
	return (count)
}