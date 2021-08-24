---
chapter_no: 4
chapter_title: PATHへの追加
created: 2021-08-24
updated: 2021-08-24
---
`GetEnvironmentVariable`で変数`PATH`を取得してきた後、変数に値を文字列として追加し、再度`SetEnvironmentVariable`にて設定します。

```
$path = [System.Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::User)
$path += ';' + 'C:\path\to\anywhere'
[System.Environment]::SetEnvironmentVariable('PATH', $path, [System.EnvironmentVariableTarget]::User)
```