require 'rdbi'
require 'rdbi-driver-sqlite3'

# データベース'fruits01.db'に接続する
dbh = RDBI.connect(:SQLite3, database: 'bookinfo_sqlite.db')

# デーブルにデータを追加する
dbh.execute("insert into bookinfos values (
      'Yamada2005',
      '実践アジャイル　ソフトウェア開発法とプロジェクト管理',
      '山田　正樹',
      248,
      '2005-1-25'
      ),(
      'Ooba2005',
      '入門LEGO MINDSTORMS NXT レゴブロックで作る動くロボット',
      '大庭　真一郎',
      164,
      '2006-12-23');")

puts '2 records inserted.'

# データベースとの接続を終了する
dbh.disconnect
