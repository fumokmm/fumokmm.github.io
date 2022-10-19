"use strict";

function addFootnotesLink() {
    // DOMの読み込みが完了したら
    document.addEventListener("DOMContentLoaded", () => {
        // 注釈部を取得
        let footnotes = document.querySelector('div.footnotes');
        // 注釈部が存在する場合、注釈部へのアンカーを追加
        if (footnotes) {
            let footnoteAnchor = document.createElement('a');
            footnoteAnchor.setAttribute('name', 'footnotes');
            footnotes.insertBefore(footnoteAnchor, footnotes.firstElementChild);

            let indexUl = document.getElementById('index_ul');
            let toFootnoteLi = document.createElement('li');
            let toFootnoteA = document.createElement('a');
            toFootnoteLi.appendChild(toFootnoteA);
            toFootnoteA.setAttribute('href', '#footnotes');
            toFootnoteA.appendChild(document.createTextNode('注釈')); 
            indexUl.appendChild(toFootnoteLi);
        }
    });
}

// 参考) http://urbanqee.com/html/clipboard/clipboard-copybutton-on-pre-code-tag.html
/**
 * コピーボタン追加および文字列のクリップボードにコピー プラグイン
 * querySelector等で取得した要素（element)を渡すと、
 * その要素の文字列をクリップボードにコピーします。
 * ユーザーが事前に選択していた内容には影響を与えません。
 * 戻り値はコピーが成功したかどうか（true/false)
 */
function copyToClipboard(element) {
    let ranges = [];
    let selection = window.getSelection();
    let range = document.createRange();
    let result = false;
    for (let i = 0; i < selection.rangeCount; i++) {
        ranges[i] = selection.getRangeAt(i);
    }
    range.selectNodeContents(element);
    selection.removeAllRanges();
    selection.addRange(range);
    result = document.execCommand("copy");
    selection.removeAllRanges();
    for (let i = 0; i < ranges.length; i++) {
        selection.addRange(ranges[i]);
    }
    return result;
}
