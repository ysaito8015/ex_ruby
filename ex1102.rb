friends = {
  shin: "Shin Kuboaki",
  shinichirou: "Shinichirou Ooba",
  shingo: "Shingo Katori"
}

# ハッシュの要素を1つずつ処理する
# 繰り返しの都度、キーをブロック内のローカル変数keyに渡す
friends.each_key do |key|
  # ローカル変数の値を表示する
  puts "#{key} "
end
