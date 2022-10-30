---
title: Visual Studio Codeのワークスペース
article_group_id: tips-group
display_order: 50
created: 2022-10-30
updated: 2022-10-30
---

## <a name="index">目次</a><a class="heading-anchor-permalink" href="#目次">§</a>

<ul id="index_ul">
<li><a href="#概要">概要</a></li>
<li><a href="#手順">手順</a></li>
<li><a href="#参考">参考</a></li>
</ul>

* * *
## <a name="概要">概要</a><a class="heading-anchor-permalink" href="#概要">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-30" updated="2022-10-30" %}</div>
Visual Studio Codeでは複数フォルダを一気に開いておいた状態をワークスペースとして管理できます。

{% include goto_pagetop.html %}

* * *
## <a name="手順">手順</a><a class="heading-anchor-permalink" href="#手順">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-30" updated="2022-10-30" %}</div>
### １．まず一つめのフォルダを開く
- エディタを起動し、まずは最初のフォルダが開いた状態にしておきます。

### ２．フォルダをワークスペースに追加
- `ファイル` > `フォルダーをワークスペースに追加...`を選択します。
- フォルダ選択ダイアログが開くので、追加したいフォルダを選択します。
- これで、まったく別々の位置にあるフォルダでも同時に開くことができました。
- さらに`フォルダーをワークスペースに追加`を繰り返すことで複数フォルダを同時に開けます。

### ３．ワークスペースに名前を付けて保存
- `ファイル` > `名前を付けてワークスペースを保存...`を選択します。
- ファイル保存ダイアログが開くので、好きな名前を付けて保存しておきます。
- 拡張子は`.code-workspace`です。長いですね。
- 以降はこのワークスペースファイル(`.code-workspace`)を開くことで、複数フォルダの開いた状態を復元できます。

### ４．ワークスペースを閉じる
- `ファイル` > `ワークスペースを閉じる`を選択します。

### ５．ワークスペースを開く
- `ファイル` > `ワークスペースを開く...`を選択します。
- フォルダ選択ダイアログが開くので、開きたいワークスペースファイル(`.code-workspace`)を選択します。

{% include goto_pagetop.html %}

* * *
## <a name="参考">参考</a><a class="heading-anchor-permalink" href="#参考">§</a>
<div class="chapter-updated">{% include update_info_inline.html created="2022-10-30" updated="2022-10-30" %}</div>
### 参考サイト
- [(JavaDrive) ワークスペースを使って複数のフォルダを同時に開く](https://www.javadrive.jp/vscode/file/index4.html)

{% include goto_pagetop.html %}

{% include articles_common_script.html %}
