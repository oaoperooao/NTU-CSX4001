# 叫糶琿祘Α絏耞块ぇ﹁じだ year 琌秥
#秥砏玥
#1硔4计秥
#2硔100计ぃ秥
#3硔400计秥
#4硔4000计ぃ秥

year <- c(scan())
for(i in year){
  if (i%%4000==0) {
    print(paste(i,"獶秥"))
  }
  else if (i%%400==0) {
    print(paste(i,"秥"))
  }
  else if (i%%100==0) {
    print(paste(i,"獶秥"))
  }
  else if (i%%4==0) {
    print(paste(i,"秥"))
  }
  else {
    print(paste(i,"獶秥"))
  }
}
