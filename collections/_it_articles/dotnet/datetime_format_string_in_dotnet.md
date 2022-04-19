---
title: .NETの日時形式文字列
article_group_id: tips-group
display_order: 10
created: 2022-04-13
updated: 2022-04-13
---
{% capture link_to_it_csharp %}{% link _it_articles/csharp/index.md %}{% endcapture %}{% assign link_to_it_csharp = link_to_it_csharp | remove: 'index' %}
{% capture link_to_it_powershell %}{% link _it_articles/powershell/index.md %}{% endcapture %}{% assign link_to_it_powershell = link_to_it_powershell | remove: 'index' %}
{% capture link_to_it_vba %}{% link _it_articles/vba/index.md %}{% endcapture %}{% assign link_to_it_vba = link_to_it_vba | remove: 'index' %}
{% capture link_to_it_sqlserver %}{% link _it_articles/sqlserver/index.md %}{% endcapture %}{% assign link_to_it_sqlserver = link_to_it_sqlserver | remove: 'index' %}


## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#日時形式文字列一覧">日時形式文字列一覧</a></li>
<li><a href="#例">例</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-13" updated="2022-04-13" %}</div>
- `.NET`系の言語([C#]({{link_to_it_csharp}})とか[PowerShell]({{link_to_it_powershell}})とか[VBA]({{link_to_it_vba}})とか[SQL Server]({{link_to_it_sqlserver}})とか)で使える日時形式文字列をメモしておきます。
- ただし、よく使いそうなものに厳選しています。
- より詳しく知りたい人は[こちら](https://docs.microsoft.com/ja-jp/dotnet/standard/base-types/custom-date-and-time-format-strings)を参照下さい。

{% include goto_pagetop.html %}

* * *
## <a name="日時形式文字列一覧">日時形式文字列一覧</a><a class="heading-anchor-permalink" href="#日時形式文字列一覧">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-13" updated="2022-04-13" %}</div>
### 日時形式文字列一覧(よく使いそうなもの)
<table class="normal">
	<tr>
		<th markdown="span">書式指定子</th>
		<th markdown="span">説明</th>
		<th markdown="span">使用例</th>
	</tr>
	<tr>
		<td markdown="span">yyyy</td>
		<td markdown="span">年 (4 桁の数値)。</td>
		<td markdown="span">0001-01-01T00:00:00 -> 0001  
		                    0900-01-01T00:00:00 -> 0900  
		                    1900-01-01T00:00:00 -> 1900  
		                    2009-06-15T13:45:30 -> 2009</td>
	</tr>
	<tr>
		<td markdown="span">yy</td>
		<td markdown="span">年 (00 ～ 99)。</td>
		<td markdown="span">0001-01-01T00:00:00 -> 01  
		                    0900-01-01T00:00:00 -> 00  
		                    1900-01-01T00:00:00 -> 00  
		                    2019-06-15T13:45:30 -> 19</td>
	</tr>
	<tr>
		<td markdown="span">M</td>
		<td markdown="span">月 (1 ～ 12)。</td>
		<td markdown="span">2009-06-15T13:45:30 -> 6</td>
	</tr>
	<tr>
		<td markdown="span">MM</td>
		<td markdown="span">月 (01 ～ 12)。</td>
		<td markdown="span">2009-06-15T13:45:30 -> 06</td>
	</tr>
	<tr>
		<td markdown="span">d</td>
		<td markdown="span">月の日にち (1 ～ 31)</td>
		<td markdown="span">2009-06-01T13:45:30 -> 1  
			                2009-06-15T13:45:30 -> 15</td>
	</tr>
	<tr>
		<td markdown="span">dd</td>
		<td markdown="span">月の日にち (01 ～ 31)</td>
		<td markdown="span">2009-06-01T13:45:30 -> 01   
		                    2009-06-15T13:45:30 -> 15</td>
	</tr>
	<tr>
		<td markdown="span">h</td>
		<td markdown="span">12 時間形式の時間 (1 ～ 12)。</td>
		<td markdown="span">2009-06-15T01:45:30 -> 1  
		                    2009-06-15T13:45:30 -> 1</td>
	</tr>
	<tr>
		<td markdown="span">hh</td>
		<td markdown="span">12 時間形式の時間 (01 ～ 12)。</td>
		<td markdown="span">2009-06-15T01:45:30 -> 01  
		                    2009-06-15T13:45:30 -> 01</td>
	</tr>
	<tr>
		<td markdown="span">H</td>
		<td markdown="span">24 時間形式の時間 (0 ～ 23)。</td>
		<td markdown="span">2009-06-15T01:45:30 -> 1  
		                    2009-06-15T13:45:30 -> 13</td>
	</tr>
	<tr>
		<td markdown="span">HH</td>
		<td markdown="span">24 時間形式の時間 (00 ～ 23)。</td>
		<td markdown="span">2009-06-15T01:45:30 -> 01  
		                    2009-06-15T13:45:30 -> 13</td>
	</tr>
	<tr>
		<td markdown="span">m</td>
		<td markdown="span">分 (0 ～ 59)。</td>
		<td markdown="span">2009-06-15T01:09:30 -> 9  
		                    2009-06-15T13:29:30 -> 29</td>
	</tr>
	<tr>
		<td markdown="span">mm</td>
		<td markdown="span">分 (00 ～ 59)。</td>
		<td markdown="span">2009-06-15T01:09:30 -> 09  
		                    2009-06-15T01:45:30 -> 45</td>
	</tr>
	<tr>
		<td markdown="span">s</td>
		<td markdown="span">秒 (0 ～ 59)。</td>
		<td markdown="span">2009-06-15T13:45:09 -> 9</td>
	</tr>
	<tr>
		<td markdown="span">ss</td>
		<td markdown="span">秒 (00 ～ 59)。</td>
		<td markdown="span">2009-06-15T13:45:09 -> 09</td>
	</tr>
	<tr>
		<td markdown="span">fff</td>
		<td markdown="span">日時値の秒部分の 1/1000</td>
		<td markdown="span">6/15/2009 13:45:30.617 -> 617  
		                    6/15/2009 13:45:30.0005 -> 000</td>
	</tr>
	<tr>
		<td markdown="span">ffffff</td>
		<td markdown="span">日時値の秒部分の 1/1000000</td>
		<td markdown="span">2009-06-15T13:45:30.6175420 -> 617542  
                            2009-06-15T13:45:30.0000005 -> 000000</td>
	</tr>
	<tr>
		<td markdown="span">tt</td>
		<td markdown="span">AM/PM 指定子。</td>
		<td markdown="span">2009-06-15T13:45:30 -> PM (en-US)  
		                    2009-06-15T13:45:30 -> 午後 (ja-JP)  
		                    2009-06-15T13:45:30 -> (fr-FR)</td>
	</tr>
	<tr>
		<td markdown="span">"文字列"  
		                    '文字列'</td>
		<td markdown="span">リテラル文字列の区切り記号。</td>
		<td markdown="span">2009-06-15T13:45:30 ("arr:" h:m t) -> arr: 1:45 P  
		                    2009-06-15T13:45:30 ('arr:' h:m t) -> arr: 1:45 P</td>
	</tr>
</table>

{% include goto_pagetop.html %}

* * *
## <a name="例">例</a><a class="heading-anchor-permalink" href="#例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-13" updated="2022-04-13" %}</div>
### PowerShell
<div class="code-box-output no-title">
<pre>
<em class="command">PS C:\&gt;</em> $datetime = Get-Date
<em class="command">PS C:\&gt;</em> $datetime.ToString(<em>"yyyy/MM/dd HH:mm:ss.fff"</em>)
<em class="blue">2022/04/13 22:28:32.346</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-04-13" updated="2022-04-19" %}</div>
### 参照
- [(Microsoft \|Docs) カスタム日時形式文字列](https://docs.microsoft.com/ja-jp/dotnet/standard/base-types/custom-date-and-time-format-strings)
- [(SQLServer逆引きノート) [SQLServer] 日付型をフォーマット指定して表示する（FORMAT）](https://sqlserver.programmer-reference.com/sqlserver-date-format/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
