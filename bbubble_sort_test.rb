
# バブルソート基礎
# 配列を定義
arr = [4, 5, 2, 1, 3]
# 配列の長さを取得
size = arr.size
p size
# 配列の最大値
# max = size - 1
# 以下2重ループ
# 0〜（max - 1）までをループ（0、1、2、3）。ループ変数をiとする
    # max 〜 i + 1をループ。変数をjとする
    # (max..(i+1)).each do |j|のままではイテレートできないので、降順で記載
    # iが0の場合、jは4〜1。iが1の場合、jは4〜2。iが2の場合、jは4〜3。iが3の場合、jは4のみとなる
    4.downto(1) do |j|
    # arr[j]とarr[j-1]を比較しarr[j-1]が大きい場合、入れ替え
      if arr[j] < arr[j-i]
        tmp = arr[j-1]
        p tmp
        arr[j-1] = arr[j]
        arr[j] = tmp
      end
    end

# 最後に表示します
p arr
