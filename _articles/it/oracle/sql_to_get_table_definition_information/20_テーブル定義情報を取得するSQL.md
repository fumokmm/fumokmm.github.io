---
chapter_no: 20
chapter_title: テーブル定義情報を取得するSQL
created: 2009-09-07
updated: 2020-11-21
---
```:SQL
SELECT
    T.TABLE_NAME AS {em:orange{"テーブル物理名"}em},
    TC.COMMENTS AS {em:orange{"テーブル論理名"}em},
    C.COLUMN_ID AS {em:orange{"カラムID"}em},
    CASE WHEN PK.COLUMN_POSITION IS NOT NULL THEN PK.COLUMN_POSITION ELSE NULL END AS {em:orange{"PK"}em},
    C.COLUMN_NAME AS {em:orange{"カラム物理名"}em},
    CC.COMMENTS AS {em:orange{"カラム論理名"}em},
    C.DATA_TYPE AS {em:orange{"データタイプ"}em},
    CASE WHEN C.DATA_PRECISION IS NOT NULL THEN '(' || C.DATA_PRECISION || '.' || C.DATA_SCALE || ')'
        ELSE TO_CHAR(C.DATA_LENGTH) END AS {em:orange{"データ長"}em},
    C.NULLABLE  AS {em:orange{"NULL可"}em},
    C.DATA_DEFAULT AS {em:orange{"デフォルト値"}em}
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
    T.TABLE_NAME LIKE '%{em{<ここにテーブル物理名を入れて検索>}em}%'
ORDER BY
    T.TABLE_NAME,
    C.COLUMN_ID
```