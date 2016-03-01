# Studentクラスを作る
class Student
  # Studentクラスのインスタンスを初期化する
  def initialize( name, age )
    @name = name
    @age = age
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
