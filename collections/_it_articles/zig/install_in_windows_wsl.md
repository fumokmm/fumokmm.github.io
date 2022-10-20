---
title: Windows環境(WSL)にZigをインストール
article_group_id: getting-started-group
display_order: 10
created: 2022-08-24
updated: 2022-08-24
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#UbuntuにZigをインストール">UbuntuにZigをインストール</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="UbuntuにZigをインストール">UbuntuにZigをインストール</a><a class="heading-anchor-permalink" href="#UbuntuにZigをインストール">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-24" updated="2022-08-24" %}</div>
- ZigをUbuntuにインストールする際の手順をメモしておきます。

手順は[このあたり](https://ziglang.org/learn/getting-started/#installing-zig)を参考にしました。

### 1. バイナリをダウンロード
[こちら](https://ziglang.org/download/)より。
<div class="code-box no-title">
<div class="copy-button">Copy</div>
<pre>
zig-linux-x86_64-0.10.0-dev.3685+dae7aeb33.tar.xz
</pre>
</div>
Ubuntuに入れるので、上記をダウンロード。

### 2. パスを通す
1でダウンロードしてきたバイナリを展開し、パスを通します。  
展開先は任意です。
<div class="code-box">
<div class="title">~/.bashrc</div>
<div class="copy-button">Copy</div>
<pre>
# zig
export ZIG_HOME="/mnt/c/tools/Zig/zig-linux-x86_64-0.10.0-dev.3685+dae7aeb33"
export PATH="$ZIG_HOME:$PATH"
</pre>
</div>
上記を`~/.bashrc`追記して保存し再読み込みします。

<div class="code-box-output">
<div class="title">再読み込み</div>
<div class="copy-button">Copy</div>
<pre>
$ source ~/.bashrc
</pre>
</div>

### Zigを実行
任意のディレクトリへ移動し、`zig init-exe`を実行します。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ mkdir hello-world
$ cd hello-world
$ <em>zig init-exe</em>
</pre>
</div>

すると、こんな出力が行われます。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
info: Created build.zig
info: Created src/main.zig
info: Next, try `zig build --help` or `zig build run`
</pre>
</div>

`src`ディレクトリが作成され、その中に`main.zig`というファイルが生成されます。
<div class="code-box">
<div class="title">main.zig</div>
<div class="copy-button">Copy</div>
<pre>
const std = @import("std");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
</pre>
</div>

実行するには、`zig build run`とするようです。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ zig build run
<em>All your codebase are belong to us.
Run `zig build test` to run the tests.</em>
</pre>
</div>
動いた。

ちなみに、`zig-out/bin`というディレクトリにバイナリファイルが出来ているので、直接実行することも可能です。
<div class="code-box-output no-title">
<div class="copy-button">Copy</div>
<pre>
$ cd zig-out/bin
$ ./hello-world
<em>All your codebase are belong to us.
Run `zig build test` to run the tests.</em>
</pre>
</div>
動いた。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-08-24" updated="2022-08-24" %}</div>
### 参照サイト
- [Zig (公式)](https://ziglang.org/)
- [Installing Zig (公式)](https://ziglang.org/learn/getting-started/#installing-zig)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
