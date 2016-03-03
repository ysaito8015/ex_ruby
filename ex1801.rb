require 'date'

class BookInfo
  # BookInfo クラスのインスタンスを初期化する
  def initialize( title, author, page, publish_date )
    @title = title
    @author = author
    @page = page
    @publish_date = publish_date
  end

  # 最初に検討する属性に対するアクセサを提供する
  attr_accessor :title, :author, :page, :publish_date

  # BookInfoクラスのインスタンスをCSV形式へ変換する
  def to_csv(key)
    "#{key},#{@title}, #{@author}, #{@page}, #{@publish_date}\n"
  end

  # BookInfoクラスのインスタンスの文字列表現を返す
  def to_s
    "#{@title}, #{@author}, #{@page}, #{@publish_date}"
  end

  # 蔵書データを書式をつけて出力する
  # 項目の区切り文字を引数に指定することができる
  # 引数を省略した場合は改行を区切り文字にする
  def toFormattedString( sep = "\n" )
    "書籍名： #{@title}#{sep}著者名： #{@author}#{sep}ページ数： #{@page}ページ#{sep}発刊日：  #{@publish_date}#{sep}"
  end
end

# BookInfoManager クラスを定義する
class BookInfoManager
  def initialize( filename )
    # 初期化でcsvファイルを指定する
    @csv_fname = filename
    # 蔵書データのハッシュ
    @book_infos = {}
  end

  # 蔵書データをセットアップする
  def setUp
    # csvファイルを読み込みモードでオープンする
    open(@csv_fname, "r:UTF-8") do |file|
      # ファイルの行を1行ずつ取り出して、lineに読み込む
      file.each do |line|
        # lineからchompで改行を除き、splitでカンマ区切りに分割し
        # 左辺のそれぞれの項目へ多重代入する
        key, title, author, page, pdate = line.chomp.split(',')
        # 蔵書データ1件分のインスタンスを作成してハッシュに登録する
        # strptimeは、文字列からDateクラスのインスタンスを作成するメソッド
        @book_infos[key] = BookInfo.new(title,author,page.to_i,Date.strptime(pdate))
      end # 1行ずつの処理の終わり
    end # ファイルを閉じている
  end

  # 蔵書データを登録する
  def addBookInfo
    # 蔵書データ1件分のインスタンスを作る
    book_info = BookInfo.new( "", "", 0, Date.new )
    # 登録するデータを項目ごとに入力する
    print "\n"
    print "キー："
    key = gets.chomp
    print "書籍名："
    book_info.title = gets.chomp
    print "著者名："
    book_info.author = gets.chomp
    print "ページ数："
    book_info.page = gets.chomp.to_i
    print "発刊年："
    year = gets.chomp.to_i
    print "発刊月："
    month = gets.chomp.to_i
    print "発刊日："
    day = gets.chomp.to_i
    book_info.publish_date = Date.new( year, month, day )

    # 作成した蔵書データの1件分をハッシュに登録する
    @book_infos[key] = book_info
  end

  # 蔵書データの一覧を表示する
  def listAllBookInfos
    puts "\n-------------------------"
    @book_infos.each do |key,info|
      print info.toFormattedString
      puts "\n-------------------------"
    end
  end

  # 蔵書データを全件ファイルへ書き込んで保存する
  def saveAllBookInfos
    # csvファイルを書き込みモードでオープンする
    open(@csv_fname, "w:UTF-8") do |file|
      @book_infos.each do |key,info|
        file.print(info.to_csv(key))
      end # 1行ずつの処理の終わり
      puts "\nファイルへ保存しました"
    end # ファイルを閉じている
  end

  # 処理の選択と選択後の処理を繰り返す
  def run
    while true
      # 機能選択画面を表示する
      print "
        1. 蔵書データの登録
        2. 蔵書データの表示
        8. 蔵書データをファイルへ保存
        9. 終了
        番号を選んでください(1,2,9)："

      # 文字の入力を待つ
      num = gets.chomp
      case
      when '1' == num
        # 蔵書データの登録
        addBookInfo
      when '2' == num
        # 蔵書データの表示
        listAllBookInfos
      when '8' == num
        # 蔵書データをファイルへ保存
        saveAllBookInfos
      when '9' == num
        # アプリケーションの終了
        break;
      else
        # 処理選択待ち画面に戻る
      end
    end
  end
end

# アプリケーションのインスタンスを作る
# 蔵書データのcsvファイルを指定している
book_info_manager = BookInfoManager.new("book_info.csv")

# BookInfoManagerの蔵書データをセットアップする
book_info_manager.setUp

# BookInfoManagerの処理の選択と選択後の処理を繰り返す
book_info_manager.run
