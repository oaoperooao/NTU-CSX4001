# 猜數字遊戲
# 基本功能
# 1. 請寫一個由"電腦隨機產生"不同數字的四位數(1A2B遊戲)
# 2. 玩家可"重覆"猜電腦所產生的數字，並提示猜測的結果(EX:1A2B)
# 3. 一旦猜對，系統可自動計算玩家猜測的次數
cor.num <- as.character(sample(x=c(0:9),size = 4))
error  <- 0
A <- 0
c.ter<- 0

while(A!=4){
  error <- 0

  while(error!=4){
    error <- 0
    orinum <- readline("Input a four-letter number:")
    orinumX <- substring(orinum, 1:4, 1:4)
    orinum <- substring(orinum, 1:9, 1:9)
    
    while(orinum > 9876||orinum<=0||orinum[5]!=""){
      print("Invalid Input.Please go back.")
      orinum <- readline("Input a four-letter number:")
      orinumX <- substring(orinum,1:4, 1:4)
      orinum <- substring(orinum, 1:9, 1:9)
    }
    
    ans <- orinumX
    
    for(i in orinumX){
      for(j in orinumX){
        if (i == j){
          error<- error+1
        }
      }
    }
    
    if(error!=4)  print("Invalid Input.Please go back.")
  }

  cp.table <- data.frame (cor.num,orinumX)
  cp.table
  A <- 0
  B <- 0
  # 確認A的數量
  for (i in c(1:4)) {
    if(cp.table[i, 1] == cp.table[i, 2])  A <- A+1
  }
  count<- 0
  
  # 確認A+B的數量
  for(i in cor.num){
    for(j in orinumX){
      if (i == j)        count<- count+1
    }
    if (count != 0){
      B <- B+1
      count<- 0
    }
  }
  
  B <- B-A
  if(A!=4)  print(paste(A,"A",B,"B"))
  c.ter<- c.ter+1
}
  print("YAY! YOU WON!!")
  cat("The answer is ",ans)
  print(paste("You guessed",c.ter,"times."))
