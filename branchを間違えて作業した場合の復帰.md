# やっちまった内容
- ブランチを切って作業するはずが、masterブランチで作業をしていた

#　解決の流れ
- 現在のブランチをstashして一時保存する
- 違うブランチを切って、一時保存した内容を適用する
- 一時保存した内容を削除する

# 　使ったコマンド
- git stash
  - (untrackedのファイルがある場合)git stash -u
- git stash list
  - stash内容の確認
- git stash branch {branch} {No.}
  - 新しいbranchを作成しつつ、No.のstash内容を適用して、うまく行ったらstash内容を削除する

# その他使えそうなコマンド
- git stash apply	最新のスタッシュを作業ディレクトリに適用する。スタッシュ自体は残る。
- git stash pop	最新のスタッシュを作業ディレクトリに適用し、そのスタッシュを削除する。
- git stash drop {stash}	指定したスタッシュを削除する。
- git stash clear	すべてのスタッシュを削除する。-

# 以下、解決時のコマンド全文
yamaoyusuke@yamaoyuusukenoMacBook-Air controllers % git stash -u
Saved working directory and index state WIP on master: 4feba43 rails基礎5
yamaoyusuke@yamaoyuusukenoMacBook-Air controllers % git stash list
stash@{0}: WIP on master: 4feba43 rails基礎5
yamaoyusuke@yamaoyuusukenoMacBook-Air controllers % git stash branch 06_decorator 0
Switched to a new branch '06_decorator'
On branch 06_decorator
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   ../../.DS_Store
        modified:   ../../Gemfile
        modified:   ../../Gemfile.lock
        modified:   application_controller.rb
        modified:   ../views/shared/_header.html.erb
        modified:   ../../spec/support/system_helper.rb
        modified:   ../../spec/system/common/common_spec.rb
        modified:   ../../spec/system/login/login_spec.rb

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        ../decorators/
        ../../spec/decorators/

no changes added to commit (use "git add" and/or "git commit -a")
Dropped refs/stash@{0} (98889ff50e9554f59bc2fb2d9be15045b50782fb)
