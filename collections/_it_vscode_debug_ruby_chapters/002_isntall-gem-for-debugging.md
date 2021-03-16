---
chapter_no: 002
chapter_id: isntall-gem-for-debugging
chapter_title: デバッグ用Gemを導入する
created: 2021-03-16
updated: 2021-03-16
---
<div class="code-box-output no-title">
<pre>
$ gem install bundler
$ bundle init
$ cat Gemfile
# A sample Gemfile
source "https://rubygems.org"

# gem "rails"
gem "ruby-debug-ide"
gem "debase"
$ bundle install
</pre>
</div>
