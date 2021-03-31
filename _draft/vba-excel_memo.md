エクセルVBAでクラスのインスタンス生成時に初期データを格納するメソッドを作る方法
https://tonari-it.com/excel-vba-class-constructor/

第56回.Rangeオブジェクト（RangeとCells）
https://excel-ubara.com/excelvba1/EXCELVBA356.html

Using R1C1 in VB to select a range
https://www.excelforum.com/excel-programming-vba-macros/494291-using-r1c1-in-vb-to-select-a-range.html

A1参照形式、R1C1参照形式の設定・取得（ReferenceStyle プロパティ）
https://excelwork.info/excel/referencestyle/

R1C1参照形式
https://kabu-macro.com/detail.php?dir=word&dir2=a-z&uri=r1c1_sansyou#:~:text=R1C1%E5%8F%82%E7%85%A7%E5%BD%A2%E5%BC%8F%E3%81%A8%E3%81%AF,%E7%95%AA%E5%8F%B7%E3%82%92%E6%8C%87%E5%AE%9A%E3%81%97%E3%81%BE%E3%81%99%E3%80%82&text=%E3%81%97%E3%81%8B%E3%81%97%E3%80%81%E3%83%9E%E3%82%AF%E3%83%AD%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%81%9F,%E5%BD%A2%E5%BC%8F%E3%81%A7%E8%A1%A8%E7%A4%BA%E3%81%95%E3%82%8C%E3%81%BE%E3%81%99%E3%80%82

HYPERLINK関数の使い方:Excel関数
http://www.eurus.dti.ne.jp/~yoneyama/Excel/kansu/hyperlink.htm

4.5 インターフェース継承による開発
https://sites.google.com/site/compositiosystemae/home/vbaworld/upper/interface

VBAシステム開発
https://sites.google.com/site/compositiosystemae/home

Excelで強制的に再計算させるには
https://stabucky.com/wp/archives/1998

ENCODEURL関数で文字列をURLエンコードする
https://dekiru.net/article/4482/

Is there a formula to decode URL's?
https://www.excelforum.com/excel-formulas-and-functions/1017416-is-there-a-formula-to-decode-urls.html

URLデコードを行う
https://www.relief.jp/docs/003799.html


# On Error Resumeのあたりの話
- `On Error Resume Next` すると、エラーが発生したらその行の次の行から処理が実行される
- `On Error Goto 0` すると、エラーハンドリングが解除される (0ってのがイケてない…)
- `On Error Goto <ラベル>` で`<ラベル>`にジャンプした後、`Resume Next` すると、跳び元の行の次の行から処理が続行される
  - `<ラベル>`の中でエラー状況の復帰処理を書いて、その後戻ってくる感じ

### 参考
- [(Office TANAKA) エラーに負けない](http://officetanaka.net/excel/vba/tips/tips104.htm)
- [(Office TANAKA) On Error](http://officetanaka.net/excel/vba/statement/OnError.htm)
- [(Microsoft \| Docs) On Error statement](https://docs.microsoft.com/en-us/office/vba/language/reference/user-interface-help/on-error-statement)

