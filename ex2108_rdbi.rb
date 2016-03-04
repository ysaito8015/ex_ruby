require 'rdbi'
require 'rdbi-driver-sqlite3'

# データベース'fruits01.db'に接続する
dbh = RDBI.connect(:SQLite3, database: 'fruits01.db')

# デーブルにデータを追加する
dbh.execute("insert into products values (
       1,
       'リンゴ',
       '別名「雪の下」と呼ばれる国光です。',
       '/images/kokkou.jpg',
       '300',
       '2009-02-01 09:15:00'
       ),(
       2,
       'マンゴー',
       '宮崎名産「太陽のたまご」です。',
       '/images/mango.jpg',
       '2000',
       '2009-03-20 00:00:00');")

puts '2 records inserted.'

# データベースとの接続を終了する
dbh.disconnect
