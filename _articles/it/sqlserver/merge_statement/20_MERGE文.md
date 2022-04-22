---
chapter_no: 20
chapter_title: MERGE文
created: 2022-04-22
updated: 2022-04-22
---
```syntax
MERGE INTO
    <対象テーブル> tgt
USING
  (
    SELECT
      KEY,
      XXXX,
      YYYY,
        :
    FROM
      <データ取得元テーブルなど>
  ) src
ON
  src.KEY = tgt.KEY
WHEN MATCHED THEN
  UPDATE SET
    XXXX = src.XXXX,
    YYYY = src.YYYY,
      :
WHEN NOT MATCHED BY TARGET THEN
  INSERT (
    KEY,
    XXXX,
    YYYY,
    　:
  )
  VALUES (
    src.KEY,
    src.XXXX,
    src.YYYY,
      :
  )
WHEN NOT MATCHED BY SOURCE THEN
  DELETE 
;
```
### 解説
- `MERGE INTO`に<対象テーブル>（→tgt）を記載します。
  - 後で出てくるUPDATE, INSERT, DELETEされる対象はここで記載したテーブルとなります。
- `USING`に更新元データ（→src）を取得します。
  - ここでは設定したい値を取得してくるSELECT文を書きます。
  - 実態のあるテーブルから持ってきてもいいし、何ならSELECTは全部自分で値を決め打ちで書いてもいいです。
  - この時、更新対象行とマッチさせられるキーとなる項目も取得しておきましょう。
- `ON`で＜対象テーブル(tgt)＞と<データ取得元テーブルなど(src)>を紐付けます。
- 以降の`WHEN～`部分には、ONの条件に合致する対象テーブル(tgt)の行に対する処理を書きます。
- `WHEN MATCHED THEN`にはUPDATE文を指定します。
  - UPDATE SETの部分のみでOKです。
  - UPDATE対象はtgtなので、左辺は列名のみ記載します。
- `WHEN NOT MATCHED BY TARGET THEN`にはINSERT文を指定します。
    - INTOは不要です。
    - INSERT項目部分の対象はtgtなので、列名のみ記載します。
- `WHEN NOT MATCHED BY SOURCE THEN`
  - DELETE文を指定します。
    - DELETEのみでOKです。
    - DELETE対象はtgtです。
- `WHEN～`は3つすべて書かなくてもOKです。
  - 必要に応じて、`UPDATE`と`INSERT`や、`INSERT`と`DELETE`など組み合わせて設定することができます。
  