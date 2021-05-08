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