---
chapter_no: 70
chapter_title: マクロ(Velocimacro)
created: 2022-10-26
updated: 2022-10-26
---
### Velocimacroとは
`Velocimacro`とは`Velocity`で定義できるマクロのことです。たぶん読み方は「べろしまくろ」。[^impacted-name]  
関数のようなものです。  
`#xxx`の`xxx`の部分の名前を自由に定義できます。

[^impacted-name]: インパクトのある名前である。

### Velocimacroの定義
Velocimacroを定義するには、vmファイル内に#macro指示子を使って次のような形で記述します。
```syntax
{em{#macro(}em} {em:blue{<マクロ名>}em} {em:orange{$arg1, $arg2, ..}em}{em{)}em} [ VTLコード.. ] {em{#end}em}
```
- `$arg1`, `$arg2`の部分は引数です。
- `<マクロ名>`の部分がマクロ名になります。

### Velocimacroの読み込み
`Velocimacro`として読み込むファイルのパスを`velocity.properties`に指定します。
```:例：velocity.properties
velocimacro.library = /macro/webparts.vm, /macro/test.vm
```
- この例では、`/macro`ディレクトリにある`webparts.vm`というファイルと`test.vm`というファイルをマクロとして読み込みます。

### 使用例
```:マクロ(helloWorld)の定義
#macro({em{helloWorld}em} $name, $age)
  こんにちは！私の名前は<b>$name</b>、<b>$age</b>歳です。仲良くしてね。
#end
```

```:helloWorldの使用例
{em{#helloWorld}em}("さとう", 100)
```

```:出力結果
こんにちは！私の名前は<b>さとう</b>、<b>100</b>歳です。
```

### 参考サイト
- [(TECHSCORE) 6. Velocimacro](https://www.techscore.com/tech/Java/ApacheJakarta/Velocity/6/)