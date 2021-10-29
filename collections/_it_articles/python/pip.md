---
title: pipのメモ
article_group_id: library-group
display_order: 10
created: 2021-10-14
updated: 2021-10-14
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#pipとは">pipとは</a></li>
<li><a href="#バージョン確認">バージョン確認</a></li>
<li><a href="#インストール済みのパッケージを確認">インストール済みのパッケージを確認</a></li>
<li><a href="#パッケージをインストールする">パッケージをインストールする</a></li>
<li><a href="#パッケージを更新する">パッケージを更新する</a></li>
<li><a href="#パッケージをアンインストール">パッケージをアンインストール</a></li>
<li><a href="#パッケージをローカルにダウンロードしてインストールする">パッケージをローカルにダウンロードしてインストールする</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="pipとは">pipとは</a><a class="heading-anchor-permalink" href="#pipとは">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-14" updated="2021-10-14" %}</div>
- `pip`はPythonのパッケージ管理ツールです。
- パッケージは[公式](https://www.python.org/)が配布しているものと、サードパーティが配布しているものがあります。
- サードパーティのパッケージは[PyPI](https://pypi.org/)にて配布しています。
- Pythonのパッケージ管理ツールは他に、`easy_install`とか`conda`があるらしいです。
- `pip`はインストールしてすぐ使えるので、特にこだわりがなければこれでいいんじゃないかと思います。

{% include goto_pagetop.html %}

* * *
## <a name="バージョン確認">バージョン確認</a><a class="heading-anchor-permalink" href="#バージョン確認">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-14" updated="2021-10-14" %}</div>
まずはバージョン確認ですね。  
バージョン確認には`-V`オプションを使います。
<div class="code-box-output no-title">
<pre>
$ pip <em>-V</em>
pip 20.3.1 from /home/fumo/.local/lib/python3.8/site-packages/pip (python 3.8)
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="インストール済みのパッケージを確認">インストール済みのパッケージを確認</a><a class="heading-anchor-permalink" href="#インストール済みのパッケージを確認">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-14" updated="2021-10-14" %}</div>
インストール済みのパッケージを確認するには`list`か`freeze`コマンドを使います。  
両者は表示のされ方がちょっと違います。

<div class="code-box-output">
<div class="title">list</div>
<pre>
$ pip <em>list</em>
Package                Version
---------------------- --------------------
astroid                2.4.2
attrs                  19.3.0
Automat                0.8.0
beautifulsoup4         4.9.3
blinker                1.4
   ：
   ： (省略)
   ：
</pre>
</div>

<div class="code-box-output">
<div class="title">freeze</div>
<pre>
$ pip <em>freeze</em>
astroid==2.4.2
attrs==19.3.0
Automat==0.8.0
beautifulsoup4==4.9.3
blinker==1.4
   ：
   ： (省略)
   ：
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="パッケージをインストールする">パッケージをインストールする</a><a class="heading-anchor-permalink" href="#パッケージをインストールする">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-14" updated="2021-10-14" %}</div>
パッケージをインストールするには`install`コマンドを使います。  
ここでは例として`numpy`をインストールしています。

<div class="code-box-output no-title">
<pre>
$ pip <em>install</em> <em class="blue">numpy</em>
Defaulting to user installation because normal site-packages is not writeable
Collecting numpy
  Downloading numpy-1.21.2-cp38-cp38-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (15.8 MB)
     |████████████████████████████████| 15.8 MB 925 kB/s
Installing collected packages: numpy
Successfully installed numpy-1.21.2
</pre>
</div>

バージョンを指定してインストールするには以下のようにします。
<div class="code-box-output no-title">
<pre>
$ pip <em>install</em> <em class="blue">'numpy==1.21.2'</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="パッケージを更新する">パッケージを更新する</a><a class="heading-anchor-permalink" href="#パッケージを更新する">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-14" updated="2021-10-14" %}</div>
パッケージを更新する場合は`install`コマンドに`--upgrade`オプションを付けて使います。  

<div class="code-box-output no-title">
<pre>
$ pip <em>install --upgrade</em> <em class="blue">numpy</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="パッケージをアンインストール">パッケージをアンインストール</a><a class="heading-anchor-permalink" href="#パッケージをアンインストール">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-14" updated="2021-10-14" %}</div>
パッケージをアンインストールするには`uninstall`コマンドを使います。  

<div class="code-box-output no-title">
<pre>
$ pip <em>uninstall</em> <em class="blue">numpy</em>
</pre>
</div>

`-y`オプションを付けると、確認をスキップしてアンインストールできます。
<div class="code-box-output no-title">
<pre>
$ pip <em>uninstall -y</em> <em class="blue">numpy</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="パッケージをローカルにダウンロードしてインストールする">パッケージをローカルにダウンロードしてインストールする</a><a class="heading-anchor-permalink" href="#パッケージをローカルにダウンロードしてインストールする">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-14" updated="2021-10-14" %}</div>
ネット環境が使えない場合など、一度パッケージを`whl`形式でダウンロードしておいて、インストールすることが可能です。

### 1. whlをダウンロードする
ダウンロードするには`download`コマンドを使います。  
ここでは例として`pandas`をダウンロードしています。
<div class="code-box-output no-title">
<pre>
$ pip <em>download</em> <em class="blue">pandas</em>
Collecting pandas
  Downloading pandas-1.3.3-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (11.5 MB)
     |████████████████████████████████| 11.5 MB 1.5 MB/s
Collecting numpy&gt;=1.17.3
  Using cached numpy-1.21.2-cp38-cp38-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (15.8 MB)
Collecting python-dateutil&gt;=2.7.3
  Downloading python_dateutil-2.8.2-py2.py3-none-any.whl (247 kB)
     |████████████████████████████████| 247 kB 1.9 MB/s
Collecting pytz&gt;=2017.3
  Downloading pytz-2021.3-py2.py3-none-any.whl (503 kB)
     |████████████████████████████████| 503 kB 1.8 MB/s
Collecting six&gt;=1.5
  Downloading six-1.16.0-py2.py3-none-any.whl (11 kB)
Saved ./pandas-1.3.3-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
Saved ./numpy-1.21.2-cp38-cp38-manylinux_2_12_x86_64.manylinux2010_x86_64.whl
Saved ./python_dateutil-2.8.2-py2.py3-none-any.whl
Saved ./pytz-2021.3-py2.py3-none-any.whl
Saved ./six-1.16.0-py2.py3-none-any.whl
Successfully downloaded pandas numpy python-dateutil pytz six
</pre>
</div>
ダウンロードした`whl`ファイルはカレントディレクトリに置かれます。
<div class="code-box-output no-title">
<pre>
$ ls
numpy-1.21.2-cp38-cp38-manylinux_2_12_x86_64.manylinux2010_x86_64.whl
pandas-1.3.3-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl
python_dateutil-2.8.2-py2.py3-none-any.whl
pytz-2021.3-py2.py3-none-any.whl
six-1.16.0-py2.py3-none-any.whl
</pre>
</div>

### 2. whlをインストール
ローカルに落としてきた`whl`ファイルを指定してインストールしていきます。  
以下2つのオプションを使います。
- `--no-index`：PyPIは参照しない（ローカルを参照するために設定）
- `--find-links=<参照する場所>`：指定した場所を参照する
<div class="code-box-syntax no-title">
<pre>
pip <em>install --no-index --find-links</em>=<em class="orange">&lt;whlファイルへのパス&gt;</em> <em class="blue">&lt;モジュール名&gt;</em>
</pre>
</div>
上でダウンロードしたものを`/tmp/whl`に置いてある想定なら、以下のようなコマンドになります。
<div class="code-box-output no-title">
<pre>
$ pip <em>install --no-index --find-links</em>=<em class="orange">/tmp/whl/numpy-1.21.2-cp38-cp38-manylinux_2_12_x86_64.manylinux2010_x86_64.whl</em> <em class="blue">numpy</em>
$ pip <em>install --no-index --find-links</em>=<em class="orange">/tmp/whl/pandas-1.3.3-cp38-cp38-manylinux_2_17_x86_64.manylinux2014_x86_64.whl</em> <em class="blue">pandas</em>
$ pip <em>install --no-index --find-links</em>=<em class="orange">/tmp/whl/python_dateutil-2.8.2-py2.py3-none-any.whl</em> <em class="blue">python_dateutil</em>
$ pip <em>install --no-index --find-links</em>=<em class="orange">/tmp/whl/pytz-2021.3-py2.py3-none-any.whl</em> <em class="blue">pytz</em>
$ pip <em>install --no-index --find-links</em>=<em class="orange">/tmp/whl/six-1.16.0-py2.py3-none-any.whl</em> <em class="blue">six</em>
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-10-14" updated="2021-10-14" %}</div>
### 参照
- [Python公式サイト](https://www.python.org/)
- [PyPI](https://pypi.org/)

### 参考サイト
- [(侍エンジニア) 【Python入門】pipとは？使い方をわかりやすく解説！](https://www.sejuku.net/blog/50417)
- [(GAMMASOFT) pip install を手動でローカルにダウンロードしたファイルで行う方法](https://gammasoft.jp/blog/pip-install-from-local-archives-by-manually/)

{% include goto_pagetop.html %}

{% include footnotes_link.html %}
