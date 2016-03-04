require 'rdbi'
require 'rdbi-driver-sqlite3'
require 'pry'

# データベース'fruits01.db'に接続する
dbh = RDBI.connect(:SQLite3, database: 'fruits01.db')

# テーブルからデータを読み込んで表示する
# select 文の実行
dbh.results_as_hash = true
sth = dbh.execute("select * from products;").fetch(:all)
binding.pry

# select文の実行結果を1件ずつrowに取り出し、繰り返し処理する
sth.each do |row|
  # rowは1件分のデータを保持しているので、
  # each_with_nameメソッドで値と項目名を取り出して表示する
  row.each do |val|
    puts "#{val.to_s}"
  end
  puts "------------"
end

# 実行結果を開放する
sth.finish

# データベースとの接続を終了する
dbh.disconnect
