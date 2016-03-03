require 'dbi'

# データベース'fruits01.db'に接続する
dbh = DBI.connect('DBI:SQLite3:fruits01.db')

# テーブルに登録されたデータを削除する
# delete 文の実行
# sthにexecuteメソッドが返すステートメントハンドルを保持
sth = dbh.execute("delete from products;")
puts "all records are deleted."

# 実行結果を開放する
sth.finish

# データベースとの接続を終了する
dbh.disconnect
