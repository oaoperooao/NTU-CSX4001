# ㄏノsample(), 玻10ざ10~100俱计跑计 nums
nums <- sample(x = c(10:100) , size = 10)

# 琩nums
nums

# 1.ㄏノfor loop の if-else50案计矗ボ("案计50": 计value)
# 2.疭砏玥璝计66玥矗ボ("び66666666666")いゎ癹伴
for(i in nums){
  if (i == 66){
    print("び66666666666")
    break
  }
    else if (i%%2 == 0){
    if (i>50){
      print(paste("案计50:",i))
    }
  }
}

