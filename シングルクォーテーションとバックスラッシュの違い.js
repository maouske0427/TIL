### 下記2つは意味が違う、というより下のコードは動かないので注意
    fetch(`https://api.github.com/users/${githubName}/repos`)
    fetch('https://api.github.com/users/${githubName}/repos')
