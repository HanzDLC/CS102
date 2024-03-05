# A

warpbreaks
numIntFunction <- sapply(warpbreaks, function(identify) is.numeric(identify) || is.integer(identify))


#find ount what type of data is in each column
columnTypes <- sapply(warpbreaks, typeof)

numCol <- names(columnTypes[columnTypes == "double"])

warpbreaks[numCol] <- lapply(warpbreaks[numCol], function(x) 
                             if(is.numeric(x)) as.integer(x) 
                             else x)

#derive error
errorDerive <- tryCatch({
  result <- sampleFunc(0989878554323)
},
  error = function(errorCreator) {

  print(paste("Error message:", e$message))
  
  print(paste("Underlying type:", typeof(e$object)))
})



#B 
exTxt <- file('exampleFile.txt')

exampleTxt <- readLines(exTxt)

#extract date
dateLine <- as.character(exampleTxt[grep("^//", exampleTxt, value = TRUE)[1]])
extractedDate <- sub("^// Survey data. Created : ", "", dateLine)
extractedDate <- as.character(extractedDate)


#separate the comments by using grepl 
sepComment <- grepl("^//", exampleTxt)

remComment <- exampleTxt[!sepComment]
remComment

#split the semicolon using strsplit
colSplit <- strsplit(remComment, split = ";")

#find the maxnumber of fields
maxFields <- max(sapply(colSplit, length))

# append rows 
colSplitAdd <- lapply(colSplit, function(x) c(x, rep(NA, maxFields - length(x))))

# unlist
dataMatr <- matrix(unlist(colSplitAdd), ncol = maxFields)

# extraction of names and fields
fieldNames <- sapply(exampleTxt[2:4], function(x) sub("^// Field [0-3]+: ", "", x))
fieldNames

colnames(dataMatr) <- fieldNames
dataMatr


  
  
  