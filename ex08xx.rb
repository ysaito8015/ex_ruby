book1 = %W(
実践アジャイル　ソフトウェア開発法とプロジェクト管理
山田　正樹
やまだ　まさき
ソフトリサーチセンター
248ページ
2500円
2650円
4883732088
978-4883732081
21\ x\ 14.8\ x\ 2
2005-01-25
2005-02-02
)
book2 = %W(
入門LEGO MINDSTORMS NXT レゴブロックで作る動くロボット
大庭　真一郎
おおば　しんいちろう
ソフトバンククリエイティブ
164ページ
2400円
2520円
4797338253
978-4797338256
23\ x\ 18.2\ x\ 1.6
2006-12-23
2007-01-10
)

head = %W(
書籍名：  
著者名：  
よみがな：
出版社：  
ページ数：
販売価格：
購入費用：
ISBN_10： 
ISBN_13： 
寸法：    
発刊日：  
購入日：  
)

alist1 = head.zip(book1)
alist1 = alist1.inject({}){|h, (k, v)| h[k.to_sym] = v; h}

alist2 = head.zip(book2)
alist2 = alist2.inject({}){|h, (k, v)| h[k.to_sym] = v; h}
b1 = Hash[alist1]
b2 = Hash[alist2]

params = {b1: b1, b2: b2}

params.each_value do |book|
  puts "--------------------"
  book.each do |key,val|
    puts "#{key}  #{val}"
  end
end
=begin
出力例
--------------------
書籍名：  実践アジャイル　ソフトウェア開発法とプロジェクト管理
著者名：  山田　正樹
よみがな：やまだ　まさき
出版社：  ソフトリサーチセンター
ページ数：248ページ
販売価格：2500円
購入費用：2650円
ISBN_10： 4883732088
ISBN_13： 978-4883732081
寸法：    21 x 14.8 x 2
発刊日：  2005-01-25
購入日：  2005-02-02
--------------------
書籍名：  入門LEGO MINDSTORMS NXT レゴブロックで作る動くロボット
著者名：  大庭　真一郎
よみがな：おおば　しんいちろう
出版社：  ソフトバンククリエイティブ
ページ数：164ページ
販売価格：2400円
購入費用：2520円
ISBN_10： 4797338253
ISBN_13： 978-4797338256
寸法：    23 x 18.2 x 1.6
発刊日：  2006-12-23
購入日：  2007-01-10
=end
