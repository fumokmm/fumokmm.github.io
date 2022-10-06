---
title: Rustの文法
article_group_id: basis-group
display_order: 10
created: 2022-10-05
updated: 2022-10-06
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<div style="column-count: 2;">
    <ul id="index_ul">
        <li><a href="#基礎文法">基礎文法</a>
            <ul>
                <li><a href="#Rustの特徴">Rustの特徴</a></li>
                <li><a href="#型">型</a></li>
            </ul>
        </li>
        <li><a href="#参照・参考">参照・参考</a>
            <ul>
                <li><a href="#参考">参考</a></li>
            </ul>
        </li>
    </ul>
</div>

## <a name="基礎文法">基礎文法</a><a class="heading-anchor-permalink" href="#基礎文法">§</a>
* * *
## <a name="Rustの特徴">Rustの特徴</a><a class="heading-anchor-permalink" href="#Rustの特徴">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-05" updated="2022-10-05" %}</div>
### 基本的な型、変数の扱い、束縛
- 型：
  - 数値、リテラル、浮動小数点数、論理値、文字型
- 複合型：
  - タプル、配列型
- 参照と借用：
  - 所有権の移動、借用
- 束縛：
  - 束縛と可変変数、シャドーイング
- スコープ：
  - ブロック単位、関数単位、構造体単位、クロージャ単位

### 文字列
- 文字：
  - 文字を扱う、特殊文字、u8型へのキャスト
- 文字列：
  - 文字列の扱い、アルファベットの操作、
  - 日本語の扱い、日本語を正しく扱う
- 文字列スライス：
  - 先頭を切り出すスライス、途中の文字列を切り出すスライス、
  - 最後まで切り出すスライス、全体を切り出すスライス

### 文と式と関数
- 文と式：
  - 文、式
- 演算子：
  - 四則演算子、代入演算子、ビット演算子、シフト演算子、論理演算子、単項演算子
- 関数：
  - 引数のない関数、引数のある関数、戻り値のある関数、
  - 文字列を受け取る関数、文字列を戻す関数、
  - ベクターを受け取る関数、ベクターを戻す関数、ベクターの中身を変更する関数

### その他
- 制御文とパターンマッチ
- 配列とベクター
- 構造体とメソッド
- ジェネリクスとトレイト
- 所有権
- パッケージの作成
- ファイル入出力
- マクロ
- Web API呼び出し
- データベースアクセス
- C言語ライブラリの呼び出し
- クロージャ
- 並列化
- テストコード

### 参考書籍
- {% include book/book_945.html %} {% comment %} プログラミング言語Rust入門 {% endcomment %}

{% include goto_pagetop.html %}

* * *
## <a name="型">型</a><a class="heading-anchor-permalink" href="#型">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-05" updated="2022-10-06" %}</div>
### 型推論
- Rustの場合は型推論させるのが一般的です。
<div class="code-box">
<div class="title">型推論させた変数の使用例</div>
<pre>
fn main() {
    let name = "fumo";
    let age = 41;
}
</pre>
</div>
- 型を宣言しておきたいときは `:` の後に変数の型を書きます。
<div class="code-box">
<div class="title">型を宣言</div>
<pre>
fn main() {
    let name <em>: &amp;str</em> = "fumo";
    let age <em>: i32</em> = 41;
}
</pre>
</div>
- 文字列の型は`&str`。
- 数値の場合は主に`i32`を使います。`i32`は整数(integer)の32ビット版です。
- 最近のパソコンでは64ビットが主流なので`i64`でもOKです。
- 変数だけの時は型を指定する必要はありません。(型推論でOK)
- しかし、関数を作成する場合は型の指定が必須になります。

<div class="code-box">
<div class="title">関数を作成する場合は型の指定が必須になる</div>
<pre>
fn add(x: <em>i32</em>, y: <em>i32</em>) -&gt; <em>i32</em> {
    x + y
}
</pre>
</div>
- `fn`は関数宣言の印です。
- add関数は引数xと引数yの2つを受け取って、加算して返すという簡単なものです。
- `->`が関数の戻り値です。

