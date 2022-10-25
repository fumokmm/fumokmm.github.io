---
title: Oracleでテーブル定義情報を取得するSQL
article_group_id: sql-group
display_order: 10
created: 2009-09-07
updated: 2020-11-21
---
当メモは2009-09-07に[投稿されたもの](https://npnl.hatenablog.jp/entry/20090907/1252296298)を加筆修正し、再掲したものです。
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#テーブル定義情報を取得するSQL">テーブル定義情報を取得するSQL</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-09-07" updated="2020-11-21" %}</div>
Oracleでテーブル定義情報を取得してくるSQLを書いたのでメモ。

{% include goto_pagetop.html %}

* * *
## <a name="テーブル定義情報を取得するSQL">テーブル定義情報を取得するSQL</a><a class="heading-anchor-permalink" href="#テーブル定義情報を取得するSQL">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-09-07" updated="2020-11-21" %}</div>
<div class="code-box">
<div class="title">SQL</div>
<div class="copy-button">Copy</div>
<pre>
SELECT
    T.TABLE_NAME AS <em class="orange">"テーブル物理名"</em>,
    TC.COMMENTS AS <em class="orange">"テーブル論理名"</em>,
    C.COLUMN_ID AS <em class="orange">"カラムID"</em>,
    CASE WHEN PK.COLUMN_POSITION IS NOT NULL THEN PK.COLUMN_POSITION ELSE NULL END AS <em class="orange">"PK"</em>,
    C.COLUMN_NAME AS <em class="orange">"カラム物理名"</em>,
    CC.COMMENTS AS <em class="orange">"カラム論理名"</em>,
    C.DATA_TYPE AS <em class="orange">"データタイプ"</em>,
    CASE WHEN C.DATA_PRECISION IS NOT NULL THEN '(' || C.DATA_PRECISION || '.' || C.DATA_SCALE || ')'
        ELSE TO_CHAR(C.DATA_LENGTH) END AS <em class="orange">"データ長"</em>,
    C.NULLABLE  AS <em class="orange">"NULL可"</em>,
    C.DATA_DEFAULT AS <em class="orange">"デフォルト値"</em>
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
    T.TABLE_NAME LIKE '%<em>&lt;ここにテーブル物理名を入れて検索&gt;</em>%'
ORDER BY
    T.TABLE_NAME,
    C.COLUMN_ID
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2009-09-07" updated="2020-11-21" %}</div>
### 関連メモ
- [SQL Serverでテーブル定義情報を取得するSQL](/it/sqlserver/sql_to_get_table_definition_information.html)
- [元記事](https://npnl.hatenablog.jp/entry/20090907/1252296298)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
