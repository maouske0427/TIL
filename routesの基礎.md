`"/" => "static_pages#index"`
というルーティングは古い書き方。
新しい書き方は`root "static_pages#index"`

`resource :static_pages`と書いてあるけど、これは一般的には`resources :static_pages`と書くことが多い。
resourceとresourcesの違いは、resourceは単数リソースを表していて、idがURLに含まれない。一方、resourcesは複数リソースを表す
、resourcesは複数リソースを表す