- 戻り値の型は関数の中で使われている計算結果の型と一致させなくてはならない。
<div class="code-box">
<div class="title">コンパイルエラー</div>
<pre>
fn add(x: <em>i32</em>, y: <em>i32</em>) -&gt; <em class="blue">i64</em> {
    x + y
}
</pre>
</div>
- 戻り値の型で指定した`i64`が間違っているためコンパイルエラーになります。
- x + yの型を`i64`型に変換するか、add関数の戻り値の型を`i32`型変更するかの2つの解決方法があります。

### 数値の型
<table class="normal">
	<tr>
		<th markdown="span">ビット長</th>
		<th markdown="span">整数</th>
		<th markdown="span">符号なし整数</th>
	</tr>
	<tr>
		<td markdown="span">8ビット</td>
		<td markdown="span">i8</td>
		<td markdown="span">u8</td>
	</tr>
	<tr>
		<td markdown="span">16ビット</td>
		<td markdown="span">i16</td>
		<td markdown="span">u16</td>
	</tr>
	<tr>
		<td markdown="span">32ビット</td>
		<td markdown="span">i32</td>
		<td markdown="span">u32</td>
	</tr>
	<tr>
		<td markdown="span">64ビット</td>
		<td markdown="span">i64</td>
		<td markdown="span">u64</td>
	</tr>
	<tr>
		<td markdown="span">処理系依存</td>
		<td markdown="span">isize</td>
		<td markdown="span">usize</td>
	</tr>
</table>

### 数値のリテラル
<table class="normal">
	<tr>
		<th markdown="span">数値リテラル</th>
		<th markdown="span">例</th>
	</tr>
	<tr>
		<td markdown="span">10進数</td>
		<td markdown="span">12_345</td>
	</tr>
	<tr>
		<td markdown="span">16進数</td>
		<td markdown="span">0xff</td>
	</tr>
	<tr>
		<td markdown="span">8進数</td>
		<td markdown="span">0o77</td>
	</tr>
	<tr>
		<td markdown="span">2進数</td>
		<td markdown="span">0b1111_0000</td>
	</tr>
	<tr>
		<td markdown="span">1バイト</td>
		<td markdown="span">b'A'</td>
	</tr>
</table>

### 浮動小数点数
<table class="normal">
	<tr>
		<th markdown="span">ビット長</th>
		<th markdown="span">浮動小数点数</th>
		<th markdown="span">備考</th>
	</tr>
	<tr>
		<td markdown="span">32ビット</td>
		<td markdown="span">f32</td>
		<td markdown="span">単精度浮動小数点数</td>
	</tr>
	<tr>
		<td markdown="span">64ビット</td>
		<td markdown="span">f64</td>
		<td markdown="span">倍精度浮動小数点数</td>
	</tr>
</table>
<div class="code-box no-title">
<pre>
fn main() {
    let x = 100.234;
    println!("x is {}", x);
    let y : f64 = 100.234;
    println!("y is {}", y);
}
</pre>
</div>

### 論理値
`true`と`false`の2つのみ値を持つ。`bool型`。
<div class="code-box no-title">
<pre>
fn main() {
    let b = true;
    println!("b is {}", b);
}
</pre>
</div>

### 文字型
- `char型`を使います。
- アルファベットやひらがななどをシングルクォート(`'`)で囲みます。
<div class="code-box no-title">
<pre>
fn main() {
    let c = 'A';
    println!("c is {}", c);
    let c = 'あ';
    println!("c is {}", c);
    let dog = '🐶';
    println!("dog is {}", dog);
    let cat : char = '😸';
    println!("cat is {}", cat);
}
</pre>
</div>

### 文字列型
あとで書きます。

### 参考書籍
- {% include book/book_945.html %} {% comment %} プログラミング言語Rust入門 {% endcomment %}

{% include goto_pagetop.html %}

## <a name="参照・参考">参照・参考</a><a class="heading-anchor-permalink" href="#参照・参考">§</a>
* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-05" updated="2022-10-05" %}</div>
### 参考書籍
- {% include book/book_945.html %} {% comment %} プログラミング言語Rust入門 {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
