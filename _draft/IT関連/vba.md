VBAでURLデコード url_decode　のアップデート
https://www.benricho.org/moji_conv/16-URLencode_UTF-8.html
を参考に。


定数とリテラルのデータ型 (Visual Basic)
https://docs.microsoft.com/ja-jp/dotnet/visual-basic/programming-guide/language-features/constants-enums/constant-and-literal-data-types

VBAでFunctionとProperty Getを使い分ける理由
https://www.excel-chunchun.com/entry/20210307-vba-function-propertyget


Excel VBA Wordを操作する主なプロパティとメソッド
https://kosapi.com/post-3986/


メモ「VBAでWordのワイルドカードを使って置換するときの注意点」用
検索と置換のマクロを改造する場合の注意点
https://ameblo.jp/gidgeerock/entry-11129851651.html
→
    .MatchFuzzy = False
    .MatchWildcards = True
    つまり、問題を回避するための考え方は以下の通りになります。
    まず、オフにする条件に対応するプロパティをFalseにする
    その後、オンにする条件に対応するプロパティをTrueにする
