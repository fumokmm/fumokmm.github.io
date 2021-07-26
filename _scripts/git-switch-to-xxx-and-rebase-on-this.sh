#!/usr/bin/env bash

# [動作]
#   指定のブランチにスイッチした後、元居たブランチにリベースする
#     $1 = ブランチ名

if [[ $# -eq 0 ]]
then
    echo 第一引数でスイッチするブランチ名を指定して下さい。
    exit 1
else
    branch_name=$1
fi

# 続行を求める
read -p "Your input branch name is [$branch_name], ok? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac

# ブランチ名が存在しない場合は処理中断
if [[ -n "$(git branch --format="%(refname:short)" | grep -e ^$branch_name$)" ]]
then
    # 現在のブランチ名を保持(=元居たブランチ)
    orig_branch=`git rev-parse --abbrev-ref HEAD`
    echo orig_branch is $orig_branch

    # ブランチにスイッチ
    git switch $branch_name

    #
    # 元居たブランチにリベースする
    #
    # 現在のローカル変更をstash
    git stash
    # ブランチにrebase
    git rebase $orig_branch
    # stashを戻す
    git stash pop

else
    echo ブランチ\($branch_name\)が存在しません。
    exit 1
fi

exit 0
