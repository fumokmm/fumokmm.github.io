---
title: SQL Serverの変換系関数(CAST, CONVERT, FORMAT, PARSE)
article_group_id: sql-group
display_order: 40
created: 2020-12-20
updated: 2021-01-07
---
SQL ServerのSQL内でよく使う変関係関数をメモしておきます。  
ここでは、`CAST`, `CONVERT`, `FORMAT`, `PARSE`について書いています。

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#differences">4つの変換系関数の違い</a></li>
<li><a href="#cast">CAST</a></li>
<li><a href="#convert">CONVERT</a></li>
<li><a href="#format">FORMAT</a></li>
<li><a href="#parse">PARSE</a></li>
<li><a href="#explicit-convertion-table">参考：変換表</a></li>
</ul>

* * *
## <a name="differences">4つの変換系関数の違い</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-21" updated="2020-12-21" %}</div>
4つは変換系関数ということで似ているんですが、違いを簡単にまとめると以下のようになります。

- `CAST`と`CONVERT`は型変換
  - `CAST`はスタイルを指定できない
  - `CONVERT`はスタイルを指定できる
  - この2つは語順が反対(どうしてこうなった…)
- `FORMAT`と`PARSE`は型⇔文字列の指定した形式での変換
  - `FORMAT`は型→文字列
  - `PARSE`は文字列→型

なお、`CAST`と`CONVERT`と`PARSE`には、変換に失敗したらエラーとするのではなく、`NULL`を返却するTRYバージョンが(それぞれ`TRY_CAST`、`TRY_CONVERT`、`TRY_CAST`)というものが存在します。

{% include goto_pagetop.html %}

* * *
## <a name="cast">CAST</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-22" updated="2020-01-04" %}</div>
CASTが一番シンプルな形になります。  

<div class="code-box">
<div class="title">CASTの構文</div>
<pre>
CAST(expression AS data_type [(length)])  
</pre>
</div>

