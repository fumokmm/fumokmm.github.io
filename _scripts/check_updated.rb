require 'date'

# ベースディレクトリ
base_dir = File.expand_path("#{__dir__}/..") + '/'
# _articlesディレクトリ
articles_dir = Dir.new(File.join(base_dir, '_articles'))
# collectionsディレクトリ
collections_dir = Dir.new(File.join(base_dir, 'collections'))

# ファイルから updated: 行の読み込み
def read_updated(path_name)
  File.foreach(path_name) do |line|
    if line.start_with? 'updated: '
      begin
        date_str = line.chomp[/\d{4}-\d{2}-\d{2}/, 0]
        return Date.parse(date_str)
      rescue => error
        puts "#{path_name} -- updatedに不正な日付が含まれていました(#{error}): #{date_str}"
        exit(-1)
      end
    end
  end
end

def read_chapter(info, chapter_dir, chapter_file_name)
  # パス情報を構築
  dir_name = chapter_dir
  file_name = chapter_file_name
  path_name = File.join(dir_name, file_name)

  # updated行の読み込み
  updated = read_updated(path_name)
  return nil if updated == nil # 更新日が取得できない場合、nilを返却

  # 結果に変換
  { 'parent_path' => info['path'],
    'path' => path_name,
    'dir' => dir_name,
    'file' => file_name,
    'category_id' => info['category_id'],
    'sub_category_id' => info['sub_category_id'],
    'article_id' => info['article_id'],
    'updated_orig' => updated,
    'updated' => updated
  }
end

