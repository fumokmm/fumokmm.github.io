---
chapter_no: 1
chapter_title: 複数行INSERT
created: 2021-09-02
updated: 2021-09-02
---
```
INSERT INTO TABLE1
  (COL1, COL2, COL3)
VALUES 
  {em{(1, 'VALUE1', 100),
  (2, 'VALUE2', 200),
  (3, 'VALUE3', 300),
  (4, 'VALUE4', 400),
  (5, 'VALUE5', 500),
  (6, 'VALUE6', 600),
  (7, 'VALUE7', 700),
  (8, 'VALUE8', 800),
  (9, 'VALUE9', 900),
  (10, 'VALUE10', 1000)}em};
```

### 解説
- INSERTする列定義までは1回だけ書きます。
- VALUES以降は、挿入するデータを()で囲んだものをカンマ区切りにして複数指定します。
- 複数行INSERTでエラーが発生した場合、1件も行挿入は行われません。
