---
title: Windows環境(WSL)にRustをインストール
article_group_id: getting-started-group
display_order: 10
created: 2022-09-28
updated: 2022-09-28
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#インストール">インストール</a></li>
<li><a href="#動作確認">動作確認</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="インストール">インストール</a><a class="heading-anchor-permalink" href="#インストール">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-28" updated="2022-09-28" %}</div>
- [rustupがおすすめ](https://www.rust-lang.org/ja/tools/install)らしいので、`rustup`を使うことにしました。

### Rustのダウンロードとインストール
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh</em>
info: downloading installer

Welcome to Rust!

This will download and install the official compiler for the Rust
programming language, and its package manager, Cargo.

Rustup metadata and toolchains will be installed into the Rustup
home directory, located at:

  /home/fumo/.rustup

This can be modified with the RUSTUP_HOME environment variable.

The Cargo home directory is located at:

  /home/fumo/.cargo

This can be modified with the CARGO_HOME environment variable.

The cargo, rustc, rustup and other commands will be added to
Cargo's bin directory, located at:

  /home/fumo/.cargo/bin

This path will then be added to your PATH environment variable by
modifying the profile files located at:

  /home/fumo/.profile
  /home/fumo/.bashrc

You can uninstall at any time with rustup self uninstall and
these changes will be reverted.

Current installation options:


   default host triple: x86_64-unknown-linux-gnu
     default toolchain: stable (default)
               profile: default
  modify PATH variable: yes

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
&gt;
</pre>
</div>
ここでとりあえず`1`と打って`Enter`。ちなみに、`fumo`って部分は私のユーザ名です。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
info: profile set to 'default'
info: default host triple is x86_64-unknown-linux-gnu
info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
info: latest update on 2022-09-22, rust version 1.64.0 (a55dd71d5 2022-09-19)
info: downloading component 'cargo'
  6.4 MiB /   6.4 MiB (100 %)   1.2 MiB/s in  5s ETA:  0s
info: downloading component 'clippy'
  2.8 MiB /   2.8 MiB (100 %)   1.1 MiB/s in  2s ETA:  0s
info: downloading component 'rust-docs'
 18.8 MiB /  18.8 MiB (100 %)   1.1 MiB/s in 16s ETA:  0s
info: downloading component 'rust-std'
 27.4 MiB /  27.4 MiB (100 %)   1.2 MiB/s in 26s ETA:  0s
info: downloading component 'rustc'
 54.2 MiB /  54.2 MiB (100 %)   1.1 MiB/s in 51s ETA:  0s
info: downloading component 'rustfmt'
  4.3 MiB /   4.3 MiB (100 %) 849.2 KiB/s in  5s ETA:  0s
info: installing component 'cargo'
info: installing component 'clippy'
info: installing component 'rust-docs'
 18.8 MiB /  18.8 MiB (100 %)   6.2 MiB/s in  2s ETA:  0s
info: installing component 'rust-std'
 27.4 MiB /  27.4 MiB (100 %)  10.3 MiB/s in  2s ETA:  0s
info: installing component 'rustc'
 54.2 MiB /  54.2 MiB (100 %)  12.6 MiB/s in  4s ETA:  0s
info: installing component 'rustfmt'
info: default toolchain set to 'stable-x86_64-unknown-linux-gnu'

  stable-x86_64-unknown-linux-gnu installed - rustc 1.64.0 (a55dd71d5 2022-09-19)


Rust is installed now. Great!

To get started you may need to restart your current shell.
This would reload your PATH environment variable to include
Cargo's bin directory ($HOME/.cargo/bin).

To configure your current shell, run:
source "$HOME/.cargo/env"
</pre>
</div>
終わった。

### rustc(Rustのコンパイラ)やcargo(Rustのツールチェーン)へ実行パスを通す
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
<em class="command">$ source "$HOME/.cargo/env"</em>
</pre>
</div>

ターミナルを閉じてもパスが通るよう、`.bashrc`などに以下行を追加
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
export PATH="$HOME/.cargo/bin:$PATH"
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="動作確認">動作確認</a><a class="heading-anchor-permalink" href="#動作確認">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-28" updated="2022-09-28" %}</div>
### バージョン確認
<div class="code-box-output">
<div class="title">rustcとcargoコマンド</div>
<div class="copy-button">Copy</div>
<pre>
<em class="command">$ rustc -V</em>
rustc 1.64.0 (a55dd71d5 2022-09-19)
<em class="command">$ cargo -V</em>
cargo 1.64.0 (387270bc7 2022-09-16)
</pre>
</div>
- こんなのが出ればOK。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-09-28" updated="2022-09-28" %}</div>
### 参考書籍
- {% include book/book_945.html %} {% comment %} プログラミング言語Rust入門 {% endcomment %}

### 参考サイト
- [(公式サイト) Rust をインストール](https://www.rust-lang.org/ja/tools/install)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
