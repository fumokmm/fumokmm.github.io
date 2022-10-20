---
title: Windows環境(WSL)にVisual Studio CodeでC言語をインストール
article_group_id: getting-started-group
display_order: 20
created: 2021-09-14
updated: 2021-09-16
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#コンパイラ(gcc)">コンパイラ(gcc)</a></li>
<li><a href="#VSCodeに拡張機能を導入">VSCodeに拡張機能を導入</a></li>
<li><a href="#動作確認">動作確認</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="コンパイラ(gcc)">コンパイラ(gcc)</a><a class="heading-anchor-permalink" href="#コンパイラ(gcc)">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-14" updated="2021-09-16" %}</div>
### コンパイラ(gcc)のインストール
インストール済み。  

### 動作確認
ターミナルで`gcc -v`を実行。
<div class="code-box-output">
<div class="title">gcc -vを実行</div>
<div class="copy-button">Copy</div>
<pre>
$ gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/9/lto-wrapper
\\OFFLOAD_TARGET_NAMES=nvptx-none:hsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu 9.3.0-17ubuntu1~20.04' --with-bugurl=file:///usr/share/doc/gcc-9/README.Bugs --enable-languages=c,ada,c++,go,brig,d,fortran,objc,obj-c++,gm2 --prefix=/usr --with-gcc-major-version-only --program-suffix=-9 --program-prefix=x86_64-linux-gnu- --enable-shared --enable-linker-build-id --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --libdir=/usr/lib --enable-nls --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-gnu-unique-object --disable-vtable-verify --enable-plugin --enable-default-pie --with-system-zlib --with-target-system-zlib=auto --enable-objc-gc=auto --enable-multiarch --disable-werror --with-arch-32=i686 --with-abi=m64 --with-multilib-list=m32,m64,mx32 --enable-multilib --with-tune=generic --enable-offload-targets=nvptx-none=/build/gcc-9-HskZEa/gcc-9-9.3.0/debian/tmp-nvptx/usr,hsa --without-cuda-driver --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04) 
</pre>
</div>
- こんなのが出ればOK。

{% include goto_pagetop.html %}

* * *
## <a name="VSCodeに拡張機能を導入">VSCodeに拡張機能を導入</a><a class="heading-anchor-permalink" href="#VSCodeに拡張機能を導入">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-14" updated="2021-09-16" %}</div>
### C/C++機能拡張
- 拡張機能(Ctrl + Shift + X)で、`C`と入力して検索し、Microsoft制の`C/C++`をインストールする

### Code Runner
- 拡張機能(Ctrl + Shift + X)で、`Code Runner`と入力して検索し、`Jun Han`さんの制の`Code Runner`をインストールする。
{% comment %}
この設定、なくても動く
- `Code Runner`の設定を開き、`Code-runner: Executor Map`を`settings.jsonで編集`をクリックする。
{% endcomment %}
- `Code-runner: Run in Terminal`の`Whether to run code in integrated Terminal.`にチェックを付ける。

{% include goto_pagetop.html %}

* * *
## <a name="動作確認">動作確認</a><a class="heading-anchor-permalink" href="#動作確認">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-14" updated="2021-09-16" %}</div>
ソースを作成し右上の`再生ボタン`で実行。
<div class="code-box">
<div class="title">hello.c</div>
<div class="copy-button">Copy</div>
<pre>
#include &lt;stdio.h&gt;
int main(void)
{
    printf("こんにちは！C言語\n");
    return 0;
}
</pre>
</div>

<div class="code-box-output">
<div class="title">出力結果</div>
<div class="copy-button">Copy</div>
<pre>
$ cd "/mnt/c/workspace/gcc/" &amp;&amp; gcc tempCodeRunnerFile.c -o tempCodeRunnerFile &amp;&amp; "/mnt/c/workspace/gcc/"tempCodeRunnerFile
こんにちは！C言語
</pre>
</div>

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2021-09-14" updated="2021-09-16" %}</div>
### 参考サイト
- [(電脳産物) Visual Studio CodeでC言語プログラミングを始める（Windows編）](https://dianxnao.com/visual-studio-code%E3%81%A7c%E8%A8%80%E8%AA%9E%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E3%82%92%E5%A7%8B%E3%82%81%E3%82%8B%EF%BC%88windows%E7%B7%A8%EF%BC%89/)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
