1. resources :photosと設定した場合:

|HTTPメソッド|パス|ルーティングヘルパー|対応するアクション|
|---|---|---|---|
|GET|/photos|photos_path|index|
|GET|/photos/new|new_photo_path|new|
|POST|/photos|photos_path|create|
|GET|/photos/:id|photo_path(:id)|show|
|GET|/photos/:id/edit|edit_photo_path(:id)|edit|
|PATCH/PUT|/photos/:id|photo_path(:id)|update|
|DELETE|/photos/:id|photo_path(:id)|destroy|

2. 単数リソースの場合、resource :photoと設定した場合:

|HTTPメソッド|パス|ルーティングヘルパー|対応するアクション|
|---|---|---|---|
|GET|/photo|photo_path|show|
|GET|/photo/new|new_photo_path|new|
|POST|/photo|photo_path|create|
|GET|/photo/edit|edit_photo_path|edit|
|PATCH/PUT|/photo|photo_path|update|
|DELETE|/photo|photo_path|destroy|

`resources` と `resource` は、Ruby on Railsのルーティングを定義するためのメソッドである。両者の主な違いは、生成されるルートとその用途である。

1. `resources :users`

   `resources :users` をルーティングに定義すると、以下の7つのRESTfulなルート（HTTPメソッドとURLの組み合わせ）が自動的に生成される。

   - index (GET /users)
   - new (GET /users/new)
   - create (POST /users)
   - show (GET /users/:id)
   - edit (GET /users/:id/edit)
   - update (PATCH/PUT /users/:id)
   - destroy (DELETE /users/:id)

   これらのルートは、複数のユーザー（または他の任意のリソース）を作成、表示、更新、削除する場合に適している。
   例えば、ユーザー管理のダッシュボードを作成する場合、すべてのユーザーを一覧表示する（index）、新規ユーザーを作成する（new, create）、特定のユーザーの詳細を表示する（show）、ユーザー情報を編集する（edit, update）、ユーザーを削除する（destroy）といった操作を行うため、`resources :users` を使用すると適切なルートがすぐに生成できる。

2. `resource :user`

   `resource :user` をルーティングに定義すると、以下の6つのルートが生成される。

   - new (GET /user/new)
   - create (POST /user)
   - show (GET /user)
   - edit (GET /user/edit)
   - update (PATCH/PUT /user)
   - destroy (DELETE /user)

   ここで注意すべき点は、これらのルートのURLが全て単数形（/user）であること、そしてindexルートが存在しないことだ。
   これは、`resource :user` が主に単一のリソース（たとえば、ログイン中のユーザー）を扱うためのルートを生成することを意図しているからだ。
   例えば、ログインユーザーのプロフィールページを表示（show）、編集（edit, update）、削除（destroy）する場合、または新規ユーザー（ログインユーザー）を作成する（new, create）場合など、単一のリソースに対する操作が必要なときに `resource :user` を使用する。

結論として、`resources :users` は複数のリソース（ユーザーなど）に対する操作が必要な場合に、`resource :user` は単一のリソース（たとえばログインユーザー）に対する操作が必要な場合に使用する。

例えば、ソーシャルメディアアプリを考えてみよう。

- `resources :users` を使用する場合: 
すべてのユーザーのプロフィールを公開し、誰でも閲覧可能にする機能があると仮定する。
この場合、各ユーザーは他の全てのユーザーのプロフィールを見ることができ、それぞれのユーザーを特定するためにIDが必要になる。
そのため、ユーザー一覧（index）、個々のユーザーの詳細（show）、新規ユーザーの作成（new, create）、ユーザー情報の編集（edit, update）、ユーザーの削除（destroy）といった各種の操作を行うために `resources :users` を使うと便利である。

- `resource :user` を使用する場合: 
一方、各ユーザーが自分自身のプロフィール情報を管理する機能があるとする。
各ユーザーは自分自身のプロフィールを閲覧、編集、削除でき、新規ユーザー（自分自身）の作成も可能である。
しかし、このケースでは他のユーザーのIDを知る必要はなく、自分自身のリソースだけを操作するため、 `resource :user` を使うと便利である。
