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
      return Date.parse(line.chomp[/\d{4}-\d{2}-\d{2}/, 0])
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
    # _articles内に記事があるか確認
    if Dir.exist?("#{articles_dir.path}/#{info['category_id']}/#{info['sub_category_id']}/#{article_id}")
      dir_name = "#{articles_dir.path}/#{info['category_id']}/#{info['sub_category_id']}/#{article_id}"
      file_name = "index.md" # index.md 固定
    else
      dir_name = info['dir']
      file_name = article_file_name
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
  # ファイル名が index.md の場合は、_articlesの内部
  if info['file'] == 'index.md'
    next Dir.new(info['dir']).children.filter{ |name|
      FileTest.file?(File.join(info['dir'], name)) && name != 'index.md'
    }.map { |chapter_file_name|
      read_chapter(info, info['dir'], chapter_file_name)
    }
  end

  # チャプターディレクトリ名を構築
  chapter_dir_name = "_#{info['category_id']}_#{info['sub_category_id']}_#{info['article_id']}_chapters"
  # チャプターディレクトリ(フルパス)
  chapter_dir = File.join(collections_dir, chapter_dir_name)
  # チャプターディレクトリがない場合はそのままこの情報を返す
  if !Dir.exist?(chapter_dir)
    next info
  end

  # チャプターディレクトリ内を検索
  Dir.new(chapter_dir).children.filter{ |name|
    FileTest.file?(File.join(chapter_dir, name))
  }.map { |chapter_file_name|
    read_chapter(info, chapter_dir, chapter_file_name)
  }

}.filter{|item| item}.flatten.filter{|item| item}
# nilでないものに絞る

info4.each do |inf4|
  # チャプターの更新日
  path = inf4['path']
  updated4 = inf4['updated']

  # 記事の更新日
  inf3 = info3.find{ |inf| inf['path'] == inf4['parent_path'] }
  inf3 = inf4 if inf3 == nil
  updated3 = inf3['updated']
  if updated4 > updated3
      inf3['updated'] = updated4
  end

  # サブカテゴリの更新日
  inf2 = info2.find{ |inf| inf['path'] == inf3['parent_path'] }
  updated2 = inf2['updated']
  if updated3 > updated2
    inf2['updated'] = updated3
  end

  # カテゴリの更新日
  inf1 = info1.find{ |inf| inf['path'] == inf2['parent_path'] }
  updated1 = inf1['updated']
  puts "#{inf1['path']} #{inf2['path']} ★#{updated2} ★#{updated1}"
  if updated2 > updated1
    inf1['updated'] = updated2
  end
end

# 結果出力
[info1, info2, info3, info4].flatten.each do |info|
  if info['updated_orig'] < info['updated']
    puts "現状: #{info['updated_orig']} => 更新後: #{info['updated']} -- #{info['path']}"
    ReplaceUpdated.new(info['path'], info['updated_orig'], info['updated']).exec
  end
end
