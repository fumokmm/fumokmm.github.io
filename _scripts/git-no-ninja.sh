# チェリーピック(no-commit)して、ステージを戻す(ローカルで編集しただけ)
git cherry-pick -n refs/tags/no-ninja
git restore --staged _includes/tools/ninja_share_button.html

