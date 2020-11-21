---
title: Oracleでテーブル定義情報を取得するSQL
display_order: 10
created: 2009-09-07
updated: 2020-11-21
---
当メモは2009-09-07に[投稿されたもの](https://npnl.hatenablog.jp/entry/20090907/1252296298)を加筆修正し、再掲したものです。

Oracleでテーブル定義情報を取得してくるSQLを書いたのでメモ。

## <a name="index">目次</a>

- [テーブル定義情報を取得するSQL](#sql)
- [関連メモ](#related)
- [参考](#reference)

## <a name="sql">テーブル定義情報を取得するSQL</a>

<div class="code-box">
<div class="title">SQL</div>
<pre>
SELECT
    T.TABLE_NAME    AS "テーブル物理名",
    TC.COMMENTS AS "テーブル論理名",
    C.COLUMN_ID AS "カラムID",
    CASE WHEN PK.COLUMN_POSITION IS NOT NULL THEN PK.COLUMN_POSITION ELSE NULL END AS "PK",
    C.COLUMN_NAME   AS "カラム物理名",
    CC.COMMENTS AS "カラム論理名",
    C.DATA_TYPE AS "データタイプ",
    CASE WHEN C.DATA_PRECISION IS NOT NULL THEN '(' || C.DATA_PRECISION || '.' || C.DATA_SCALE || ')'
        ELSE TO_CHAR(C.DATA_LENGTH) END AS "データ長",
    C.NULLABLE  AS "NULL可",
    C.DATA_DEFAULT AS "デフォルト値"
FROM
    USER_TABLES T
    INNER JOIN USER_TAB_COMMENTS TC ON (
        T.TABLE_NAME = TC.TABLE_NAME
    )
    INNER JOIN USER_TAB_COLUMNS C ON (
        T.TABLE_NAME = C.TABLE_NAME
    )
    INNER JOIN USER_COL_COMMENTS CC ON (
        T.TABLE_NAME = CC.TABLE_NAME AND
        C.COLUMN_NAME = CC.COLUMN_NAME
    )
    LEFT JOIN (
        SELECT
            IND.INDEX_NAME,
            CONST.TABLE_NAME,
            IND.COLUMN_NAME,
            IND.COLUMN_POSITION
        FROM
            USER_IND_COLUMNS IND
            INNER JOIN USER_CONSTRAINTS CONST ON (
                IND.INDEX_NAME = CONST.CONSTRAINT_NAME AND
                CONSTRAINT_TYPE = 'P'
            )
    ) PK ON (
        T.TABLE_NAME = PK.TABLE_NAME AND
        C.COLUMN_NAME = PK.COLUMN_NAME
    )
WHERE
    T.TABLE_NAME LIKE '%<em>＜ここにテーブル物理名を入れて検索＞</em>%'
ORDER BY
    T.TABLE_NAME,
    C.COLUMN_ID
</pre>
</div>

## <a name="related">関連メモ</a>

- [SQL Serverでテーブル定義情報を取得するSQL](/it/sqlserver/sql_to_get_table_definition_information.html)

## <a name="reference">参考</a>

- [元記事](https://npnl.hatenablog.jp/entry/20090907/1252296298)
