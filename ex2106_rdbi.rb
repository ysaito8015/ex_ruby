require 'rdbi'
require 'rdbi-driver-sqlite3'

# dbhを作成し、データベース'students01.db'に接続する
# 引数は、データソース名(DSN=data source name)を設定する
# DSNの第1要素はデータソースの種別：DBIでは'DBI'
# DSNの第2要素はドライバ種別：'SQLite3'
# DSNの第3要素はデータベースファイル名：'students01.db'
dbh = RDBI.connect(:SQLite3, database: 'students01.db')

# select文でデータを検索し、読み込んだデータを表示する
dbh.execute('select * from students').fetch(:all).each do |row|
  # SQL"select * from students"を実行し
  # 1行ずつをrowで受け取ってブロックを処理する
  print "row=#{row}           \n"
  print "  name = #{row[0]}\n"
  print "  age  = #{row[1]}\n"
  print "\n"
end

# データベースとの接続を終了する
dbh.disconnect
