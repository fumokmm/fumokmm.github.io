---
title: Visual Studio CodeでRubyをデバッグする
display_order: 10
created: 2021-03-16
updated: 2021-03-16
---
{% capture link_to_it_ruby %}{% link _it_articles/ruby/index.md %}{% endcapture %}
{% assign link_to_it_ruby = link_to_it_ruby | remove: 'index' %}
[Ruby]({{link_to_it_ruby}})をVisual Studio Codeで書く時にデバッグする方法のメモです。

## <a name="index">目次</a>

<ul id="index_ul">
<li><a href="#install-ruby-extension">Ruby用の拡張を導入する</a></li>
<li><a href="#isntall-gem-for-debugging">デバッグ用Gemを導入する</a></li>
<li><a href="#configuration-file">Visual Studio Code用の設定ファイルを作成する</a></li>
<li><a href="#try-it">動かしてみる</a></li>
<li><a href="#reference">参考</a></li>
</ul>

* * *
## <a name="install-ruby-extension">Ruby用の拡張を導入する</a><a href="#install-ruby-extension">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-16" updated="2021-03-16" %}</div>
これを書いている時点でインストールしたものは以下です。
<div class="code-box no-title">
<pre markdown="span">
Name: Ruby
Id: rebornix.ruby
Description: Ruby language support and debugging for Visual Studio Code
Version: 0.28.1
Publisher: Peng Lv
VS Marketplace Link: [https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby)
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="isntall-gem-for-debugging">デバッグ用Gemを導入する</a><a href="#isntall-gem-for-debugging">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-16" updated="2021-03-16" %}</div>
<div class="code-box-output no-title">
<pre>
$ gem install bundler
$ bundle init
$ cat Gemfile
# A sample Gemfile
source "https://rubygems.org"

# gem "rails"
gem "ruby-debug-ide"
gem "debase"
$ bundle install
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="configuration-file">Visual Studio Code用の設定ファイルを作成する</a><a href="#configuration-file">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-16" updated="2021-03-16" %}</div>
<div class="code-box">
<div class="title">.vscode/launch.json</div>
<pre>
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug Local File",
            "type": "Ruby",
            "request": "launch",
            "program": "${workspaceRoot}/<em>main.rb</em>",
            <em>"useBundler": true</em>
        }
    ]
}
</pre>
</div>
- 作成する場所・ファイルは、VSCodeで開いているを`.`とした時の`.vscode/launch.json`です。
- 上記の設定だと、実行されるのは、ワークスペースルートの`main.rb`です。
- Bundler経由で実行するので、`"useBundler": true`の記述を追記します。

{% include goto_pagetop.html %}

* * *
## <a name="try-it">動かしてみる</a><a href="#try-it">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-16" updated="2021-03-16" %}</div>
- `main.rb`内にブレークポイントを付けます。
- `Activity Bar`の`Run and Debug`を開き、再生ボタンの中から、`Debug Local File`を実行します。
- ブレークポイントを付けた部分でコードの実行が止まり、デバッグができます。
- `Editor Area`の上部にデバッグのコントロール用のアイコンが並んでいますので、操作します。
  - Continue (F5)
  - Step Over (F10)
  - Step Into (F11)
  - Step Out (Shift + F11)
  - Restart (Ctrl + Shift + F5)
  - Stop (Shift + F5)

{% include goto_pagetop.html %}

* * *
## <a name="reference">参考</a><a href="#reference">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-03-16" updated="2021-03-16" %}</div>
- [(DevelopersIO) Visual Studio CodeによるRubyのデバッグ](https://dev.classmethod.jp/articles/visual-studio-code-ruby-debug/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
