# An example R Script
# 
# Description: An example R Script
# Author: Sebastian Warnholz
# License: GPL-3

# Dealing with inputs
print(commandArgs())

args <- commandArgs(trailingOnly = TRUE) # character

mc.cores <- as.numeric(args[1])
fileName <- as.character(args[2])

library("parallel")

cat("Starting with computation ...")
res <- mclapply(1:4, function(i) {
  Sys.sleep(10)
  i
}, mc.cores = mc.cores)

cat("Done\n")
Sys.sleep(1)
save(res, file = fileName)
q(save = "no", runLast = FALSE, status = 0)
