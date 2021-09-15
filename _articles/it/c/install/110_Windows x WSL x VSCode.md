---
chapter_no: 110
chapter_group: 導入
chapter_title: Windows環境(WSL)にVisual Studio CodeでC言語をインストール
created: 2021-09-14
updated: 2021-09-14
---
### コンパイラ(gcc)
インストール済み。  
```output:gcc -vを実行
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
```
- ターミナルで`gcc -v`を実行し、こんなのが出ればOK。

### VSCodeに「C/C++機能拡張」を導入
- 拡張機能(Ctrl + Shift + X)で、`C`と入力して検索し、Microsoft制の`C/C++`をインストールする

### VSCodeに「Code Runner」を導入する
- 拡張機能(Ctrl + Shift + X)で、`Code Runner`と入力して検索し、`Jun Han`さんの制の`Code Runner`をインストールする。
- `Code Runner`の設定を開き、`Code-runner: Executor Map`を`settings.jsonで編集`をクリックする。
- `Code-runner: Run in Terminal`の`Whether to run code in integrated Terminal.`にチェックを付ける。

### 動作確認
ソースを作成し右上の`再生ボタン`で実行。
```:hello.c
#include <stdio.h>
int main(void)
{
    printf("こんにちは！C言語\n");
    return 0;
}
```

```output:出力結果
$ cd "/mnt/c/workspace/gcc/" && gcc tempCodeRunnerFile.c -o tempCodeRunnerFile && "/mnt/c/workspace/gcc/"tempCodeRunnerFile
こんにちは！C言語
```

### 参考サイト
- [(電脳産物) Visual Studio CodeでC言語プログラミングを始める（Windows編）](https://dianxnao.com/visual-studio-code%E3%81%A7c%E8%A8%80%E8%AA%9E%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E3%82%92%E5%A7%8B%E3%82%81%E3%82%8B%EF%BC%88windows%E7%B7%A8%EF%BC%89/)
