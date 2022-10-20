---
title: giboを使ってみよう
article_group_id: tips-group
display_order: 10
created: 2021-09-28
updated: 2021-09-28
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#giboとは">giboとは</a></li>
<li><a href="#インストール">インストール</a></li>
<li><a href="#動作確認">動作確認</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="giboとは">giboとは</a><a class="heading-anchor-permalink" href="#giboとは">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-28" updated="2021-09-28" %}</div>
- `gibo`は`.gitignore`を自動生成してくれるツールです。

{% include goto_pagetop.html %}

* * *
## <a name="インストール">インストール</a><a class="heading-anchor-permalink" href="#インストール">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-28" updated="2021-09-28" %}</div>
- 私の環境がUbuntuなので、[こちら](https://github.com/simonwhitaker/gibo#installation-on-other-nix-platforms)を参考にやってみます。

### 前提
- `~/bin` にパスが通っていること。

### インストール
- giboをダウンロードしてきて、`gibo update`すると使えるようになります。
- 以下コマンドにて一気に実行できます。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ curl -L https://raw.github.com/simonwhitaker/gibo/master/gibo -so ~/bin/gibo &amp;&amp; chmod +x ~/bin/gibo &amp;&amp; gibo update
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="動作確認">動作確認</a><a class="heading-anchor-permalink" href="#動作確認">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-28" updated="2021-09-28" %}</div>
- インストール後は`gibo`コマンドが任意の場所で使えるようになっています。

### 動作確認
- まずは`gibo`だけで実行すると、使えるコマンドを教えてくれます。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ <em>gibo</em>
gibo 2.2.4 by Simon Whitaker &lt;sw@netcetera.org&gt;
https://github.com/simonwhitaker/gibo

Fetches gitignore boilerplates from https://github.com/github/gitignore

<em class="blue">Usage:
    gibo [command]

Example:
    gibo dump Swift Xcode &gt;&gt; .gitignore

Commands:
    dump BOILERPLATE...   Write boilerplate(s) to STDOUT
    help                  Display this help text
    list                  List available boilerplates
    root                  Show the directory where gibo stores its boilerplates
    search STR            Search for boilerplates with STR in the name
    update                Update list of available boilerplates
    version               Display current script version</em>
</pre>
</div>

### 対応言語
- 対応している言語は`list`で調べられます。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ gibo <em>list</em>
Actionscript            ForceDotCom             IGORPro
Ada                     Fortran                 Java
Agda                    FuelPHP                 JBoss
Android                 Gcov                    Jekyll
AppceleratorTitanium    GitBook                 JENKINS_HOME
　:
　: (略)
　:
Elm                     Go                      Waf
EPiServer               Godot                   WordPress
Erlang                  Gradle                  Xojo
ExpressionEngine        Grails                  Yeoman
ExtJs                   GWT                     Yii
Fancy                   Haskell                 ZendFramework
Finale                  Idris                   Zephir
</pre>
</div>

### 例：Goの.gitignore
- 対応している言語の中から好きなものを組み合わせて`.gitignore`にリダイレクトすれば`.gitignore`が完成です。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ gibo dump <em>Go</em> &gt;&gt; <em class="blue">.gitignore</em>
$ cat <em class="blue">.gitignore</em>
<em class="blue">### https://raw.github.com/github/gitignore/b0012e4930d0a8c350254a3caeedf7441ea286a3/Go.gitignore

# Binaries for programs and plugins
*.exe
*.exe~
*.dll
*.so
*.dylib

# Test binary, built with `go test -c`
*.test

# Output of the go coverage tool, specifically when used with LiteIDE
*.out

# Dependency directories (remove the comment below to include it)
# vendor/</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-28" updated="2021-09-28" %}</div>
### 参照
- [(GitHub) simonwhitaker/gibo](https://github.com/simonwhitaker/gibo)

### 参考サイト
- [(Qiita) 気付いたら.gitignoreはgiboで自動生成する時代になっていた](https://qiita.com/tmknom/items/c4bcebe17d25381fa45d)
- [(Qiita) いまさらgiboの使い方](https://qiita.com/SatohJohn/items/08aa4bf57ecc54b22a12)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