# 更新日付を書き換える
class ReplaceUpdated
  def initialize(file_path, old_updated, new_updated)
    @file_path = file_path
    @old_updated = old_updated
    @new_updated = new_updated
  end

  def exec
    buffer = File.open(@file_path, 'r') { |f| f.read() }
    buffer.gsub!(/^updated: *#{@old_updated}.*$/, "updated: #{@new_updated}")  
    File.open(@file_path, 'w') { |f| f.write(buffer) }
    puts "現状: #{@old_updated} => 更新後: #{@new_updated} -- #{@file_path}"
  end
end

#############################################
# 1. トップカテゴリの情報を構築
#   collectionsディレクトリ配下の　_articles で終わるフォルダを取得し、
#   そのフォルダ配下の index.md ファイルを取得する
info1 = collections_dir.children.filter { |name|
  name.end_with? '_articles'
}.map { |name|
  # カテゴリIDを取得
  category_id = name.gsub(/^_|_articles$/, '')

  # パス情報を構築
  dir_name = File.join(collections_dir, name)
  file_name = 'index.md'
  path_name = File.join(dir_name, file_name)

  # updated行の読み込み
  updated = read_updated(path_name)

  # 結果に変換
  { 'path' => path_name,
    'dir' => dir_name,
    'file' => file_name,
    'category_id' => category_id,
    'updated_orig' => updated,
    'updated' => updated
  }
}

#############################################
# 2. サブカテゴリの情報を構築
#   トップカテゴリのサブディレクトリを取得し
#   そのフォルダ配下の index.md ファイルを取得する
info2 = info1.map { |info|
  # サブディレクトリを取得
  Dir.new(info['dir']).children.filter{ |name|
    FileTest.directory?(File.join(info['dir'], name))
  }.map { |sub_dir|
    # サブカテゴリIDを取得
    sub_category_id = sub_dir

    # パス情報を構築
    dir_name = File.join(info['dir'], sub_dir)
    file_name = 'index.md'
    path_name = File.join(dir_name, file_name)

    # updated行の読み込み
    updated = read_updated(path_name)

    # 結果に変換
    { 'parent_path' => info['path'],
      'path' => path_name,
      'dir' => dir_name,
      'file' => file_name,
      'category_id' => info['category_id'],
      'sub_category_id' => sub_category_id,
      'updated_orig' => updated,
      'updated' => updated
    }
  }
}.flatten

#############################################
# 3. サブカテゴリ内の記事情報を構築
#   サブカテゴリと同じディレクトリ内にある、index.md 以外のファイルを取得する
info3 = info2.map { |info|
  # ディレクトリ内を検索
  Dir.new(info['dir']).children.filter{ |name|
    FileTest.file?(File.join(info['dir'], name)) && name != 'index.md'
  }.map { |article_file_name|
    # 記事IDを取得
    article_id = article_file_name[/^(.+).md$/, 1]

    # パス情報を構築
    # _articles内に記事があるか確認 (記事ファイル名をフォルダ名にして当ててみて検索)
    if Dir.exist?("#{articles_dir.path}/#{info['category_id']}/#{info['sub_category_id']}/#{article_id}")
      dir_name = "#{articles_dir.path}/#{info['category_id']}/#{info['sub_category_id']}/#{article_id}"
      file_name = "index.md" # index.md 固定
      made_by_articles = true # _articles内のチャプターから生成されたかどうか
      has_chapter = Dir.new(dir_name).children.filter{ |chap| chap != 'index.md' }.size() > 0
    else
      dir_name = info['dir']
      file_name = article_file_name
      made_by_articles = false # _articles内のチャプターから生成されたかどうか
    end
    path_name = File.join(dir_name, file_name)

    # updated行の読み込み
    updated = read_updated(path_name)

    # 結果に変換
    { 'parent_path' => info['path'],
      'path' => path_name,
      'dir' => dir_name,
      'file' => file_name,
      'category_id' => info['category_id'],
      'sub_category_id' => info['sub_category_id'],
      'article_id' => article_id,
      'updated_orig' => updated,
      'updated' => updated,
      'made_by_articles' => made_by_articles, # _articles内のチャプターから生成されたかどうか
      'has_chapter' => has_chapter # _articles内でチャプターがあるかどうか(チャプター無しはindex.mdのみ)
    }
  }
}.flatten

#############################################
# 4. 記事チャプター情報の構築
#   記事情報のパスから、_articles内のチャプター記事なのか_collections配下の生記事なのかを調べて
#   _articles内のチャプター記事の場合、チャプター記事を読み込んでる素tで返却
#   _collections配下の生記事の場合、それ自体を返却
info4 = info3.map { |info|
  # _articles内のチャプターから生成された場合
  if info['made_by_articles']
    # index.md を除くチャプター記事を集めて返却
    next Dir.new(info['dir']).children.filter{ |name|
      FileTest.file?(File.join(info['dir'], name)) && name != 'index.md'
    }.map { |chapter_file_name|
      read_chapter(info, info['dir'], chapter_file_name)
    }
  end

  # _articles内のチャプターから生成されていない場合は
  # _collections配下の生記事なのでそのまま返却
  next info

}.filter{|item| item}.flatten.filter{|item| item}
# nilでないものに絞る

# 更新日の置き換え
# 1) チャプターから手繰る
info4.each do |inf4|
  # チャプターの更新日を基準更新日として取得
  updated = inf4['updated']

  # 記事の更新日
  inf3 = info3.find{ |inf| inf['path'] == inf4['parent_path'] }
  # _collections配下のサブカテゴリの生記事名を親に持つ記事が見つからない場合、
  # それは生記事なので、それ自身として扱う
  if inf3 == nil
    inf3 = inf4
  end
  if inf3['updated'] < updated
      inf3['updated'] = updated
  end

  # サブカテゴリの更新日
  inf2 = info2.find{ |inf| inf['path'] == inf3['parent_path'] }
  if inf2['updated'] < updated
    inf2['updated'] = updated
  end

  # カテゴリの更新日
  inf1 = info1.find{ |inf| inf['path'] == inf2['parent_path'] }
  if inf1['updated'] < updated
    inf1['updated'] = updated
  end
end

# 2) チャプターなしを手繰る
info3.filter{ |inf3| !inf3['has_chapter'] }.each do |inf3|
  # 記事indexの更新日を基準更新日として取得
  updated = inf3['updated']

  # サブカテゴリの更新日
  inf2 = info2.find{ |inf| inf['path'] == inf3['parent_path'] }
  if inf2['updated'] < updated
    inf2['updated'] = updated
  end

  # カテゴリの更新日
  inf1 = info1.find{ |inf| inf['path'] == inf2['parent_path'] }
  if inf1['updated'] < updated
    inf1['updated'] = updated
  end
end

# 結果出力
[info1, info2, info3, info4].flatten.each do |info|
  if info['updated_orig'] < info['updated']
    ReplaceUpdated.new(info['path'], info['updated_orig'], info['updated']).exec
  end
end

###########################################
# 更新履歴ページの更新日を更新
def get_history_last_updated(col_dir)
  history_dir = Dir.new(File.join(col_dir, '_history'))
  Dir.glob(history_dir.path + '/**/*').map{ |f|
    read_updated(f) if not File.directory?(f)
  }.filter{ |d| d != nil }.max
end
history_index_file_path = File.join(base_dir, 'history/index.md')
new_history_updated = get_history_last_updated(collections_dir)
old_history_updated = read_updated(history_index_file_path)
if old_history_updated < new_history_updated
  ReplaceUpdated.new(history_index_file_path, old_history_updated, new_history_updated).exec
end

###########################################
# Allの各ページの更新日を更新
def get_all_last_updated(col_dir)
  [
    File.join(col_dir, '_it_articles/index.md'),
    File.join(col_dir, '_life_articles/index.md'),
    File.join(col_dir, '_reading_articles/index.md'),
    File.join(col_dir, '_science_articles/index.md'),
    File.join(col_dir, '_economy_articles/index.md')
  ]
  .map { |f| read_updated(f) }.max
end
new_all_updated = get_all_last_updated(collections_dir)
all_index_files = [
  File.join(base_dir, 'all/created_desc.md'),
  File.join(base_dir, 'all/created.md'),
  File.join(base_dir, 'all/index.md'),
  File.join(base_dir, 'all/id.md'),
  File.join(base_dir, 'all/updated.md')
].each{ |all_index_file|
  old_all_updated = read_updated(all_index_file)
  if old_all_updated < new_all_updated
    ReplaceUpdated.new(all_index_file, old_all_updated, new_all_updated).exec
  end
}

###########################################
# トップページの更新日を更新
def get_main_categories_last_updated(base_dir, col_dir)
  [
    File.join(col_dir, '_it_articles/index.md'),
    File.join(col_dir, '_life_articles/index.md'),
    File.join(col_dir, '_reading_articles/index.md'),
    File.join(col_dir, '_science_articles/index.md'),
    File.join(col_dir, '_economy_articles/index.md'),
    File.join(base_dir, 'history/index.md'),
    File.join(base_dir, 'all/index.md'),
    File.join(base_dir, 'about/index.md')
  ]
  .map { |f| read_updated(f) }.max
end
top_index_file_path = File.join(base_dir, 'index.md')
new_top_updated = get_main_categories_last_updated(base_dir, collections_dir)
old_top_updated = read_updated(top_index_file_path)
if old_top_updated < new_top_updated
  ReplaceUpdated.new(top_index_file_path, old_top_updated, new_top_updated).exec
end
