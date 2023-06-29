# 確認
慣れない内はかなり使う確認コマンド。
何度打っても何も変更されない安心コマンド。

### $ git branch
リモート追跡ブランチ以外の Local Branch 確認

### $ git branch -a
全ての Local Branch 確認

### $ git status
ファイル状態確認

### $ git add --dry-run .
addで実行される予定内容表示

### $ git ls-files
Local Repository Staging ファイルリスト表示

### $ git diff --name-only
WorkTree と Staging の差分ファイル表示
殆ど $ git st と同じ内容になる
--name-only はファイル単位でシンプルに見れるのでオススメ

### $ git diff --name-only branch1 branch2
branch1 と branch2 の差分ファイル表示
ブランチの差分がファイル単位でシンプルに見れます。

### $ git diff
WorkTree と Staging の差分コードソース表示
(コードソース差異なので変更が多いと膨大なログが表示されるため注意)

### $ git diff --staged
Staging と Committing の差異表示

### $ git log -2
Commit 履歴 最新２コミット表示

### $ git log -2 --stat
Commit 履歴２コミット表示 + 変更ファイル表示

### $ git log -2 --patch
### $ git log -2 --p
Commit ファイル差分 ２コミット表示
( そのままだとコード全表示で膨大な行数　になるため、
　$ git log -2 -p など表示を減らすためオプションを組み合わせるのがオススメ )

### $ git log -p ファイルパス/ファイル名
( 誰が編集したかなど ) 特定ファイルの変更履歴を表示

### $ git stash list
保存状態一覧表示

### $ git clean -nd
Untrackedファイルの確認

### $ git show
最新 Commit 内容表示

### $ git branch -r
Remote Branch 確認

### $ git remote
Remoteリポジトリ表示

### $ git remote -v
Remoteリポジトリ + URL 表示

### $ git remote rm origin
Remoteリポジトリ削除

### $ git help
ヘルプページ表示

### $ git help -a
Git全コマンドリスト

### $ git tag
Tag 一覧表示

### $ git reflog
過去の HEAD Commit 一覧表示

### $ git config -l
Repository 設定内容表示

### $ git config user.email
設定 e-mail 表示

### $ git config user.name
設定ユーザー名 表示

### $ find ~/ -name ".git"
gitフォルダの場所を忘れてしまった際に使用。.gitがあるフォルダがローカルリポジトリフォルダ

### $ git --version
gitインスールバージョン確認

# 変更
### $ git add .
WorkTree ファイルを全て add で Staging

### $ git commit -m "commit comment"
コメントを付けて commit 実行

### $ git commit -am "commit comment"
add & コメント付きで commit 実行

### $ git commit -F- <<EOM
複数行コメントでコミット 1

### $ git commit -F- <<EOM
> 要約
>
> 詳細
> 
> EOM

### $ git commit -m "コメント1行目" -m "コメント2行目" -m "コメント3行目"
複数行コメントでコミット 2

### $ git commit --amend
直前のコミットを編集

### $ git push origin master
Remote Repository に Local Repository を反映

### $ git push -f origin master
Remote Repository に Local Repository を強制反映
上記 -f なしで conflict などで rejected エラー発生したときも
エラー回避しPush可能。

### $ git fetch
Remote Bookmark をダウンロード。FETCH_HEADブランチ作成

### $ git pull
Local WorkTree に Remote Repository を ダイレクト反映
※ git pull しても、git fetch と同じ状態になり merge まで実行されないケースがある。
　その際は再度 git merge origin/ブランチ名 で解決する。

### $ git pull origin <Remote Branch Name>
既に存在する Local Branch へ 最新の Remote Branch を反映
※ ! [rejected] error: failed to push some refs ~
　といったコンフリクト(競合)エラー発生時にも有効

### $ git branch <branch name>
branch 作成

### $ git branch -m <old branch name> <new branch name>
branch 名 変更

### $ git checkout <branch name>
作業 branch (HEAD) 変更
WorkTree / Index も 作業branch に合わせたファイル内容に変更

### $ git checkout -b <branch name>
上記 branch作成 & 作業 branch (HEAD) 変更 (同時実行)

### $ git checkout -b feature/hogehoge origin/feature/hogehoge
( developなどをpullした上で )
ローカル上にない Remote Branch を、ローカル上に作成・移動

### $ git merge <branch name>
現在の HEAD branch の Working / Index / Local Repository 全てに、
別の branch を 統合

merge - 親 Commit が２つになる
Rebase - 親 Commit が１つになる

### $git stash
変更退避

# 取り消し
HEAD = 作業 branch Commit のイメージ

### $ git branch --delete ブランチ名
### $ git branch -D ブランチ名
ブランチ削除

### $ git reflog
削除したブランチの最後のコミットを見つけ
$ git branch ブランチ名 HEAD@{ログ番号}
ブランチ復活

### $ git reset
全ての add を取り消し
Index を WorkTree 状態に戻す

### $ git reset HEAD <file>
Staging を Commit の状態に戻す

### $ git reset --soft HEAD^
Local Repository のみ 以前の Commit 状態に戻す ( 最新の Commit 取り消し )

### $ git reset HEAD^
Local Repository / Staging ２つを、以前の Commit 状態に戻す

### $ git reset --hard HEAD
HEAD / Index / WorkTree 全てを、最新 Commit 状態に戻す
( WorkTree差分データが消えるので要注意 )

### $ git reset --hard HEAD^
HEAD / Index / WorkTree 全て を 一つ前の Commit 状態に戻す
( WorkTree差分データが消えるので要注意 )

### $ git checkout -- <file>
WorkTree を Staging の状態に戻す

### $ git revert
コミット打ち消して記録残る

### $ git clean -fd
Untracked ファイルの削除

### $ git merge --abort
直前 Merge 取り消し

### $ git reflog
復活する可能性のある呪文。。

### $ git push --delete origin リモートブランチ名
GitHubなどのリモート上ブランチを削除する

### $ git rm -r --cached .
ファイル全体キャッシュ削除
$ git rm -r --cached [ファイル名]
ファイル指定してキャッシュ削除
