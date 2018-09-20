# 猜數字遊戲
# 基本功能
# 1. 請寫一個由"電腦隨機產生"不同數字的四位數(1A2B遊戲)
# 2. 玩家可"重覆"猜電腦所產生的數字，並提示猜測的結果(EX:1A2B)
# 3. 一旦猜對，系統可自動計算玩家猜測的次數
cor.num <- sample(x=c(0:9),size = 4)
error  <- 0
A <- 0
c.ter<- 0
while(A!=4){
  error <- 0
  while(error!=4){
    error <- 0
    print("Input a four-letter number:")
    orinum <- scan("")
    while(orinum > 9876||orinum<=0){
      print("Invalid Input.Please go back.")
      print("Input a four-letter number:")
      orinum <- scan("")

    }
    ans <- orinum
  
    A.guess <- orinum%/%1000
    A.int <- as.integer(A.guess)
    orinum <- orinum%%1000
  
    B.guess <- orinum%/%100
    B.int <- as.integer(B.guess)
    orinum <- orinum%%100

    C.guess <- orinum%/%10
    C.int <- as.integer(C.guess)
    orinum <- orinum%%10
    
    D.guess <- orinum
    D.int <- as.integer(D.guess)
    guess <- c(A.int,B.int,C.int,D.int)
    for(i in guess){
      for(j in guess){
        if (i == j){
          error<- error+1
        }
      }
    }
    if(error!=4)  print("Invalid Input.Please go back.")
  }
  cp.table <- data.frame (cor.num,guess)
  cp.table
  A <- 0
  B <- 0
# 確認A的數量
  for (i in c(1:4)){
    if(cp.table[i, 1] == cp.table[i, 2])  A <- A+1
  }
# 確認A+B的數量
  count<- 0
  
  for(i in cor.num){
    for(j in guess){
      if (i == j){
        count<- count+1
      }
    }
    if (count != 0){
      B <- B+1
      count<- 0
    }
  }
#  A+B-A
  B <- B-A
  if(A!=4)  print(paste(A,"A",B,"B"))
  c.ter<- c.ter+1
}
  print("YAY! YOU WON!!")
  print(paste("The answer is ",ans))
  print(paste("You guessed",c.ter,"times."))
  
  