- `expression`の部分に値が入り、その値を `data_type`の型に変換してくれます
- `length` は型の桁数を指定しますが、省略可能です
- `値 AS 型` という形になるため、英語圏の人にとって読み下しやすい形式なのかもしれません
- 変換元の値は任意なので、どんな型でも構いませんが、マッチングタイプがあって、それに外れると変換エラーとなってしまいますので注意しましょう。([参考：変換表](#explicit-convertion-table)を参照)  
  - 例えば、numericからdateへの変換は「×」になっていますので、エラーなります。

<div class="code-box">
<div class="title">例1 文字列'12.34'をdecimalに変換する</div>
<pre>
CAST('12.34' AS decimal(4, 2)) <em class="comment">-- 12.34</em>
</pre>
</div>

<div class="code-box">
<div class="title">例2 文字列'12.34'をdecimalに変換する</div>
<pre>
CAST('12.34' AS decimal) <em class="comment">-- 12</em>
</pre>
</div>

<div class="code-box">
<div class="title">例3 文字列を日付型に変換する</div>
<pre>
CAST('2020/12/22' AS date) <em class="comment">-- 2020-12-22 (date型)</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="convert">CONVERT</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-20" updated="2021-01-07" %}</div>
CONVERT関数は、任意の値を指定した型に変換する関数です。  
[CAST](#cast)関数との違いとしては、`style`を指定して、型と同時に値の表現も変換できることろです。

<div class="code-box">
<div class="title">CONVERTの構文</div>
<pre>
CONVERT(data_type [(length)], expression　[, style])
</pre>
</div>

- `expression`の部分に値が入り、その値を `data_type`の型に変換してくれます
- `length` は型の桁数を指定しますが、省略可能です
- `style` の部分に値の表現の仕方を指定します。`data_type`のグループごとに指定できる値が違い、種類も多いので、下に表でまとめておきます。
- 変換元の値は任意なので、どんな型でも構いませんが、マッチングタイプがあって、それに外れると変換エラーとなってしまいますので注意しましょう。([参考：変換表](#explicit-convertion-table)を参照)  
  - 例えば、numericからdateへの変換は「×」になっていますので、エラーなります。

### 日付と時刻のスタイル ([Date and Time styles](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15#date-and-time-styles))

文字列型から日付型や時刻型に変換したり、その逆に日付型や時刻型から文字列型に変換したりします。  
{% comment %}
文字列型に変換する場合は、下記の表の「入力/出力」に示した形式で出力されます。
{% endcomment %}
文字列型に変換する場合は、上記のリンク先の表の Input/Output に示した形式で出力されます。

表はまた後で書きます。

{% comment %}
<table class="normal">
  <tr>
  	<th>世紀なし(yy) (*1)</th>
    <th>世紀あり(yyyy)</th>
    <th>主に利用されている場所</th>
    <th>入力/出力 (*3)</th>
  </tr>
  <tr>
  	<td markdown="span">-</td>
    <td markdown="span">0 or 100 (1,2)</td>
    <td markdown="span">Default for datetime and smalldatetime</td>
    <td markdown="span">mon dd yyyy hh:miAM (or PM)</td>
  </tr>
  <tr>
  	<td markdown="span">1</td>
  	<td markdown="span">101</td>
  	<td markdown="span">U.S.</td>
    <td markdown="span">
      1 = mm/dd/yy  
      101 = mm/dd/yyyy
    </td>
	</tr>
  <tr>
  	<td markdown="span">2</td>	<td markdown="span">102</td>	<td markdown="span">ANSI</td>	<td markdown="span">2 = yy.mm.dd  102 = yyyy.mm.dd</td>	</tr>
<tr>	<td markdown="span">3</td>	<td markdown="span">103</td>	<td markdown="span">British/French</td>	<td markdown="span">3 = dd/mm/yy  103 = dd/mm/yyyy</td>	</tr>
<tr>	<td markdown="span">4</td>	<td markdown="span">104</td>	<td markdown="span">German</td>	<td markdown="span">4 = dd.mm.yy  104 = dd.mm.yyyy</td>	</tr>
<tr>	<td markdown="span">5</td>	<td markdown="span">105</td>	<td markdown="span">Italian</td>	<td markdown="span">5 = dd-mm-yy  105 = dd-mm-yyyy</td>	</tr>
<tr>	<td markdown="span">6</td>	<td markdown="span">106 (1)</td>	<td markdown="span">-</td>	<td markdown="span">6 = dd mon yy  106 = dd mon yyyy</td>	</tr>
<tr>	<td markdown="span">7</td>	<td markdown="span">107 (1)</td>	<td markdown="span">-</td>	<td markdown="span">7 = Mon dd, yy  107 = Mon dd, yyyy</td>	</tr>
<tr>	<td markdown="span">8 or 24</td>	<td markdown="span">108</td>	<td markdown="span">-</td>	<td markdown="span">hh:mi:ss</td>	</tr>
<tr>	<td markdown="span">-</td>	<td markdown="span">9 or 109 (1,2)</td>	<td markdown="span">Default + milliseconds</td>	<td markdown="span">mon dd yyyy hh:mi:ss:mmmAM (or PM)</td>	</tr>
<tr>	<td markdown="span">10</td>	<td markdown="span">110</td>	<td markdown="span">USA</td>	<td markdown="span">10 = mm-dd-yy  110 = mm-dd-yyyy</td>	</tr>
<tr>	<td markdown="span">11</td>	<td markdown="span">111</td>	<td markdown="span">JAPAN</td>	<td markdown="span">11 = yy/mm/dd  111 = yyyy/mm/dd</td>	</tr>
<tr>	<td markdown="span">12</td>	<td markdown="span">112</td>	<td markdown="span">ISO</td>	<td markdown="span">12 = yymmdd  112 = yyyymmdd</td>	</tr>
<tr>	<td markdown="span">-</td>	<td markdown="span">13 or 113 (1,2)</td>	<td markdown="span">Europe default + milliseconds</td>	<td markdown="span">dd mon yyyy hh:mi:ss:mmm (24h)</td>	</tr>
<tr>	<td markdown="span">14</td>	<td markdown="span">114</td>	<td markdown="span">-</td>	<td markdown="span">hh:mi:ss:mmm (24h)</td>	</tr>
<tr>	<td markdown="span">-</td>	<td markdown="span">20 or 120 (2)</td>	<td markdown="span">ODBC canonical</td>	<td markdown="span">yyyy-mm-dd hh:mi:ss (24h)</td>	</tr>
<tr>	<td markdown="span">-</td>	<td markdown="span">21 or 25 or 121 (2)</td>	<td markdown="span">ODBC canonical (with milliseconds) default for time, date, datetime2, and datetimeoffset</td>	<td markdown="span">yyyy-mm-dd hh:mi:ss.mmm (24h)</td>	</tr>
<tr>	<td markdown="span">22</td>	<td markdown="span">-</td>	<td markdown="span">U.S.</td>	<td markdown="span">mm/dd/yy hh:mi:ss AM (or PM)</td>	</tr>
<tr>	<td markdown="span">-</td>	<td markdown="span">23</td>	<td markdown="span">ISO8601</td>	<td markdown="span">yyyy-mm-dd</td>	</tr>
<tr>	<td markdown="span">-</td>	<td markdown="span">126 (4)</td>	<td markdown="span">ISO8601</td>	<td markdown="span">yyyy-mm-ddThh:mi:ss.mmm (no spaces)  Note: For a milliseconds (mmm) value of 0, the millisecond decimal fraction value will not display. For example, the value '2012-11-07T18:26:20.000 displays as '2012-11-07T18:26:20'.</td>	</tr>
<tr>	<td markdown="span">-</td>	<td markdown="span">127(6, 7)</td>	<td markdown="span">ISO8601 with time zone Z.</td>	<td markdown="span">yyyy-MM-ddThh:mm:ss.fffZ (no spaces)  Note: For a milliseconds (mmm) value of 0, the millisecond decimal value will not display. For example, the value '2012-11-07T18:26:20.000 will display as '2012-11-07T18:26:20'.</td>	</tr>
<tr>	<td markdown="span">-</td>	<td markdown="span">130 (1,2)</td>	<td markdown="span">Hijri (5)</td>	<td markdown="span">dd mon yyyy hh:mi:ss:mmmAM  In this style, mon represents a multi-token Hijri unicode representation of the full month name. This value does not render correctly on a default US installation of SSMS.</td>	</tr>
<tr>	<td markdown="span">-</td>	<td markdown="span">131 (2)</td>	<td markdown="span">Hijri (5)</td>	<td markdown="span">dd/mm/yyyy hh:mi:ss:mmmAM</td>	</tr>
</table>

1. These style values return nondeterministic results. Includes all (yy) (without century) styles and a subset of (yyyy) (with century) styles.
2. The default values (0 or 100, 9 or 109, 13 or 113, 20 or 120, 23, and 21 or 25 or 121) always return the century (yyyy).
*3 Input when you convert to datetime; output when you convert to character data.
4. Designed for XML use. For conversion from datetime or smalldatetime to character data, see the previous table for the output format.
5. Hijri is a calendar system with several variations. SQL Server uses the Kuwaiti algorithm.


 Important

By default, SQL Server interprets two-digit years based on a cutoff year of 2049. That means that SQL Server interprets the two-digit year 49 as 2049 and the two-digit year 50 as 1950. Many client applications, including those based on Automation objects, use a cutoff year of 2030. SQL Server provides the two digit year cutoff configuration option to change the cutoff year used by SQL Server. This allows for the consistent treatment of dates. We recommend specifying four-digit years.

6. Only supported when casting from character data to datetime or smalldatetime. When casting character data representing only date or only time components to the datetime or smalldatetime data types, the unspecified time component is set to 00:00:00.000, and the unspecified date component is set to 1900-01-01.

7. Use the optional time zone indicator Z to make it easier to map XML datetime values that have time zone information to SQL Server datetime values that have no time zone. Z indicates time zone UTC-0. The HH:MM offset, in the + or - direction, indicates other time zones. For example: 2006-12-12T23:45:12-08:00.

When converting smalldatetime to character data, the styles that include seconds or milliseconds show zeros in these positions. When converting from datetime or smalldatetime values, use an appropriate char or varchar data type length to truncate unwanted date parts.

When converting character data to datetimeoffset, using a style that includes a time, a time zone offset is appended to the result.
{% endcomment %}

### floatとrealのスタイル([float and real styles](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15#float-and-real-styles))

また後で書きます。

{% comment %}
<table class="normal">			
<tr>	<th>Value</th>	<th>Output</th>	</tr>
<tr>	<td markdown="span">0 (default)</td>	<td markdown="span">A maximum of 6 digits. Use in scientific notation, when appropriate.</td>	</tr>
<tr>	<td markdown="span">1</td>	<td markdown="span">Always 8 digits. Always use in scientific notation.</td>	</tr>
<tr>	<td markdown="span">2</td>	<td markdown="span">Always 16 digits. Always use in scientific notation.</td>	</tr>
<tr>	<td markdown="span">3</td>	<td markdown="span">Always 17 digits. Use for lossless conversion. With this style, every distinct float or real value is guaranteed to convert to a distinct character string.  
Applies to: SQL Server (Starting in SQL Server 2016 (13.x)) and Azure SQL Database.</td>	</tr>
<tr>	<td markdown="span">126, 128, 129</td>	<td markdown="span">Included for legacy reasons; a future release could deprecate these values.</td>	</tr>
</table>			
{% endcomment %}

### moneyとsmallmoneyのスタイル([money and smallmoney styles](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15#money-and-smallmoney-styles))

また後で書きます。

{% comment %}
<table class="normal">			
<tr>	<th>Value</th>	<th>Output</th>	</tr>
<tr>	<td markdown="span">0 (default)</td>	<td markdown="span">No commas every three digits to the left of the decimal point, and two digits to the right of the decimal point  Example: 4235.98.</td>	</tr>
<tr>	<td markdown="span">1</td>	<td markdown="span">Commas every three digits to the left of the decimal point, and two digits to the right of the decimal point  Example: 3,510.92.</td>	</tr>
<tr>	<td markdown="span">2</td>	<td markdown="span">No commas every three digits to the left of the decimal point, and four digits to the right of the decimal point  Example: 4235.9819.</td>	</tr>
<tr>	<td markdown="span">126</td>	<td markdown="span">Equivalent to style 2, when converting to char(n) or varchar(n)</td>	</tr>
</table>			
{% endcomment %}

### XMLスタイル([xml styles](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15#xml-styles))

また後で書きます。

{% comment %}
<table class="normal">			
<tr>	<th>Value</th>	<th>Output</th>	</tr>
<tr>	<td markdown="span">0 (default)</td>	<td markdown="span">Use default parsing behavior that discards insignificant white space, and does not allow for an internal DTD subset.  Note: When converting to the xml data type, SQL Server insignificant white space is handled differently than in XML 1.0. For more information, see Create Instances of XML Data.</td>	</tr>
<tr>	<td markdown="span">1</td>	<td markdown="span">Preserve insignificant white space. This style setting sets the default xml:space handling to match the behavior of xml:space="preserve".</td>	</tr>
<tr>	<td markdown="span">2</td>	<td markdown="span">Enable limited internal DTD subset processing. If enabled, the server can use the following information that is provided in an internal DTD subset, to perform nonvalidating parse operations. - Defaults for attributes are applied - Internal entity references are resolved and expanded - The DTD content model is checked for syntactical correctness  The parser ignores external DTD subsets. Also, it does not evaluate the XML declaration to see whether the standalone attribute has a yes or no value. Instead, it parses the XML instance as a stand-alone document.</td>	</tr>
<tr>	<td markdown="span">3</td>	<td markdown="span">Preserve insignificant white space, and enable limited internal DTD subset processing.</td>	</tr>
</table>			
{% endcomment %}

### バイナリスタイル([Binary styles](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15#binary-styles))

また後で書きます。

{% comment %}
<table class="normal">			
  <tr>
    <th>Value</th>
    <th>Output</th>
  </tr>
  <tr>
  	<td markdown="span">0 (default)</td>
    <td markdown="span">Translates ASCII characters to binary bytes, or binary bytes to ASCII characters. Each character or byte is converted 1:1.  For a binary data_type, the characters 0x are added to the left of the result.</td>
  </tr>
  <tr>
  	<td markdown="span">1, 2</td>
    <td markdown="span">For a binary data_type, the expression must be a character expression. The expression must have an even number of hexadecimal digits (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, A, B, C, D, E, F, a, b, c, d, e, f). If the style is set to 1, the expression must have 0x as the first two characters. If the expression contains an odd number of characters, or if any of the characters is invalid, an error is raised.  If the length of the converted expression exceeds the length of the data_type, the result is right truncated.  Fixed length data_types larger than the converted result has zeros added to the right of the result.  A data_type of type character requires a binary expression. Each binary character is converted into two hexadecimal characters. Suppose the length of the converted expression exceeds the length of the data_type. In that case, it's truncated.  For a fixed size character type data_type, if the length of the converted result is less than its length of the data_type, spaces are added to the right of the converted expression to maintain an even number of hexadecimal digits.  The characters 0x are not added to the left of the converted result for style 2.</td>
  </tr>
</table>			
{% endcomment %}

### 参考
- [(Microsoft Docs) CAST and CONVERT (Transact-SQL)](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15)
- [(w3schools.com) SQL Server CONVERT() Function](https://www.w3schools.com/sql/func_sqlserver_convert.asp)

{% include goto_pagetop.html %}

* * *
## <a name="format">FORMAT</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-20" updated="2020-12-20" %}</div>
FORMATは…また後で書きます。

{% include goto_pagetop.html %}

* * *
## <a name="parse">PARSE</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-20" updated="2020-12-20" %}</div>
他の3つに比べるとちょっと知名度が落ちるんじゃないかと思いますが、知っていると便利です。

また後で書きます。

{% include goto_pagetop.html %}

* * *
## <a name="explicit-convertion-table">参考：変換表</a>
<div class="chapter-updated">{% include update_info_inline.html created="2020-12-20" updated="2020-12-20" %}</div>
## <a name="explicit-convertion-table"></a>

![](https://cdn-ak.f.st-hatena.com/images/fotolife/f/fumokmm/20201220/20201220151008.png)

- [CAST and CONVERT (Transact-SQL)](https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15)より参照

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
