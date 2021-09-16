---
chapter_no: 20
chapter_title: VSCodeに拡張機能を導入
created: 2021-09-16
updated: 2021-09-16
---
### C/C++機能拡張
- 拡張機能(Ctrl + Shift + X)で、`C`と入力して検索し、Microsoft制の`C/C++`をインストールする

### Code Runner
- 拡張機能(Ctrl + Shift + X)で、`Code Runner`と入力して検索し、`Jun Han`さんの制の`Code Runner`をインストールする。
{% comment %}
この設定、なくても動く

- `Code Runner`の設定を開き、`Code-runner: Executor Map`を`settings.jsonで編集`をクリックする。
- `"code-runner.executorMap"`の`"c"`に`-fexec-charset=CP932`を追加する
```:編集前
"c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
```
```:編集後
"c": "cd $dir && gcc {em{-fexec-charset=CP932}em} $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
```
{% endcomment %}
- `Code-runner: Run in Terminal`の`Whether to run code in integrated Terminal.`にチェックを付ける。
