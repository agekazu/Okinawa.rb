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
    while true do
      puts 'お金を入力(一回の入力で1000円以下、1円と5円は入らないよ!)'
      @money = gets.chomp
      @money = @money.to_i
      if @money % 10 == 0 && @money <= 1000 
        puts 'お金が'+@money.to_s+'円入りました'
      else 
        puts 'やり直し'
        @money=0
        payment
      end
      selecting
    end 
  end

  def selecting 
    d1='1:おいしいみず(200円)'
    d2='2:サイコソーダ(300円)'
    d3='3:ミックスオレ(350円)'
    

    while true do
      puts "\n"+'商品を選んで下さい (1~3までの数字を入力)'
      puts d1 
      puts d2
      puts d3

      drink=gets.chomp
      drink=drink.to_i

      case drink
        when 1
          @price = 200
          d=d1
          break
        when 2
          @price = 300 
          d=d2
          break
        when 3
          @price = 350
          d=d3
          break
        else
          puts 'それはボタンではありませんやり直し'
          @price=0
        end
      end
    
    puts 'あなたは'+ d +'を選択しました。'
    printf "\n"
    @oturi=@money-@price
   
    if @oturi < 0 
        #Numeric#absメソッド=>絶対値を求める
        puts 'あ、お金が'+@oturi.abs.to_s+'円、不足しています。再度入力してね'
        printf "\n"
    else
        puts 'ガタンッ あなたはおもむろに' + d +'をとりだした。'
        
        change
      end
    end
  
    def change
      if @oturi > 0
        puts 'お釣りです。チャリンチャリーン'
        puts 'あなたは' + @oturi.to_s + '円のお釣りを受け取った'
        printf "\n"
      else 
        puts 'お釣りは無いです。一昨日きやがってください'
        printf "\n"
    end
    end
end

vm = Vending_machine.new

