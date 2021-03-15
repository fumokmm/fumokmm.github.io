require 'date'

# ベースディレクトリ
base_dir = File.expand_path("#{__dir__}/..") + '/'
# collectionsディレクトリ
collections_dir = Dir.new(File.join(base_dir, 'collections'))

# ファイルから updated: 行の読み込み
def read_updated(path_name)
  File.foreach(path_name) do |line|
    if line.start_with? 'updated: '
      return Date.parse(line.chomp[/\d{4}-\d{2}-\d{2}/, 0])
    end
  end
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
    dir_name = info['dir']
    file_name = article_file_name
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
      'updated' => updated
    }
  }
}.flatten

#############################################
# 4. 記事チャプター情報の構築
#   記事情報のパスから、チャプター情報のディレクトリ名を構築、
#   チャプター情報のディレクトリが存在しない場合はそこで処理終了
#   チャプター情報のディレクトリが存在する場合、ディレクトリ配下のファイルを取得する
info4 = info3.map { |info|
  # チャプターディレクトリ名を構築
  chapter_dir_name = "_#{info['category_id']}_#{info['sub_category_id']}_#{info['article_id']}_chapters"
  # チャプターディレクトリ(フルパス)
  chapter_dir = File.join(collections_dir, chapter_dir_name)
  next if !Dir.exist?(chapter_dir)

  # チャプターディレクトリ内を検索
  Dir.new(chapter_dir).children.filter{ |name|
    FileTest.file?(File.join(chapter_dir, name))
  }.map { |chapter_file_name|
    # チャプターIDを取得
    chapter_id = chapter_file_name[/^\d{3}_(.+).md$/, 1]

    # パス情報を構築
    dir_name = chapter_dir
    file_name = chapter_file_name
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
      'article_id' => info['article_id'],
      'chapter_id' => chapter_id,
      'updated_orig' => updated,
      'updated' => updated
    }
  }
}.filter{|item| item}.flatten
# nilでないものに絞る

info4.each do |inf4|
  # チャプターの更新日
  path = inf4['path']
  updated4 = inf4['updated']

  # 記事の更新日
  inf3 = info3.find{ |inf| inf['path'] == inf4['parent_path'] }
  updated3 = inf3['updated']
  if updated4 > updated3
      inf3['updated'] = updated4
  end

  # サブカテゴリの更新日
  inf2 = info2.find{ |inf| inf['path'] == inf3['parent_path'] }
  updated2 = inf2['updated']
  if updated4 > updated2
    inf2['updated'] = updated4
  end

  # カテゴリの更新日
  inf1 = info1.find{ |inf| inf['path'] == inf2['parent_path'] }
  updated1 = inf1['updated']
  if updated4 > updated1
    inf1['updated'] = updated4
  end
end

# 結果出力
[info1, info2, info3, info4].flatten.each do |info|
  if info['updated_orig'] < info['updated']
    puts "現状: #{info['updated_orig']} => 更新後: #{info['updated']} -- #{info['path']}"
    ReplaceUpdated.new(info['path'], info['updated_orig'], info['updated']).exec
  end
end
