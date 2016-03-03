# 'sample1.txt' を読込モードでオープンする
file = open("sample1.txt", "r:UTF-8")

# ファイルからデータをすべて読み込み、それを表示する
print file.read

# ファイルを閉じる
file.close
