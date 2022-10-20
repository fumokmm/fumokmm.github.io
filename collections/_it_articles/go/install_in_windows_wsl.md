---
title: Windows環境(WSL)にGoをインストール
article_group_id: getting-started-group
display_order: 10
created: 2021-09-24
updated: 2021-09-24
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#Goenvとは">Goenvとは</a></li>
<li><a href="#インストール">インストール</a></li>
<li><a href="#動作確認">動作確認</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="Goenvとは">Goenvとは</a><a class="heading-anchor-permalink" href="#Goenvとは">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-24" updated="2021-09-24" %}</div>
- Goのバージョン管理ツールで、プロジェクト管理でバージョンを変えたりできるので便利です。  
- 他の言語の`何とかenv`も存在するします。
  - Python -> `Pyenv`、Ruby -> `Rbenv` など

{% include goto_pagetop.html %}

* * *
## <a name="インストール">インストール</a><a class="heading-anchor-permalink" href="#インストール">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-24" updated="2021-09-24" %}</div>
- 基本の手順は[こちら](https://github.com/syndbg/goenv/blob/master/INSTALL.md)を参考に。

### クローンしてくる
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ git clone https://github.com/syndbg/goenv.git ~/.goenv
</pre>
</div>

### 環境変数を追加
- `~/.bash_profile` や `~/.bashrc` に`export`を追加する。
  - 私の環境はUbuntuだったので、例は`~/.bashrc`となっています。
<div class="code-box">
<div class="title">~/.bashrcに追記</div>
<div class="copy-button">Copy</div>
<pre>
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
eval "$(goenv init -)"
</pre>
</div>

### 設定を反映
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ source ~/.bashrc
</pre>
</div>

### インストール可能なバージョンを確認
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ goenv install -l
Available versions:
  1.2.2
  1.3.0
    ：
    ： (中略)
    ：
  1.16.7
  1.16.8
  1.17.0
  1.17beta1
  1.17rc1
  1.17rc2
  1.17.1
</pre>
</div>

今回は、`1.17.1`をインストールします。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ goenv install 1.17.1
</pre>
</div>

### Goのバージョンを設定と確認

<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ goenv global 1.17.1
$ goenv rehash
$ goenv version
1.17.1 (set by /home/fumo/.goenv/version)
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="動作確認">動作確認</a><a class="heading-anchor-permalink" href="#動作確認">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-24" updated="2021-09-24" %}</div>
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
$ go
Go is a tool for managing Go source code.

Usage:

        go &lt;command&gt; [arguments]

The commands are:

        bug         start a bug report
        build       compile packages and dependencies
        clean       remove object files and cached files
        doc         show documentation for package or symbol
        env         print Go environment information
        fix         update packages to use new APIs
        fmt         gofmt (reformat) package sources
        generate    generate Go files by processing source
        get         add dependencies to current module and install them
        install     compile and install packages and dependencies
        list        list packages or modules
        mod         module maintenance
        run         compile and run Go program
        test        test packages
        tool        run specified go tool
        version     print Go version
        vet         report likely mistakes in packages

Use "go help &lt;command&gt;" for more information about a command.

Additional help topics:

        buildconstraint build constraints
        buildmode       build modes
        c               calling between Go and C
        cache           build and test caching
        environment     environment variables
        filetype        file types
        go.mod          the go.mod file
        gopath          GOPATH environment variable
        gopath-get      legacy GOPATH go get
        goproxy         module proxy protocol
        importpath      import path syntax
        modules         modules, module versions, and more
        module-get      module-aware go get
        module-auth     module authentication using go.sum
        packages        package lists and patterns
        private         configuration for downloading non-public code
        testflag        testing flags
        testfunc        testing functions
        vcs             controlling version control with GOVCS

Use "go help &lt;topic&gt;" for more information about that topic.
</pre>
</div>
- こんなのが出ればOK。これでGoコマンドが使えます。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-24" updated="2021-09-24" %}</div>
### 参考サイト
- [(Qiita) WSLで最新バージョンのGo環境構築](https://qiita.com/10380r/items/37d0bf71b0e19a49ce53)

### 参照
- [(GitHub) Goenv](https://github.com/syndbg/goenv)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
