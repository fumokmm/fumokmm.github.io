---
layout: default_layout
title: ツールのページ
created: 2021-01-15
updated: 2021-01-15
---
ツールのページです。

- - -
## <a name="index">目次</a>

- [コードPRE用HTML変換](#code-box)

- - -

## <a name="code-box">コードPRE用HTML変換</a>

変換前
<textarea id="convertBefore" rows="4" cols="40">
</textarea>

変換後
<textarea id="convertAfter" rows="4" cols="40">
</textarea>

<script>
document.getElementById('convertBefore').addEventListener('change', () => {
    let before = document.getElementById('convertBefore');
    let after = document.getElementById('convertAfter');
    after.innerText = before.value.replace(/&/g, '&amp;')
                                  .replace(/\</g, '&lt;')
                                  .replace(/\>/g, '&gt;');
}, false);
</script>