# �ϥ�for loop �L�X�E�E���k��
# Ex: (1x1=1 1x2=2...1x9=9 ~ 9x1=9 9x2=18... 9x9=81)

for(i in c(1:9)){
  for(j in c(1:9)){
    mul <- i*j
    print(paste(i,"x",j,"=",mul))
  }
}
