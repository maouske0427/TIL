# バブルソート基礎
# 配列を定義
array_number = [4, 5, 2, 1, 3, 8, 9, 2, 1]
# 配列の長さを取得
size = array_number.size
# 配列の最大値
max = size - 1
# 以下2重ループ
# 0〜（max - 1）までをループ（0、1、2、3）。ループ変数をiとする
  (0..(max-1)).each do |i|
    # max 〜 i + 1をループ。変数をjとする
    # (max..(i+1)).each do |j|のままではイテレートできないので、降順で記載
    # iが0の場合、jは4〜1。iが1の場合、jは4〜2。iが2の場合、jは4〜3。iが3の場合、jは4のみとなる
    max.downto(i+1) do |j|
    # array_number[j]とarr[j-1]を比較しarr[j-1]が大きい場合、入れ替え
      if array_number[j] < array_number[j-1]
        tmp = array_number[j-1]
        array_number[j-1] = array_number[j]
        array_number[j] = tmp
      end
    end
  end
