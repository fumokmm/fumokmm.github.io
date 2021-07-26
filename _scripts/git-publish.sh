#!/usr/bin/env bash

if [[ $# -eq 0 ]]
then
    echo 第一引数で新しく付けるタグ名を指定して下さい。
    exit 1
else
    tag_name=$1
fi

# 続行を求める
read -p "Your input tag name is [$tag_name], ok? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac

# ブランチ名のチェック用にブランチ名を取得
branch=`git status | head -1`

# ブランチ名がmain以外は処理を中断
if [[ $branch == *main ]]
then
    # 現在のコミットにタグを付与
    git tag $tag_name -f
    # originにmainをpush
    git push origin main
    # originに上記で付与したタグもpush
    git push origin $tag_name -f
else
    echo ブランチがmainではありません。
    exit 1
fi

exit 0
