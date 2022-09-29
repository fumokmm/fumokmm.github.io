---
title: RustでHello World
article_group_id: getting-started-group
display_order: 20
created: 2022-09-29
updated: 2022-09-29
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#プロジェクト作成">プロジェクト作成</a></li>
<li><a href="#ビルド">ビルド</a></li>
<li><a href="#プログラムの実行">プログラムの実行</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="プロジェクト作成">プロジェクト作成</a><a class="heading-anchor-permalink" href="#プロジェクト作成">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-29" updated="2022-09-29" %}</div>
まず、`hello`という名前のプロジェクトを作成します。  
`cargo new <プロジェクト名>`というコマンドを利用すると`hello`ディレクトリにプロジェクトが出来上がります。

<div class="code-box-output no-title">
<pre>
<em class="command">$ cargo new hello</em>
     Created binary (application) `hello` package
<em class="command">$ cd hello</em>
<em class="command">$ tree .</em>
.
├── Cargo.toml
└── src
    └── main.rs

1 directory, 2 files
</pre>
</div>

`Cargo.toml`はパッケージのバージョンや読み込むライブラリを設定するファイルです。
`TOML`については[こちら]({% link _it_articles/structured_text_data_format/toml.md %})。

<div class="code-box">
<div class="title">Cargo.toml</div>
<pre>
[package]
name = "hello"
version = "0.1.0"
edition = "2021"

# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html

[dependencies]
</pre>
</div>

Rustのソースコードは、`src`ディレクトリの`main.rs`というファイルになります。  

<div class="code-box">
<div class="title">main.rs</div>
<pre>
fn main() {
    println!("Hello, world!");
}
</pre>
</div>
- main関数(fn main()部分)を実行し、
- `println!`マクロで "Hello, world!" をコンソールに表示するという意味になります。

{% include goto_pagetop.html %}

* * *
## <a name="ビルド">ビルド</a><a class="heading-anchor-permalink" href="#ビルド">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-29" updated="2022-09-29" %}</div>
ビルドには`cargo build`を使います。  
`hello`ディレクトリにいる状態で実行します。

<div class="code-box-output no-title">
<pre>
<em class="command">$ cargo build</em>
   Compiling hello v0.1.0 (/mnt/c/workspace/Github/language-examples/Rust/hello)
    Finished dev [unoptimized + debuginfo] target(s) in 2.38s

<em class="command">$ tree .</em>
.
├── Cargo.lock
├── Cargo.toml
├── src
│   └── main.rs
└── target
    ├── CACHEDIR.TAG
    └── debug
        ├── build
        ├── deps
        │   ├── hello-f10f454b064da970
        │   └── hello-f10f454b064da970.d
        ├── examples
        ├── <em>hello</em>
        ├── hello.d
        └── incremental
            └── hello-2mghwo7kpinkd
                ├── s-ge03h8nmqd-uw9nnv-1uzy4u92gue27
                │   ├── 1d6crpaiajeebzfe.o
                │   ├── 3a44f156fv0rzb76.o
                │   ├── 3g9kzsj53phza7ii.o
                │   ├── 42jn790wo4cvbi0y.o
                │   ├── 48bco2yrw0xezka8.o
                │   ├── 54y1yn6ksdtd3wa1.o
                │   ├── 5doja4y44nwg3ez0.o
                │   ├── 5dxeof03oiet4swm.o
                │   ├── dep-graph.bin
                │   ├── query-cache.bin
                │   └── work-products.bin
                └── s-ge03h8nmqd-uw9nnv.lock

9 directories, 20 files
</pre>
</div>

いろいろなファイルができますが、実行ファイルは `target/debug/hello` です。  
実行ファイルなどを削除して最初の状態に戻したいときは `cargo clean` を使います。

{% include goto_pagetop.html %}

* * *
## <a name="プログラムの実行">プログラムの実行</a><a class="heading-anchor-permalink" href="#プログラムの実行">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-29" updated="2022-09-29" %}</div>
### 直接実行する
まずは実行ファイルを直接実行する方法。

<div class="code-box-output no-title">
<pre>
<em class="command">$ ./target/debug/hello</em>
Hello, world!
</pre>
</div>

### cargo run を使って実行する
または`cargo run`を使う。
`cargo run`はビルドと実行が同時に行われます。

<div class="code-box-output no-title">
<pre>
<em class="command">$ cargo run</em>
    Finished dev [unoptimized + debuginfo] target(s) in 0.04s
     Running `target/debug/hello`
Hello, world!
</pre>
</div>

### 1つのファイルのみコンパイルする
`rustc`を使います。  
ソースと同じディレクトリに実行ファイルができあがります。

<div class="code-box-output">
<div class="title">srcディレクトリ上で実行</div>
<pre>
<em class="command">$ rustc main.rs</em>
<em class="command">$ ls -l</em>
合計 3800
-rwxrwxrwx 1 fumo fumo 3887960  9月 29 23:51 main
-rwxrwxrwx 1 fumo fumo      45  9月 29 23:26 main.rs
<em class="command">$ ./main</em>
Hello, world!
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-29" updated="2022-09-29" %}</div>
### サンプルソース
- [(language-examples) n0001_hello_world](https://github.com/fumokmm/language-examples/tree/main/Rust/n0001_hello_world)

### 参考書籍
- {% include book/book_945.html %} {% comment %} プログラミング言語Rust入門 {% endcomment %}

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
