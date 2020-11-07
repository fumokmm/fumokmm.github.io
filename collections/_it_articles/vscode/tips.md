---
title: VSCodeのTips
display_order: 900
created: 2020-09-16
updated: 2020-09-28
---
ここではVSCodeのちょっとしたTipsをまとめておきます。

## <a name="index">目次</a>

- [選択内容を次々に拡張](#selection-next-match)
- [矩形選択](#rectangular-selection)

### <a name="selection-next-match">選択内容を次々に拡張</a>
{% include update_info.html created="2020-09-16" updated="2020-09-16" %}

1. 部分選択をする
1. `Ctrl + D` で選択部分の次のマッチに拡張
1. `Ctrl + U` を押すと一旦戻るので
1. `Ctrl + K`, `Ctrl + D` すると、次のマッチを一つスキップしてその次を選択
1. `Ctrl + F2` で選択部分を一気に全てマッチに拡張

#### <a name="selection-next-match-reference">参考</a>

- [(YouTube) Microsoft Visual Studio Code Multiple Cursors - Multi Selection](https://www.youtube.com/watch?v=VKamRYAytBM)
- [(Qiita) VS Code の便利なショートカットキー](https://qiita.com/12345/items/64f4372fbca041e949d0)
- [(Qiita) 【Windows版】VS Code キーボードショートカット一覧 （オススメ付き）](https://qiita.com/TakahiRoyte/items/cdab6fca64da386a690b)


### <a name="rectangular-selection">矩形選択</a>
{% include update_info.html created="2020-09-28" updated="2020-09-28" %}

- `Shift + Alt` を押しながらマウスで選択

または

- `Ctrl + Shift + Alt + ↑`
- `Ctrl + Shift + Alt + →`
- `Ctrl + Shift + Alt + ↓`
- `Ctrl + Shift + Alt + ←`

#### <a name="rectangular-selection-reference">参考</a>

- [VS Code：マウスまたはキーボードで矩形選択する方法](https://motamemo.com/vscode/vscode-tips/rectangle-selection/)
