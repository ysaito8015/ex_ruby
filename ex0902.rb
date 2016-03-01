# Studentクラスを作る
class Student
  # Studentクラスのインスタンスを初期化する
  def initialize( name, age )
    @name = name
    @age = age
  end

  # name 属性のゲッターメソッド
  def name
    @name
  end

  # age 属性のゲッターメソッド
  def age
    @age
  end

  # Student クラスのインスタンスの文字列を返す
  def to_s
    "#@name, #@age"
  end
end

# Student クラスのインスタンスを作成する
shin = Student.new('久保秋　真', 45)
hiroshi = Student.new('久保秋　博', 41)

# インスタンスの名前と年齢を表示する
puts shin.to_s
puts hiroshi.to_s

# ゲッターを使ってインスタンスの名前と年齢を表示する
puts "氏名：#{shin.name}, 年齢：#{shin.age}歳"
puts "氏名：#{hiroshi.name}, 年齢：#{hiroshi.age}歳"
