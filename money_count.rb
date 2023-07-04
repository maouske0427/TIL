# 考え方の例
# 1. お金の単位を配列として用意する
    money = 26500
    money_types = [10000, 5000, 1000, 500, 100, 50, 10, 5, 1]
# 2. 結果を返すための配列を用意する
    result = []
# 3. あまりの金額を計算するための変数totalを用意する
    total = 0
# 4. お金の単位の数だけループする処理を記載する
    money_types.each do |type|
    # 5. ループ内で以下の計算・設定・変数resultに結果を追加する
      # ・お金の枚数の計算
      amount = (money - total) / type
      # ・あまりの金額を出すために惹かれる金額をtotalに設定する
      total += type * amount
      # ・結果を返すための配列に[お金の単位、枚数]の形で追加する
      result.push([type, amount])
    end
# 6. 金額を昇順にする且つ、hashで結果を返すので配列をhashに変換する
    # - [Array#reverse](https://docs.ruby-lang.org/ja/latest/method/Array/i/reverse.html)・[Array#to_h](https://docs.ruby-lang.org/ja/latest/method/Array/i/to_h.html)
result.reverse.to_h
