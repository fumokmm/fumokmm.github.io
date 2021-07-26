# チェリーピック(no-commit)して、ステージを戻す(ローカルで編集しただけ)
git cherry-pick -n refs/tags/no-google
git restore --staged _layouts/base_layout.html

