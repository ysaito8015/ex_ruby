require 'rdbi'
require 'rdbi-driver-sqlite3'

# dbhを作成し、データベース'fruits01.db'に接続する
# もしすでに存在するときは、そのデータベースファイルを開く
dbh = RDBI.connect(:SQLite3, database: 'fruits01.db')

# もしすでにこのデータベースにテーブル'products'があれば削除する
dbh.execute("drop table if exists products")
puts "table 'products' has dropped."

# 新しく'products'テーブルを作成する
dbh.execute("create table products (
       id int not null,
       title varchar(100) not null,
       description text not null,
       image_url varchar(200) not null,
       price int not null,
       date_available datetime not null,
       primary key(id) );")
puts "table 'products' has created."

# データベースとの接続を終了する
dbh.disconnect
