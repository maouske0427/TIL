# 調べたことメモ
### HTTPメソッド、パス、ルーティングヘルパー、アクションの対応表
### 結果
コードの中でURLを直接書く代わりに、ルーティングヘルパーを使用してURLを参照することができる。
コードの可読性を向上させ、変更が必要な場合にも簡単に修正することができるようになる。

ルーティングの設定はconfig/routes.rbで行い、具体的な対応表一覧は以下。

ルーティングヘルパーが同じものは、送る元でどのHTTPメソッドを使用するかの指定が必要。

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

3. ネストされたリソースの場合、resources :magazines do; resources :ads; endと設定した場合:

|HTTPメソッド|パス|ルーティングヘルパー|対応するアクション|
|---|---|---|---|
|GET|/magazines/:magazine_id/ads|magazine_ads_path(:magazine_id)|index|
|GET|/magazines/:magazine_id/ads/new|new_magazine_ad_path(:magazine_id)|new|
|POST|/magazines/:magazine_id/ads|magazine_ads_path(:magazine_id)|create|
|GET|/magazines/:magazine_id/ads/:id|magazine_ad_path(:magazine_id, :id)|show|
|GET|/magazines/:magazine_id/ads/:id/edit|edit_magazine_ad_path(:magazine_id, :id)|edit|
|PATCH/PUT|/magazines/:magazine_id/ads/:id|magazine_ad_path(:magazine_id, :id)|update|
|DELETE|/magazines/:magazine_id/ads/:id|magazine_ad_path(:magazine_id, :id)|destroy|