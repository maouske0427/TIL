# Rails基礎課題7について
- 掲示板用のテーブルとモデルを作成していること
  - bin/rails g model board title:string body:text user:references
    - references型
      user has_many boardsの関係を実現するにはboardsテーブルにuser_idが必要ですね。
      なので普通に考えるとマイグレーションファイルはこのように作成すると思います。

      `bundle exec rails g model board user_id:integer`
      確かにこれでuser_idというカラムが作られはします。
      ただ実はこれだと
      - インデックスが貼られない
      - 外部キー制約が貼られない
      などの問題があります。
      そこで登場するのがreferences型です。

      `bundle exec rails g model board user:references`
      このように書くと先ほど挙げた問題点を一挙に解決してくれます。
      **外部キーを作るときは基本的にはreferences型を使うということを覚えておきましょう。**
  - bin/rails g controller boards index show new create edit destroy
- 掲示板のモデル名がBoardとなっていること
  - 上記で対応
- 掲示板のカラム名とカラムの型が以下ようになっており、指定されているバリデーションが設定されていること
  - presence: true を付与したカラムは、 データベース側に null false の制約をつけていること
    - migrationファイルで記載してdb:migrate
  - ユーザーID: user_id(integer)
    - 上記rails gで対応
  - タイトル: title(string), 未入力を許可せず、最大文字数255文字のバリデーションを設定してください
    - validates :title, presence: true, length: { maximum: 255 }
  - 本文: body(text), 未入力を許可せず、最大文字数65535文字の数バリデーションを設定してください
    - validates :body, presence: true, length: { maximum: 65535 }
- DB上で掲示板とユーザーのデータが紐付いていること
  - User has_many Boards, dependent: :destroy
    - userが削除されたら、boardもまとめて削除されるようにdependent記載
  - Board belongs_to User
- 掲示板とユーザーのモデルにアソシエーションが設定してあること
  - (上記で対応)
- 掲示板のタイトル・本文・投稿者フルネーム・投稿日時を動的に表示するようになっていること(タイトルのリンクはのちの課題で作成するので仮(#)のままで大丈夫です)
  例えば、掲示板の一覧画面を表示するapp/views/boards/index.html.erbというファイルに次のような記載をすると、各掲示板のデータを動的に表示できるダ。
  ```ruby
  <% @boards.each do |board| %>
    <div>
      <h2><a href="#">タイトル: <%= board.title %></a></h2>
      <p>本文: <%= board.content %></p>
      <p>投稿者: <%= board.user.full_name %></p>
      <p>投稿日時: <%= board.created_at %></p>
    </div>
  <% end %>
  ```
  ここでは、@boardsというインスタンス変数に格納されている掲示板のデータを一つずつ取り出し(each do |board|)、その各データのタイトル(board.title)、本文(board.content)、投稿者のフルネーム(board.user.full_name)、投稿日時(board.created_at)を表示しているダ。
  ただし、このコードが動作するためには、掲示板のデータが@boardsに格納されていること、そして投稿者のモデルにfull_nameというメソッドまたは属性が存在していることが前提条件ダナ。それに注意してほしいダゾ！
- 掲示板の created_at の表示が、2023/05/10 11:00 のような形式で表示されるようになっていること(日付のフォーマットにはi18nのメソッドを使用してください)
  - ????
- 掲示板が１つも存在しない場合は、「掲示板がありません」と表示するようになっていること
  - `<% if @boards.present? %>`を使う
- ログイン後のヘッダーから掲示板一覧に遷移できるようにリンクが設定されていること
  - ヘッダーに`link_to '掲示板一覧', boards_path`
- 未ログイン状態で掲示板一覧にアクセスすると、ログイン画面に遷移し、「ログインしてください」というフラッシュメッセージが表示されるようになっていること
- トップページ、新規ユーザー登録画面、ログイン画面に関しては、未ログイン状態でもアクセスできるようになっていること
  - _before_login_headerで表示する
- ログインに成功した際は、掲示板一覧画面(/boards)に遷移するように修正されていること
  - loginアクションの次にj`redirect_to`で遷移
- アプリケーションのタイムゾーンを日本時間に設定してください
  - ???
- _header.html.erbから掲示板一覧ページに遷移できること
  - boards_pathにlink_toを使う
- 掲示板一覧画面の表示時にn+1問題が起こらないようになっていること
  ```ruby
  class BoardsController < ApplicationController
    def index
      @boards = Board.all.includes(:user).order(created_at: :desc)
    end
  end
  ```
- 掲示板の一覧を表示する箇所を部分テンプレート(パーシャル)に切り出されていること
  - パーシャルファイルを作成
    レンダリングも実装の仕方に気をつけないとパフォーマンスを悪化させやすいポイントの一つです。
    erb や haml で書かれたテンプレートファイルを HTML に変換する処理は負荷がかかるということを意識しましょう。
    そのため、無駄なレンダリングを減らすことが大切です。
    例えば、掲示板一覧で掲示板のパーシャルテンプレートを何度もレンダリングするようなケースでは注意が必要です。
    直感的に書くなら下記のような書き方になるのではないでしょうか。
    ```ruby
    <% if @boards.present? %>
      <% @boards.each do |board| %>
        <%= render partial: 'board', locals: { board: board } %>
      <% end %>
    <% else %>
      <p><%= t('.no_result') %></p>
    <% end %>
    ```
    ただし、この書き方では @boards の数だけ render メソッドが実行されて、レンダリングされてしまいます。
    このようなケースではコレクションオプションを渡して、一度でレンダリングするようにしましょう。

    ```ruby
    <% if @boards.present? %>
      <%= render partial: "board", collection: @boards %>
    <% else %>
      <p><%= t('.no_result') %></p>
    <% end %>
    ```
    また、コレクションオプションを利用したレンダリングには省略記法があります。
    下記の様に書いても同様の処理が行われます。
    ```ruby
    <% if @boards.present? %>
      <%= render @boards %>
    <% else %>
      <p><%= t('.no_result') %></p>
    <% end %>
    ```
- gem Fakerを利用してseeds.rbファイルを修正して、Userモデルの作成とUserモデルに紐づくBoardモデルのダミーデーターを作成出来るようにしてください
  まずは、db/seeds.rbというファイルをエディタで開くダ。ここにはデータベースに初期データを挿入するためのコードを書くダ。
  例えば、掲示板(Board)のデータを作るとすると、次のように書くダ。
  ```ruby
  20.times do |n|
    Board.create!(
      last_name: Faker::Name.unique.last_name,
      first_name: Faker::Name.unique.first_name,
      email: Faker::Internet.unique.email,
      password: "3150test",
      password_confirmation: "3150test"
    )
  end
  ```
  ここではtimesメソッドを使って20回ループを回し、その中でBoard.createメソッドを使って掲示板のデータを作成しているダ。
  このファイルを保存したら、ターミナルで`rails db:seed`というコマンドを打つダ。これでdb/seeds.rbの中のスクリプトが実行され、初期データがDBに投入されるダゾ！
