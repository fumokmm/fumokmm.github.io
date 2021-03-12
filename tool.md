---
layout: default_layout
title: ツールのページ
created: 2021-01-15
updated: 2021-03-12
---
ツールのページです。

- - -
## <a name="index">目次</a>

- [コードPRE用HTML変換](#code-box)
- [テーブルHTML生成](#table-html)
- [スネークケースに変換](#snake-case)
- [ケバブケースに変換](#kebab-case)

- - -

## <a name="code-box">コードPRE用HTML変換</a>

<table>
    <tr>
        <th>変換前</th>
        <th></th>
        <th>変換後</th>
    </tr>
    <tr>
        <td>
            <textarea id="CodeBoxConvertBefore" rows="20" cols="80"></textarea>
        </td>
        <td>
            <table style="border: 0px;">
                <tr><td style="border: 0px;"><input type="button" id="CodeBoxConvertBtn" value="変換 -&gt;"></td></tr>
                <tr><td style="border: 0px;"><input type="button" id="CodeBoxClearBtn" value="クリア"></td></tr>
            </table>
        </td>
        <td>
            <textarea id="CodeBoxConvertAfter" rows="20" cols="80"></textarea>
        </td>
    </tr>
</table>

## <a name="table-html">テーブルHTML生成</a>

<table>
    <tr>
        <th>変換前</th>
        <th></th>
        <th>変換後</th>
    </tr>
    <tr>
        <td>
            <textarea id="TableHtmlConvertBefore" rows="20" cols="80"></textarea>
        </td>
        <td>
            <table style="border: 0px;">
                <tr><td style="border: 0px;"><input type="button" id="TableHtmlConvertBtn" value="変換 -&gt;"></td></tr>
                <tr><td style="border: 0px;"><input type="button" id="TableHtmlClearBtn" value="クリア"></td></tr>
            </table>
        </td>
        <td>
            <textarea id="TableHtmlConvertAfter" rows="20" cols="80"></textarea>
        </td>
    </tr>
</table>


## <a name="snake-case">スネークケースに変換</a>

<table>
    <tr>
        <th>変換前</th>
        <th></th>
        <th>変換後</th>
    </tr>
    <tr>
        <td>
            <textarea id="SnakeCaseConvertBefore" rows="20" cols="80"></textarea>
        </td>
        <td>
            <table style="border: 0px;">
                <tr><td style="border: 0px;"><input type="button" id="SnakeCaseConvertBtn" value="変換 -&gt;"></td></tr>
                <tr><td style="border: 0px;"><input type="button" id="SnakeCaseClearBtn" value="クリア"></td></tr>
            </table>
        </td>
        <td>
            <textarea id="SnakeCaseConvertAfter" rows="20" cols="80"></textarea>
        </td>
    </tr>
</table>

## <a name="kebab-case">ケバブケースに変換</a>

<table>
    <tr>
        <th>変換前</th>
        <th></th>
        <th>変換後</th>
    </tr>
    <tr>
        <td>
            <textarea id="KebabCaseConvertBefore" rows="20" cols="80"></textarea>
        </td>
        <td>
            <table style="border: 0px;">
                <tr><td style="border: 0px;"><input type="button" id="KebabCaseConvertBtn" value="変換 -&gt;"></td></tr>
                <tr><td style="border: 0px;"><input type="button" id="KebabCaseClearBtn" value="クリア"></td></tr>
            </table>
        </td>
        <td>
            <textarea id="KebabCaseConvertAfter" rows="20" cols="80"></textarea>
        </td>
    </tr>
</table>

<script>
document.getElementById('CodeBoxConvertBtn').addEventListener('click', () => {
    let before = document.getElementById('CodeBoxConvertBefore');
    let after = document.getElementById('CodeBoxConvertAfter');
    after.value = before.value.replace(/&/g, '&amp;')
                              .replace(/\</g, '&lt;')
                              .replace(/\>/g, '&gt;');
}, false);

document.getElementById('CodeBoxClearBtn').addEventListener('click', () => {
    let after = document.getElementById('CodeBoxConvertAfter');
    after.value = '';
}, false);


document.getElementById('TableHtmlConvertBtn').addEventListener('click', () => {
    let before = document.getElementById('TableHtmlConvertBefore');
    let after = document.getElementById('TableHtmlConvertAfter');
    let lines = before.value.split(/\r?\n/);
    after.value = '';
    after.value += '<table>\n';
    for (let i = 0; i < lines.length; i++) {
        after.value += '\t<tr>\n';
        let columns = lines[i].split(/\t/);
        columns.forEach(col => {
            if (i == 0) {
                after.value += '\t\t<th>' + col + '</th>\n';
            } else {
                after.value += '\t\t<td>' + col + '</td>\n';
            }
        });
        after.value += '\t</tr>\n';
    }
    after.value += '</table>';
}, false);

document.getElementById('TableHtmlClearBtn').addEventListener('click', () => {
    let after = document.getElementById('TableHtmlConvertAfter');
    after.value = ''
}, false);

document.getElementById('SnakeCaseConvertBtn').addEventListener('click', () => {
    let before = document.getElementById('SnakeCaseConvertBefore');
    let after = document.getElementById('SnakeCaseConvertAfter');
    let lines = before.value.split(/\r?\n/);
    after.value = '';
    for (let i = 0; i < lines.length; i++) {
        after.value += lines[i].toLowerCase().replace(/\s/g, '_');
        after.value += '\n';
    }
}, false);

document.getElementById('SnakeCaseClearBtn').addEventListener('click', () => {
    let after = document.getElementById('SnakeCaseConvertAfter');
    after.value = '';
}, false);

document.getElementById('KebabCaseConvertBtn').addEventListener('click', () => {
    let before = document.getElementById('KebabCaseConvertBefore');
    let after = document.getElementById('KebabCaseConvertAfter');
    let lines = before.value.split(/\r?\n/);
    after.value = '';
    for (let i = 0; i < lines.length; i++) {
        after.value += lines[i].toLowerCase().replace(/\s/g, '-');
        after.value += '\n';
    }
}, false);

document.getElementById('KebabCaseClearBtn').addEventListener('click', () => {
    let after = document.getElementById('KebabCaseConvertAfter');
    after.value = '';
}, false);

</script>