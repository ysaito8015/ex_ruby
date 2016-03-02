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

# StudentBookアプリケーションのインスタンスを作る
class StudentBook
  def initialize
    @students = {}
  end

  def setUpStudents
    # 新しいハッシュを作成し、Studentクラスのインスタンスを複数作成する
    # 処理を手続きにする
    @students = { # studentsをインスタンス変数に変更
      shin: Student.new("Shin Kuboaki", 45),
      shinichirou: Student.new("Shinichirou Ooba", 35),
      shingo: Student.new("Shingo Katori", 30),
    }
  end

    # すべてのインスタンスの名前と年齢を表示する
    # 処理を手続きにする
    def printStudents
      @students.each do |key, value| # studentsをインスタンス変数に変更
        puts "#{key} #{value.to_s}"
      end
    end

    # StudentBookが保持しているデータをリストする
    def listAllStudents
      # Student クラスのインスタンス作成
      setUpStudents
      # Student クラスのインスタンスの表示
      printStudents
    end
end

# StudentBook クラスのインスタンスを作成する
student_book = StudentBook.new

# Student クラスのインスタンスの表示
student_book.listAllStudents
