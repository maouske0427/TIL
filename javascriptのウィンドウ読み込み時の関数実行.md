下記2つのコードの意味と違いを教えてください。
- window.addEventListener('load', () => {...})
- window.onload = function() {...}
`window.addEventListener('load', () => {...})` と `window.onload = function() {...}` の二つは、両方ともブラウザがページを全て読み込んだ時に特定の関数を実行するためのJavaScriptの構文ですが、振る舞いには若干の違いがあります。

**1. window.addEventListener('load', () => {...})**

これは、'load'というイベントが発生した（この場合はページ全体が読み込まれた）時に、指定した関数（アロー関数）を実行します。'load' イベントはページの全てのリソース（画像、スクリプトファイル、CSSファイル等）の読み込みが完了した後に発生します。

`addEventListener` メソッドの特徴として、一つのイベントに対して複数のリスナー（関数）を追加できる点が挙げられます。つまり、'load' イベントに対して複数の関数を登録し、それぞれ異なる処理を行うことができます。

**2. window.onload = function() {...}**

これも、ページ全体が読み込まれた後に特定の関数を実行します。こちらも 'load' イベントが発生するタイミングは `addEventListener` の場合と同じです。

しかし、`window.onload` には一つの関数しか登録できません。新たに関数を代入すると、以前に設定された関数は上書きされてしまいます。そのため、複数の処理を'load'イベント後に実行したい場合は、一つの関数内に全ての処理を記述する必要があります。

以上が、`window.addEventListener('load', () => {...})` と `window.onload = function() {...}` の意味と違いです。要するに、同じイベントで複数の関数を登録したい場合や、イベントリスナーの登録・解除を動的に行いたい場合は `addEventListener` を、単純に一つの関数を登録したい場合は `window.onload` を使うと良いでしょう。

### 具体的な事例
もちろんです、それぞれのコードについて具体的な使用例を説明します。

**1. window.addEventListener('load', () => {...}) の使用例**

以下の例では、ページの読み込みが完了したら2つの関数が実行されます。一つ目の関数はページのタイトルをコンソールに表示し、二つ目の関数はウィンドウの高さと幅をコンソールに表示します。

```javascript
window.addEventListener('load', () => {
  console.log(document.title); // ページタイトルをコンソールに表示
});

window.addEventListener('load', () => {
  console.log(window.innerHeight); // ウィンドウの高さをコンソールに表示
  console.log(window.innerWidth); // ウィンドウの幅をコンソールに表示
});
```

**2. window.onload = function() {...} の使用例**

以下の例では、ページの読み込みが完了したら1つの関数が実行されます。この関数ではページのタイトルとウィンドウの高さと幅をコンソールに表示します。
もし同じように `window.onload` を用いて別の関数を登録しようとすると、既存の関数は上書きされてしまいます。

```javascript
window.onload = function() {
  console.log(document.title); // ページタイトルをコンソールに表示
  console.log(window.innerHeight); // ウィンドウの高さをコンソールに表示
  console.log(window.innerWidth); // ウィンドウの幅をコンソールに表示
}
```

なお、上記の `window.onload` のコードに新たに以下の関数を追加した場合、

```javascript
window.onload = function() {
  console.log("Hello, World!"); // "Hello, World!" をコンソールに表示
}
```

最終的には "Hello, World!" のみがコンソールに表示されます。先に定義した関数は上書きされ、実行されないからです。

このように `addEventListener` と `window.onload` は使い方に違いがありますので、使用する際は状況に応じて適切なものを選びましょう。
