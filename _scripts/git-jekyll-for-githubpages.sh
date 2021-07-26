# チェリーピック(no-commit)して、ステージを戻す(ローカルで編集しただけ)
git cherry-pick -n refs/tags/jekyll-v3.9.0-for-github-pages
git restore --staged Gemfile Gemfile.lock

# このgitコマンドを打ったあと、
# bundle update
# を実施し、Gemを最新化して下さい。
