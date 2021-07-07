---
chapter_no: 4
chapter_title: 変更の退避(stash)
created: 2021-06-20
updated: 2021-06-20
---
```:変更を退避する
git {em:blue{stash push}em}
または
git {em:blue{stash}em}
```
- コミットされていない変更が退避されます。(`add`したものとしていないものが含まれる)

```:変更を退避するとき、addしたものは退避しない
git {em:blue{stash push}em} {em:command{-k}em}
または
git {em:blue{stash push}em} {em:command{--keep-index}em}
```

```:変更を退避するとき、新規作成されたファイルも一緒に退避する
git {em:blue{stash push}em} {em:command{-u}em}
または
git {em:blue{stash push}em} {em:command{--include-untracked}em}
```

```:変更を退避するときにメッセージも付けて退避する
git {em:blue{stash push}em} {em:command{-m}em} {em{"メッセージ"}em}
```

```:退避した作業の一覧を見る
git {em:blue{stash list}em}
```

```:退避した作業を戻す
git {em:blue{stash apply}em} {em{<スタッシュ名>}em}
```
- `<stash名>`は`git stash list`で見た時に出てくる`stash@{0}`のようなものです。
- `apply`すると、`add`していた変更も`add`されていない状態で戻ります。

```:退避した作業をaddした状態のまま戻す
git {em:blue{stash apply}em} {em{<スタッシュ名>}em} {em:command{--index}em}
```
- `add`した状態のまま戻したい場合は、`apply`するときに`--index`を付けます。

```:退避した作業を消す
git {em:blue{stash drop}em} {em{<スタッシュ名>}em}
```

```:退避した作業をすべて消す
git {em:blue{stash clear}em}
```

```:退避した作業を元に戻すと同時に、stashのリストからも消す
git {em:blue{stash pop}em} {em{<スタッシュ名>}em}
```
- `apply`してから`drop`するのと同じです。

```:退避した変更のファイル一覧を見る
git {em:blue{stash show}em} {em{<スタッシュ名>}em}
```

```:退避した変更の詳細を見る
git {em:blue{stash show}em} {em{<スタッシュ名>}em} {em:command{-P}em}
```

### 参考
- [Git - git-stash Documentation](https://git-scm.com/docs/git-stash)
- [(Qiita) 【git stash】コミットはせずに変更を退避したいとき](https://qiita.com/chihiro/items/f373873d5c2dfbd03250)
- [(サル先生のGit入門) Stash](https://backlog.com/ja/git-tutorial/reference/stash/)
