### practice_2
### course_grade


# Create a vector called course.students.number, with data: c(1, 30)
course.student.number <-  c(1: 30)
#設定變數為1至30的數列
  
  # Create a variable csn, with data: length of course.student.number
  csn <- length(course.student.number)
  #設定變數為陣列長度
    
  # Create a vector course.student.grade, with sample() function: x = c(55:100), size = csn
  course.student.grade <- sample(x = c(55:100), size = csn)
  #隨機採樣 使用方式：sample(x = 取樣範圍,size = 取得數)
  
  # Assign course.student.number as names of the course.student.grade
  names(course.student.grade) <- course.student.number
  #給對應分數編號(一一對應)
  
  # Create csg.mean, with the mean value of course.student.grade
  csg.mean <- mean(course.student.grade)
  #取平均值
  
  # Create csg.max with the max value of course.student.grade
  csg.max <- max(course.student.grade)
  #取最大值
  
  # Create csg.min with the min value of course.student.grade
  csg.min <- min(course.student.grade)
  #取最小值
  
  # Create a vector csg.over.80, with the logical result of course.student.grade over 80
  csg.over.80 <- course.student.grade >= 80
  #建立判斷式-->布林常數紀錄
  
  # Check csg.over.mean
  csg.over.80
  #確認判斷式正常

# Filter the course.student.grade with csg.over.mean
course.student.grade[csg.over.80]
#成績過篩

# Print course information
print(paste("全班人數:", csn))
print(paste("全班平均：", csg.mean))
print(paste("全班最高：", csg.max))
print(paste("全班最低：", csg.min))

# Print over 80 details
 print(paste("高於80分總人數：", length(course.student.grade[csg.over.80])))
 print(paste("高於80分座號：", names(course.student.grade[csg.over.80])))
 