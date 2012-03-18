# -*- coding: utf-8 -*-
=begin
自動販売機クラスを作ります。
- new でオブジェクト生成します。
- そのオブジェクトに お金を投入するメソッドを実装。
- 商品を選ぶメソッドを実装。
- おつりが出てくるメソッドを実装。
=end

class Vending_machine 

  def initialize
    payment
  end

  def payment
    while true 
      puts 'お金を入力(一回の入力で1000円以下、1円と5円は入らないよ!)'
      @money = gets.chomp
      @money = @money.to_i

      if  @money < 0
        puts '-----やめてください。お金をとらないでください。'
        puts ''
        next
      end

      #0入力
      if @money == 0
        puts '-----お願いします。お金をください。'
        puts ''
        next
      end


      if @money % 10 == 0 && 0 < @money && @money <= 1000 
        puts '-----お金が' + @money.to_s + '円入りました'
        selecting
      else
        puts '-----一回の入力で1000円以下、1円と5円は入らないらしいです。'
        puts ''
      end
    end #whileend 
  end 

  def selecting 
    d1='1:おいしいみず(200円)'
    d2='2:サイコソーダ(300円)'
    d3='3:ミックスオレ(350円)'

    puts ''
    puts'商品を選んで下さい (1~3までの数字を入力)'
    puts d1 
    puts d2
    puts d3

    drink = gets.chomp
    drink = drink.to_i

    case drink
    when 1
      @price = 200
      d=d1
    when 2
      @price = 300 
      d=d2
    when 3
      @price = 350
      d=d3
    else
      puts '-----それはボタンではありませんやり直し'
      selecting
    end

    puts '-----あなたは'+ d +'を選択しました。'
    puts ''
    oturi = @money-@price

    if oturi < 0 
      #Numeric#absメソッド=>絶対値を求める
      puts '-----あ、お金が'+oturi.abs.to_s+'円、不足しています。再度入力してね'
      puts ''
      payment
    else
      puts 'ガタンッ'
      puts '-----あなたはおもむろに' + d +'をとりだした。'
      puts ''
      change oturi
    end
  end

  def change oturi
    if oturi == 0
      puts '-----お釣りはないのですよ。'
    else 
      puts 'お釣りです。チャリンチャリーン'
      puts '-----あなたは' + oturi.to_s + '円のお釣りを受け取った'
      puts ''
    end
    exit
  end

end #classend

Vending_machine.new

