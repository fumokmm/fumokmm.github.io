---
title: SQL Serverでセッションを強制終了(KILL)する
article_group_id: control-group
display_order: 80
created: 2021-12-06
updated: 2022-02-22
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#手順">手順</a></li>
<li><a href="#関連メモ">関連メモ</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-06" updated="2021-12-06" %}</div>
とてつもない結果を引き寄せてしまうSQLを実行してしまったりして、結果がなかなか返ってこないときに、  
セッションを強制終了するやり方をメモしておきます。

# 手順
1. 強制終了対象のセッションIDを調べます。
1. `KILL`を実行します。

{% include goto_pagetop.html %}

* * *
## <a name="手順">手順</a><a class="heading-anchor-permalink" href="#手順">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-06" updated="2022-02-22" %}</div>
### 強制終了対象のセッションIDを調べる
- `<セッションID>`は[SQL Serverでセッションの一覧を確認する]({% link _it_articles/sqlserver/checking_the_list_of_sessions.md %})にて調べてください。

### KILLを実行
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
<em>KILL</em> <em class="blue">'&lt;セッションID&gt;'</em>
</pre>
</div>

<div class="code-box">
<div class="title">例:セッションID 64 を強制終了する場合</div>
<div class="copy-button">Copy</div>
<pre>
<em>KILL</em> <em class="blue">64</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="関連メモ">関連メモ</a><a class="heading-anchor-permalink" href="#関連メモ">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-02-22" updated="2022-02-22" %}</div>
- [SQL Serverでセッションの一覧を確認する]({% link _it_articles/sqlserver/checking_the_list_of_sessions.md %})

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-12-06" updated="2021-12-06" %}</div>
- [(Microsoft \|Docs) KILL (Transact-SQL)](https://docs.microsoft.com/ja-jp/sql/t-sql/language-elements/kill-transact-sql)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
