---
title: VBAのクラスでインターフェイスを定義しプロパティやメソッドを実装する
article_group_id: basis-group
display_order: 60
created: 2021-07-02
updated: 2022-01-05
---
VBAのクラスでもインターフェイスが使えるみたいです。
## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#インターフェイスの定義">インターフェイスの定義</a></li>
<li><a href="#インターフェイスの実装">インターフェイスの実装</a></li>
<li><a href="#使用例">使用例</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="インターフェイスの定義">インターフェイスの定義</a><a class="heading-anchor-permalink" href="#インターフェイスの定義">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-02" updated="2021-07-02" %}</div>
まずはインターフェイスの定義をします。  
ここでは例として`clsHuman`という名前のインターフェイスを定義しています。

<div class="code-box">
<div class="title">(クラスモジュール) clsHuman</div>
<pre>
Option Explicit

Public Name As String
Public Age As Integer
Public Sub Greet(): End Sub
Public Function GetInfo() As String: End Function
</pre>
</div>

- プロパティ(`Name`や`Age`)やSubプロシージャ(`Greet`)、Functionプロシージャ(`GetInfo`)の枠だけ定義しています。

{% include goto_pagetop.html %}

* * *
## <a name="インターフェイスの実装">インターフェイスの実装</a><a class="heading-anchor-permalink" href="#インターフェイスの実装">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-02" updated="2021-07-02" %}</div>
次にインターフェイスで定義したプロパティやSubプロシージャ、Functionプロシージャの実装を行います。
ここでは例として`clsMan`と`clsWoman`という2つのクラスで実装を行います。

<div class="code-box">
<div class="title">(クラスモジュール) clsMan</div>
<pre>
Option Explicit

<em>Implements clsHuman</em> <em class="comment">' clsHumanを実装</em>

<em class="comment">' フィールド</em>
Private f_name As String
Private f_age As Integer

<em class="comment">' プロパティ: Nameの実装</em>
Private Property Let <em>clsHuman_</em>Name(ByVal x_name As String)
    f_name = x_name
End Property

<em class="comment">' プロパティ: Nameの実装</em>
Private Property Get <em>clsHuman_</em>Name() As String
    clsHuman_Name = f_name
End Property

<em class="comment">' プロパティ: Ageの実装</em>
Private Property Let <em>clsHuman_</em>Age(ByVal x_age As Integer)
    f_age = x_age
End Property

<em class="comment">' プロパティ: Ageの実装</em>
Private Property Get <em>clsHuman_</em>Age() As Integer
    clsHuman_Age = f_age
End Property

<em class="comment">' Subプロシージャ: Greetの実装</em>
Private Sub <em>clsHuman_</em>Greet()
    <em class="blue">Debug.Print "やぁ！僕の名前は " &amp; f_name &amp; " だよ。"</em>
End Sub

<em class="comment">' Functionプロシージャ: GetInfoの実装</em>
Private Function <em>clsHuman_</em>GetInfo() As String
    <em class="blue">clsHuman_GetInfo = "{""man"": {""name"":""" &amp; f_name &amp; """, ""age"":""" &amp; CStr(f_age) &amp; """}}"</em>
End Function
</pre>
</div>

<div class="code-box">
<div class="title">(クラスモジュール) clsWoman</div>
<pre>
Option Explicit

<em>Implements clsHuman</em> <em class="comment">' clsHumanを実装</em>

<em class="comment">' フィールド</em>
Private f_name As String
Private f_age As Integer

<em class="comment">' プロパティ: Nameの実装</em>
Private Property Let <em>clsHuman_</em>Name(ByVal x_name As String)
    f_name = x_name
End Property

<em class="comment">' プロパティ: Nameの実装</em>
Private Property Get <em>clsHuman_</em>Name() As String
    clsHuman_Name = f_name
End Property

<em class="comment">' プロパティ: Ageの実装</em>
Private Property Let <em>clsHuman_</em>Age(ByVal x_age As Integer)
    f_age = x_age
End Property

<em class="comment">' プロパティ: Ageの実装</em>
Private Property Get <em>clsHuman_</em>Age() As Integer
    clsHuman_Age = f_age
End Property

<em class="comment">' Subプロシージャ: Greetの実装</em>
Private Sub <em>clsHuman_</em>Greet()
    <em class="blue">Debug.Print "こんにちは。私の名前は " &amp; f_name &amp; " よ。"</em>
End Sub

<em class="comment">' Functionプロシージャ: GetInfoの実装</em>
Private Function <em>clsHuman_</em>GetInfo() As String
    <em class="blue">clsHuman_GetInfo = "&lt;woman name=""" &amp; f_name &amp; """ age=""" &amp; CStr(f_age) &amp; """&gt;"</em>
End Function
</pre>
</div>
- `Implements clsHuman`で、`clsHuman`を実装することを宣言します。
- `clsHuman`の実装のため、プロパティやプロシージャ宣言の名前の頭に`clsHuman_`が必要です。
- `clsMan`と`clsWoman`でそれぞれ、`Greet`と`GetInfo`の実装を変えています。

{% include goto_pagetop.html %}

* * *
## <a name="使用例">使用例</a><a class="heading-anchor-permalink" href="#使用例">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-07-02" updated="2021-07-02" %}</div>
<div class="code-box">
<div class="title">(モジュール) VBA_Interface</div>
<pre>
Option Explicit

Public Sub Main()
    Dim p_taro <em>As clsHuman</em>
    Set p_taro = <em class="blue">New clsMan</em>
    With p_taro
        .Name = "太郎"
        .Age = 40
    End With
    printInfo p_taro
    
    Dim p_hanako <em>As clsHuman</em>
    Set p_hanako = <em class="blue">New clsWoman</em>
    With p_hanako
        .Name = "花子"
        .Age = 18
    End With
    printInfo p_hanako
End Sub

Private Sub printInfo(x_human <em>As clsHuman</em>)
    x_human.Greet
    Debug.Print x_human.GetInfo()
End Sub
</pre>
</div>

### 出力結果
<div class="code-box-output">
<div class="title">(イミディエイトウィンドウ)</div>
<pre>
やぁ！僕の名前は 太郎 だよ。
{"man": {"name":"太郎", "age":"40"}}
こんにちは。私の名前は 花子 よ。
&lt;woman name="花子" age="18"&gt;
</pre>
</div>

- 太郎さんと花子さんという2人の人物のインスタンスを生成しています。
- `clsMan`と`clsWoman`は`clsHuman`を`Implements`しているため、`clsHuman`型の変数に格納できます。(ポリモーフィズム)
- `printInfo`に`clsHuman`型としてインスタンスを引き渡し、`Greet`と`GetInfo`を呼び出しています。
  - クラスごとに実装が異なるので、結果に違いが出ます。(出力結果参照)

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-01-05" updated="2022-01-05" %}</div>

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
