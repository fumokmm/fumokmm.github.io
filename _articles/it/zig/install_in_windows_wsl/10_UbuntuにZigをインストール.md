---
chapter_no: 10
chapter_title: UbuntuにZigをインストール
created: 2022-08-24
updated: 2022-08-24
---
- ZigをUbuntuにインストールする際の手順をメモしておきます。

手順は[このあたり](https://ziglang.org/learn/getting-started/#installing-zig)を参考にしました。

### 1. バイナリをダウンロード
[こちら](https://ziglang.org/download/)より。
```
zig-linux-x86_64-0.10.0-dev.3685+dae7aeb33.tar.xz
```
Ubuntuに入れるので、上記をダウンロード。

### 2. パスを通す
1でダウンロードしてきたバイナリを展開し、パスを通します。  
展開先は任意です。
```:~/.bashrc
# zig
export ZIG_HOME="/mnt/c/tools/Zig/zig-linux-x86_64-0.10.0-dev.3685+dae7aeb33"
export PATH="$ZIG_HOME:$PATH"
```
上記を`~/.bashrc`追記して保存し再読み込みします。

```output:再読み込み
$ source ~/.bashrc
```

### Zigを実行
任意のディレクトリへ移動し、`zig init-exe`を実行します。
```output
$ mkdir hello-world
$ cd hello-world
$ {em{zig init-exe}em}
```

すると、こんな出力が行われます。
```output
info: Created build.zig
info: Created src/main.zig
info: Next, try `zig build --help` or `zig build run`
```

`src`ディレクトリが作成され、その中に`main.zig`というファイルが生成されます。
```:main.zig
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
```

実行するには、`zig build run`とするようです。
```output
$ zig build run
{em{All your codebase are belong to us.
Run `zig build test` to run the tests.}em}
```
動いた。

ちなみに、`zig-out/bin`というディレクトリにバイナリファイルが出来ているので、直接実行することも可能です。
```output
$ cd zig-out/bin
$ ./hello-world
{em{All your codebase are belong to us.
Run `zig build test` to run the tests.}em}
```
動いた。
