# チェリーピック(no-commit)して、ステージを戻す(ローカルで編集しただけ)

# Google AdsenseとGoogle Analytics
git cherry-pick -n refs/tags/no-google
git restore --staged _layouts/base_layout.html

# 忍者ツールズ
git cherry-pick -n refs/tags/no-ninja
git restore --staged _includes/tools/ninja_share_button.html
