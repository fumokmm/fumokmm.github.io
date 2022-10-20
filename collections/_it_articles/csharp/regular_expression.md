---
title: C#で正規表現を使う
article_group_id: basis-group
display_order: 20
created: 2022-01-17
updated: 2022-01-17
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#正規表現で検索">正規表現で検索</a></li>
</ul>

* * *
## <a name="正規表現で検索">正規表現で検索</a><a class="heading-anchor-permalink" href="#正規表現で検索">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-17" updated="2022-01-17" %}</div>
### using

<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
using System.Text.RegularExpressions;
</pre>
</div>

### 正規表現で検索するサンプル
<div class="code-box-syntax no-title">
<div class="copy-button">Copy</div>
<pre>
Regex reg = new Regex(@"&lt;正規表現文字列&gt;");
Match m = reg.Match("&lt;検索する文字列&gt;");
<em class="comment">// m.Success が true の場合、正規表現にヒット</em>
<em class="comment">// m.Success が false の場合、正規表現にヒット</em>
</pre>
</div>
- 正規表現(Regex)で検索した後は、マッチオブジェクト(Match)が返ってきます。
- マッチオブジェクトの`Success`プロパティを参照することで、正規表現にヒットしたかどうか確認できます。

<div class="code-box">
<div class="title">サンプル</div>
<div class="copy-button">Copy</div>
<pre>
using System;
using System.Text.RegularExpressions;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            <em>Regex reg = new Regex(@"[0-9]");</em>
            string str1 = "abc";
            <em>Match m1 = reg.Match(str1);</em>
            if (<em class="blue">m1.Success</em>)
            {
                Console.WriteLine(str1 + "には数値が入っています。");
            }
            else
            {
                Console.WriteLine(str1 + "には数値が入っていません。");
            }

            string str2 = "abc8";
            <em>Match m2 = reg.Match(str2);</em>
            if (<em class="blue">m2.Success</em>)
            {
                Console.WriteLine(str2 + "には数値が入っています。");
            }
            else
            {
                Console.WriteLine(str2 + "には数値が入っていません。");
            }
        }
    }
}
</pre>
</div>
<div class="code-box-output">
<div class="title">出力結果</div>
<div class="copy-button">Copy</div>
<pre>
abcには数値が入っていません。
abc8には数値が入っています。
</pre>
</div>

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
