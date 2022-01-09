---
chapter_no: 10
chapter_title: SELECT INSERT
created: 2020-07-15
updated: 2022-01-09
---
テーブルをサクっとコピーしてバックアップしたい場合に使えるSQLです。

```syntax:テーブルをコピーしてバックアップするSQL
SELECT * INTO {em{<新しいテーブル名>}em} FROM {em{<テーブル名>}em};
```

### 例
以下SQLを実行すると、`M_USER`と同じレイアウトの`M_USER_20201015`という名前のテーブルが作成されます。
```
SELECT * INTO {em{M_USER_20201015}em} FROM {em{M_USER}em};
```
