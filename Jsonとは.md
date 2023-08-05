# そもそもデータとは
  - 基本データ型
    - 変数
    - 小数
    - 文字
    - 真偽値
  - 複合データ型
    - 配列型
    - 文字列
    - クラス、構造体
    - 連想配列（辞書など）

# そもそもデータとは？（違う切り口）
  - 言語定義型
    - 言語がはじめから用意してくれている
  - ユーザー定義型
    - プログラムを書く人が用意

# JSONの用途
  - ユーザー定義型の複合データ型
  - なにかの複数データを人まとまりにして定義
## 書き方
  {
    "human":{
      "name":"yamao",
      "birthday":"1984/4/27",
      "age":39,
      "height":176.5,
      "weight":70,
      "address":"大阪府高槻市東五百住町１－１１－９"
      "married":true,
      "children":["haru", "nanaha"],
      "website":null
    }
  }
  key, valueの集まり
## yml
  human:
    name:yamao
    birthday:1984/4/27
    age:39
    height:176
    weight:70
    address:大阪府高槻市東五百住町１－１１－９
### ymlの特徴
  インデントで塊を表している
