# "sample1.txt" を読込モードでオープンする
file = open("sample1.txt", "r:UTF-8")

# ファイルの行を1行ずつ取り出して、lineに読み込む
file.each do |line|
  # lineを表示する
  print line
end

# ファイルを閉じる
file.close
