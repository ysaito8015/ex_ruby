# 配列にデータを作成
fruits = %W(apple banana cherry fig grape)

# ファイル名を変数に割り当てる
fname = "sample7.txt"

# "sample7.txt" を書き込みモードで新規に作成
open(fname, "w:UTF-8") do |file|
  fruits.each do |fruit|
    file.puts fruit
  end
end

# "sample7.txt" を読込モードでオープンする
open(fname, "r:UTF-8") do |file|
  # ファイルの行を1行ずつ取り出して、lineに読み込む
  file.each do |line|
    # lineを表示する
    print line
  end
end

# "sample7.txt" を削除する
File.delete(fname)

# "sample7.txt" を読込モードでオープンする
# ファイルが削除されているのでエラーが発生するはず
open(fname, "r:UTF-8")
