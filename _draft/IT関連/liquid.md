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


Liquid
https://shopify.github.io/liquid/
Types
Iteration
Variable
のあたり


index表記[]使えるのか使えないのかよくわからん
(Liquid) Getting product by index of collection
https://community.shopify.com/c/Shopify-Design/Liquid-Getting-product-by-index-of-collection/td-p/203987


Jekyll/Liquid assign boolean issues
http://dfolio.free.fr/articles/2018/12/liquid-assign-boolean/
