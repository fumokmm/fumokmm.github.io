---
title: SQL Serverでテーブル定義情報を取得するSQL
display_order: 10
created: 2020-11-21
updated: 2020-11-21
---
よく使うのでメモ。  
特定のスキーマやテーブルで絞って取得したい場合は、末尾の`SELECT * FROM X`の後にWHERE句を自由に追加してご利用下さい。

## <a name="index">目次</a>

- [テーブル定義情報を取得するSQL](#sql)
- [関連メモ](#related)
- [参考](#reference)

## <a name="sql">テーブル定義情報を取得するSQL</a>

<div class="code-box">
<div class="title">SQL</div>
<pre>
USE [データベース名]
GO

WITH
EP AS (
    SELECT
        a.major_id,
        a.minor_id,
        b.value AS table_name,
        a.value AS column_name
    FROM
        sys.extended_properties a
        INNER JOIN
        sys.extended_properties b ON b.major_id = a.major_id
                                 AND b.minor_id = 0 -- テーブル名(固定)
),
X AS (
    SELECT
        S.name AS スキーマ名,
        T.name AS テーブル名,
        EP.table_name AS テーブル論理名,
        C.column_id AS 列番号,
        C.name AS 列名,
        EP.column_name AS 列論理名,
        Y.name AS 型,
        CASE
            WHEN Y.name IN ('nvarchar', 'nchar') THEN C.max_length / 2
            WHEN C.precision = 0                 THEN C.max_length
            ELSE C.precision
        END AS 桁,
        C.scale AS 小数桁,
        C.max_length AS [サイズ(バイト)],
        IIF(C.is_nullable = 0, 'Yes', 'No') As [NotNull],
        OBJECT_DEFINITION(C.default_object_id) AS デフォルト値,
        (SELECT IIF(COUNT(*) = 1, 'Yes', 'No') FROM sys.index_columns IC
         WHERE IC.column_id = C.column_id
           AND IC.object_id = C.object_id
           AND EXISTS(
                   SELECT 'x' FROM sys.key_constraints KC
                   WHERE KC.type = 'PK'
                     AND KC.parent_object_id = T.object_id
                     AND KC.unique_index_id = IC.index_id)) AS [PK]
    FROM
        sys.tables AS T
        INNER JOIN
        sys.schemas AS S ON S.schema_id = T.schema_id
        INNER JOIN
        sys.columns AS C ON C.object_id = T.object_id
        INNER JOIN
        sys.types AS Y ON Y.system_type_id = C.system_type_id
                      AND Y.user_type_id = C.user_type_id
        LEFT OUTER JOIN
        EP ON EP.major_id = C.object_id
          AND EP.minor_id = C.column_id
)

SELECT
    *
FROM
    X
ORDER BY
    X.スキーマ名,
    X.テーブル名,
    X.列番号

GO
</pre>
</div>

## <a name="related">関連メモ</a>

- [Oracleでテーブル定義情報を取得するSQL](/it/oracle/sql_to_get_table_definition_information.html)

## <a name="reference">参考</a>

- [(いろいろ備忘録日記) SqlServerにてテーブルとカラムの説明を取得するSQL (sys.tables,sys.columns,sys.extended_properties)](https://devlights.hatenablog.com/entry/20080206/p1)
- [(社内SEのITメモブログ) 【SQLServer】テーブル定義情報 / カラム一覧を確認する方法](https://notepad-blog.com/content/106/)
- [(Bright-l) SqlServerのテーブル定義取得](https://blog.bright-l.0am.jp/2016/01/12/sqlservernoteburuding-yi-qu-de/)
