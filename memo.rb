require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています


if memo_type == 1
  puts "拡張子を除いたファイル名を入力してください"
  file_name = gets.chomp

  puts "メモしたい内容を記入して下さい"
  puts "完了したらCtrl + Dを押します"

  memo = readlines
  line = memo.length
  i = 0

  while i < line
  memo[i] = memo[i].chomp
  i += 1
  end
 
  CSV.open("#{file_name}.csv","w") do |csv|
  csv.puts ["#{memo}"]
  end

elsif memo_type == 2
  puts "拡張子を除いた編集するファイル名を入力してください"
  file_name = gets.chomp

  CSV.open("#{file_name}.csv","r") do |csv|
  puts "すでにメモしている内容です"
  puts csv.readlines
  end

  puts "追加したい内容を記入して下さい"
  puts "完了したらCtrl + Dを押します"

  memo = readlines
  line = memo.length
  i = 0

  while i < line
  memo[i] = memo[i].chomp
  i += 1
  end

  CSV.open("#{file_name}.csv","a+") do |csv|
  csv.puts ["#{memo}"]
  end
 
else
  puts "1か2を入力してください"
end

