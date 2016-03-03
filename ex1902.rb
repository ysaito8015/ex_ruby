require 'pstore'

# 文字列を作成
juice = "orange juice"
# 配列にデータを作成
fruits = %W(apple banana cherry fig grape)

# PStoreデータベースを作成する
db = PStore.new('fruitdb')

# PStoreが読込モードの時に
# 書き込もうとするとエラーになる
db.transaction(true) do
  db["drink"] = "grape juice"
end
