require 'date'
require 'pry'

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
  def initialize
    @book_infos = {}
    @search_info = {}
  end

  # 蔵書データをセットアップする
  def setUp
    # 副数冊の蔵書データを登録する
    @book_infos[:Yamada2005] = BookInfo.new(
      "実践アジャイル　ソフトウェア開発法とプロジェクト管理",
      "山田　正樹",
      248,
      Date.new(2005,1,25)
    )
    @book_infos[:Ooba2005] = BookInfo.new(
      "入門LEGO MINDSTORMS NXT レゴブロックで作る動くロボット",
      "大庭　真一郎",
      164,
      Date.new(2006,12,23)
    )
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

  # 蔵書データを登録する
  def searchAllBookInfo
    @search_info = {}
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
    ( year || month || day) == 0 ?  book_info.publish_date = nil : book_info.publish_date = Date.new( year, month, day )


    # 作成した蔵書データの1件分をハッシュに登録する
    @search_info[key] = book_info

    # 入力されたデータと蔵書データと比較する
    result = {}
    @book_infos.each do |key,info|
        @search_info.each do |k,s|
          unless k.empty?
            if key.to_s =~ /#{k}/ 
              result[key] = info
            end
          end

          unless s.title.empty?
            if info.title =~ /#{s.title}/
              result[key] = info
            end
          end

          unless s.author.empty?
            if info.author =~ /#{s.author}/
              result[key] = info
            end
          end

          unless s.page == 0
            if info.page.to_s =~ /#{s.page.to_i}/
              result[key] = info
            end
          end

          unless s.publish_date.nil?
            if info.publish_date == s.publish_date
              result[key] = info
            end
          end
        end
    end

    if result.empty?
      puts "見つかりませんでした"
    else
      puts "\n-------------------------"
      result.each do |key,info|
        print info.toFormattedString
        puts "\n-------------------------"
      end
    end

  end

  # 処理の選択と選択後の処理を繰り返す
  def run
    while true
      # 機能選択画面を表示する
      print "
        1. 蔵書データの登録
        2. 蔵書データの表示
        3. 蔵書データの検索
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
      when '3' == num
        # 蔵書データの検索
        searchAllBookInfo
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
book_info_manager = BookInfoManager.new

# BookInfoManagerの蔵書データをセットアップする
book_info_manager.setUp

# BookInfoManagerの処理の選択と選択後の処理を繰り返す
book_info_manager.run
