Liquid is an open-source template language created by Shopify and written in Ruby.
LiquidはShopify作成のRubyで書かれたテンプレート言語です。Jekyllなどでも使われています。
https://shopify.github.io/liquid/

## フィルター
### size
配列のサイズ(長さ)を調べたり、文字列の文字数を取得したりします。

{{ "abcde" | size }}

↓

5

{% assign my_array = "リンゴ, みかん, もも, 梅" | split: ", " %}
{{ my_array.size }}

↓

4