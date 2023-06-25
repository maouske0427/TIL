「show」「update」「destroy」アクションのように「id」パラメータだけで呼び出すアクションの場合は、モデルオブジェクトをつかって、下記のように簡略的に医術が可能
（ただし、「edit」アクションは除く）
```
<%= link_to 'Show Page', @blog %>
<%= link_to 'Update Page', @blog, :method => :put %>
<%= link_to 'Destroy Page', @blog, :method => :delete %>
```
しっかり記述しようと思ったら、`blog_path(@blog)`みたいな感じで書く。