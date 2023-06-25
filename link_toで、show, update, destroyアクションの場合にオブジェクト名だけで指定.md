「show」「update」「destroy」アクションのように「id」パラメータだけで呼び出すアクションの場合は、モデルオブジェクトをつかって、下記のように簡略的に記述が可能
（ただし、「edit」アクションは除く）
```
<%= link_to 'Show Page', @blog %>
<%= link_to 'Update Page', @blog, :method => :put %>
<%= link_to 'Destroy Page', @blog, :method => :delete %>
```
しっかり記述する場合は、`blog_path(@blog)`みたいな感じで書く。

### 出典？
link_toのリンク先の生成はurl_forに依存する
ActionView::Helpers::UrlHelper
https://api.rubyonrails.org

API仕様によると、link_toでオブジェクトを指定した場合
オブジェクトはurl_forで解釈される
そのため、<%= link_to user.name, user %>のuserはurl_for(user)となる。
それにより、users/1へと変換される.
