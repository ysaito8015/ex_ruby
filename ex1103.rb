friends = {
  shin: "Shin Kuboaki",
  shinichirou: "Shinichirou Ooba",
  shingo: "Shingo Katori"
}

# ハッシュに要素を追加する
friends[ :shinsaku ] = "Shinsaku Takasugi"

# ハッシュの要素を検索する
puts friends.include?( :shinsaku )
puts friends[ :shinsaku ]

# 追加した要素を削除する
friends.delete( :shinsaku )

# ハッシュの要素を検索する
if friends.include?( :shinsaku ) then
  puts friends[:shinsaku]
else
  puts "見つかりません"
end
