title=read_html("https://zh.wikipedia.org/wiki/%E5%88%80%E5%8A%8D%E7%A5%9E%E5%9F%9F#%E5%8B%95%E7%95%AB%E5%8A%87%E5%A0%B4%E7%89%88")   
#輸入你要爬取網頁的網址，爬取此網頁的html資訊 

title=html_nodes(title,".wikitable:nth-child(170) td , th tr , .wikitable:nth-child(170)")   
#函數首先代入剛剛的網頁資訊，逗號後就是很重要的輸入你前面使用Selector複製的程式碼，他會從此網頁中篩選出剛剛你想要爬的新聞標題。 

title=html_text(title)   # 只篩選出文字

title
