library(tools); library(dplyr)

# Read sample key
key = read.csv("/Volumes/Elements SE/filekey.csv")

# Assign files
files = list.files("/Volumes/Elements SE/", recursive = T, pattern = "*.txt", full.names = T)

# Read files and put all files and md5 in the same table
dat = lapply(files, read.table, stringsAsFactors=F) %>% 
  bind_rows() %>% 
# get the folder name for each file
  mutate(path = sub("_\\d.fq.gz", "",V2),
# calculate md5 for each file
  md5_downloaded = md5sum(paste0("/Volumes/Elements SE/",path,"/",V2)),
#compare the downloaded md5 against the provided md5 from the company
  match = ifelse(V1 == md5_downloaded, yes = "Y", no = "FAIL"))

ifelse(all(dat$V1 == dat$md5_downloaded)==T, print("All the md5sums match"), print("Some do not match, check file"))



