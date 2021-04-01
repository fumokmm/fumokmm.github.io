# 他テーブルの情報でデータを更新(Update)する

UPDATE
  <更新したいテーブル>
SET
  aaa = a.xxx
  bbb = a.yyy
  ccc = a.zzz
FROM
  <他テーブル> a
WHERE
    <更新したいテーブル>.id1 = a.id1
AND <更新したいテーブル>.id2 = a.id2
AND <更新したいテーブル>.id3 = a.id3

- <他テーブル>は別名指定(上記例では`a`)できるのですが、<更新したいテーブル> は別名指定できないようなので、フルでテーブル名を指定します