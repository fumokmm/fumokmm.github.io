---
chapter_no: 3
chapter_id: configuration-file
chapter_title: Visual Studio Code用の設定ファイルを作成する
created: 2021-03-16
updated: 2021-03-16
---
<div class="code-box">
<div class="title">.vscode/launch.json</div>
<pre>
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug Local File",
            "type": "Ruby",
            "request": "launch",
            "program": "${workspaceRoot}/<em>main.rb</em>",
            <em>"useBundler": true</em>
        }
    ]
}
</pre>
</div>
- 作成する場所・ファイルは、VSCodeで開いているを`.`とした時の`.vscode/launch.json`です。
- 上記の設定だと、実行されるのは、ワークスペースルートの`main.rb`です。
- Bundler経由で実行するので、`"useBundler": true`の記述を追記します。