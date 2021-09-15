---
chapter_no: 120
chapter_group: 導入
chapter_title: Windows環境にVisual Studio CodeでC言語をインストール
created: 2021-09-15
updated: 2021-09-15
---
### コンパイラ(Mingw-w64)のインストーラのダウンロード
- [(Mingw-w64) Downloads](https://www.mingw-w64.org/downloads/)
- `Win Builds`をダウンロードしろと言われるので、ダウンロードする

### コンパイラ(Mingw-w64)のインストール
- `Win Builds`で`gcc`をインストール。
  - 途中、Architectureは`x86_64`(64bit版)を選択。
- インストールが終わったら、`<インストールしたフォルダ>\bin`に`Path`を通す。

### 動作確認
- `PowerShell`や`コマンドプロンプト`を立ち上げて、`gcc -v`と入力し、バージョンが表示されればOK。
```output:gcc -vを実行
PS C:\Users\fumo> gcc -v
Reading specs from c:/tools/win-builds2/bin/../lib64/gcc/x86_64-w64-mingw32/4.8.3/specs
COLLECT_GCC=C:\tools\Win-builds2\bin\gcc.exe
COLLECT_LTO_WRAPPER=c:/tools/win-builds2/bin/../libexec/gcc/x86_64-w64-mingw32/4.8.3/lto-wrapper.exe
Target: x86_64-w64-mingw32
Configured with: ../gcc-4.8.3/configure --prefix=/opt/windows_64 --with-sysroot=/opt/windows_64 --libdir=/opt/windows_64/lib64 --mandir=/opt/windows_64/man --infodir=/opt/windows_64/info --enable-shared --disable-bootstrap --disable-multilib --enable-threads=posix --enable-languages=c,c++ --enable-checking=release --enable-libgomp --with-system-zlib --with-python-dir=/lib64/python2.7/site-packages --disable-libunwind-exceptions --enable-__cxa_atexit --enable-libssp --with-gnu-ld --verbose --enable-java-home --with-java-home=/opt/windows_64/lib64/jvm/jre --with-jvm-root-dir=/opt/windows_64/lib64/jvm --with-jvm-jar-dir=/opt/windows_64/lib64/jvm/jvm-exports --with-arch-directory=amd64 --with-antlr-jar='/home/adrien/projects/win-builds-1.5/slackware64-current/d/gcc/antlr-*.jar' --disable-java-awt --disable-gtktest --build=x86_64-slackware-linux --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32
Thread model: posix
gcc version 4.8.3 (GCC)
PS C:\Users\fumo>
```
- こんなのが出ればOK。

### VSCodeに「C/C++機能拡張」を導入
- 拡張機能(Ctrl + Shift + X)で、「C」と入力して検索し、Microsoft制の「C/C++」をインストールする

### VSCodeに「Code Runner」を導入する
- 拡張機能(Ctrl + Shift + X)で、「Code Runner」と入力して検索し、Jun Hanさんの制の「Code Runner」をインストールする。
{% comment %}
- `Code Runner`の設定を開き、`Code-runner: Executor Map`を`settings.jsonで編集`をクリックする。
この設定、なくても動く

- `"code-runner.executorMap"`の`"c"`に`-fexec-charset=CP932`を追加する
```:編集前
"c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
```
```:編集後
"c": "cd $dir && gcc {em{-fexec-charset=CP932}em} $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
```
{% endcomment %}
- `Code-runner: Run in Terminal`の`Whether to run code in integrated Terminal.`にチェックを付ける。

### 動作確認
ソースを作成し右上の`再生ボタン`で実行。
```:hello2.c (SJISにて作成)
#include <stdio.h>
int main(void)
{
    printf("こんにちは！C言語\n");
    return 0;
}
```

```output:出力結果
PS C:\workspace\gcc> cd "c:\workspace\gcc\" ; if ($?) { gcc hello2.c -o hello2 } ; if ($?) { .\hello2 }
こんにちは！C言語
```

### 参考サイト
- [(電脳産物) WindowsにC言語開発環境 Mingw-w64（gccコンパイラ）を導入する](https://dianxnao.com/windows%e3%81%abc%e8%a8%80%e8%aa%9e%e9%96%8b%e7%99%ba%e7%92%b0%e5%a2%83-mingw-w64%ef%bc%88gcc%e3%82%b3%e3%83%b3%e3%83%91%e3%82%a4%e3%83%a9%ef%bc%89%e3%82%92%e5%b0%8e%e5%85%a5%e3%81%99%e3%82%8b/)
- [(電脳産物) Visual Studio CodeでC言語プログラミングを始める（Windows編）](https://dianxnao.com/visual-studio-code%E3%81%A7c%E8%A8%80%E8%AA%9E%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E3%82%92%E5%A7%8B%E3%82%81%E3%82%8B%EF%BC%88windows%E7%B7%A8%EF%BC%89/)
