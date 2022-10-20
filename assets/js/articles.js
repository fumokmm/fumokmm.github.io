"use strict";

function initializeArticlesCommonScript() {
    // 注釈部の初期化
    document.addEventListener("DOMContentLoaded", () => { // DOMの読み込みが完了したら
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

    // コピーボタンの初期化
    document.addEventListener("DOMContentLoaded", () => { // DOMの読み込みが完了したら
        let body = document.querySelector("body");
        let active = [];
        body.addEventListener("click", (e) => {
            try {
                const target = e.target;
                if (! target.classList.contains('copy-button')) return;

                const pre = (() => {
                    let pres = target.parentElement.getElementsByTagName('pre')
                    return (pres && pres[0]) ? pres[0] : undefined;
                })();
                let result = false;
                if (active.indexOf(target) !== -1) return;
                if (pre) {
                    result = copyToClipboard(pre);
                    target.innerText = (result ? "Copied!" : "Failed!");
                    target.classList.add((result ? "success" : "failed"));
                    active.push(target);
                    setTimeout(() => {
                        let index = active.indexOf(target);
                        target.className = "copy-button";
                        target.innerText = "Copy";
                        if (index !== -1) active.splice(index, 1);
                    }, 1000);
                }
            } catch (e) {
                //error 
            }
        });
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
