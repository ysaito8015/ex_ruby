str = "Twinkle, twinkle, littele star,
How I wonder what you are,
Up above the world so high,
Like a diamond in the sky.
Twinkle, twinkle, little star,
How I wonder what you are.."

# 上の歌詞を行ごとに分割
lines = str.split(/\n/)

# "you"にマッチする行を表示する
puts "youが含まれていた行"
lines.each do |line|
  if line =~ /[Yy]ou/ then
    puts line
  end
end

puts ""

# 行末に","が来ている行を表示する
puts "行末にカンマが含まれていた行"
lines.each do |line|
  if line =~ /,$/ then
    puts line
  end
end

puts ""

# "i"が来て2文字おいて"l"が来る文字列が含まれる
puts '"i"がきて2文字おいて"l"が来る文字列が含まれる行'
lines.each do |line|
  if line =~ /i..l/ then
    puts line
  end
end
