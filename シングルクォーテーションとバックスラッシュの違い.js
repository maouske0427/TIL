# バックスラッシュとシングルクォーテーションの違い
### 下記2つは意味が違う（というより下のコードは動かないので注意）
```javascript
- fetch(`https://api.github.com/users/${githubName}/repos`)
- fetch('https://api.github.com/users/${githubName}/repos')
```
