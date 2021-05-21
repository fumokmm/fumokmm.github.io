---
chapter_no: 12
chapter_title: 補足2 SUBSTRING関数でもよい
created: 2020-11-07
updated: 2020-11-07
---
先頭の`,`さえ除去できればいいので、以下のようにサブクエリにしてから、SUBSTRING関数を使っても可能ですね。

<div class="code-box">
<div class="title">SUBSTRING関数, FROM句でサブクエリにする</div>
<pre>
SELECT
    TEAM,
    SUBSTRING(MEMBER, 2, LEN(MEMBER) - 1) AS MEMBER
FROM
    (
        SELECT
            a.TEAM AS TEAM,
            (SELECT ',' + MEMBER FROM Table1 b WHERE b.TEAM = a.TEAM ORDER BY b.NO FOR XML PATH('')) AS MEMBER
        FROM
            Table1 a
    ) as x
</pre>
</div>

<div class="code-box">
<div class="title">SUBSTRING関数, WITHでサブクエリにする</div>
<pre>
WITH X AS (
    SELECT
        a.TEAM AS TEAM,
        (SELECT ',' + MEMBER FROM Table1 b WHERE b.TEAM = a.TEAM ORDER BY b.NO FOR XML PATH('')) AS MEMBER
    FROM
        Table1 a
)
SELECT
    TEAM,
    SUBSTRING(MEMBER, 2, LEN(MEMBER) - 1) AS MEMBER
FROM
    X
</pre>
</div>
