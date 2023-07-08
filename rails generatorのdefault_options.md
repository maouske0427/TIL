# Rails generatorのデフォルトオプション
```ruby
DEFAULT_OPTIONS = {
  rails: {
    api: false,
    assets: true,
    force_plural: false,
    helper: true,
    integration_tool: nil,
    orm: false,
    resource_controller: :controller,
    resource_route: true,
    scaffold_controller: :scaffold_controller,
    system_tests: nil,
    test_framework: nil,
    template_engine: :erb
  }
```
### 設定例
例えば、Railsアプリの設定ファイル（config/application.rb）に以下のように書く
```ruby
config.generators do |g|
  g.helper false
  g.test_framework false
  g.skip_routes true
end
```
これで、rails generateコマンドを使った時にhelperファイル、testファイル、ルーティングの記述が生成されなくなる
[参考URL](https://github.com/rails/rails/blob/main/railties/lib/rails/generators.rb)
