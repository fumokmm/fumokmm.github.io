---
chapter_no: 10
chapter_title: コンパイラ(gcc)
created: 2021-09-16
updated: 2021-09-16
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
