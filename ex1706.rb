# 'sample1.txt' を読込モードでオープンする
file = open("sample1.txt", "r:UTF-8") do |file| # 処理はブロックとして渡す

  # ファイルの行を１行ずつ取り出して、lineに読み込む
  file.each do |line|
    # lineを表示する
    print line
  end
end # ファイルは自動的に閉じてもらえる
