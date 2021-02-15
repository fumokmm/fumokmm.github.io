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
- [テーブルHTML生成](#table-html)

- - -

## <a name="code-box">コードPRE用HTML変換</a>

変換前
<textarea id="CodeBoxConvertBefore" rows="4" cols="40">
</textarea>

変換後
<textarea id="CodeBoxConvertAfter" rows="4" cols="40">
</textarea>

## <a name="table-html">テーブルHTML生成</a>

変換前
<textarea id="TableHtmlConvertBefore" rows="4" cols="40">
</textarea>

変換後
<textarea id="TableHtmlConvertAfter" rows="4" cols="40">
</textarea>

<script>
document.getElementById('CodeBoxConvertBefore').addEventListener('change', () => {
    let before = document.getElementById('CodeBoxConvertBefore');
    let after = document.getElementById('CodeBoxConvertAfter');
    after.value = before.value.replace(/&/g, '&amp;')
                              .replace(/\</g, '&lt;')
                              .replace(/\>/g, '&gt;');
}, false);

document.getElementById('TableHtmlConvertBefore').addEventListener('change', () => {
    let before = document.getElementById('TableHtmlConvertBefore');
    let after = document.getElementById('TableHtmlConvertAfter');
    let lines = before.value.split(/\r?\n/);
    after.innerHTML = '';
    after.innerHTML += '<table>\n';
    for (let i = 0; i < lines.length; i++) {
        after.innerHTML += '\t<tr>\n';
        let columns = lines[i].split(/\t/);
        columns.forEach(col => {
            if (i == 0) {
                after.innerHTML += '\t\t<th>' + col + '</th>\n';
            } else {
                after.innerHTML += '\t\t<td>' + col + '</td>\n';
            }
        });
        after.innerHTML += '\t</tr>\n';
    }
    after.innerHTML += '</table>';
}, false);
</script>