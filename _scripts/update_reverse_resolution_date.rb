require 'date'
require 'yaml'

# ベースディレクトリ
base_dir = File.expand_path("#{__dir__}/..") + '/'
# _articlesディレクトリ
articles_dir = Dir.new(File.join(base_dir, '_articles'))
# _dataディレクトリ
data_dir = Dir.new(File.join(base_dir, '_data'))

# ファイルから chapter_title:, sub_category_id:, updated:行の読み込み
def read_front_matter(path_name)
  chapter_title, sub_category_id, updated = nil, nil, nil
  File.foreach(path_name) do |line|
    if line.start_with? 'chapter_title: '
      chapter_title = line.split(':').last.strip
    elsif line.start_with? 'sub_category_id: '
      sub_category_id = line.split(':').last.strip
    elsif line.start_with? 'updated: '
      begin
        date_str = line.chomp[/\d{4}-\d{2}-\d{2}/, 0]
        updated = Date.parse(date_str)
      rescue => error
        puts "#{path_name} -- updatedに不正な日付が含まれていました(#{error}): #{date_str}"
        exit(-1)
      end
    end
    # 全てデータが揃ったら処理を抜ける
    break if [chapter_title, sub_category_id, updated].all?{ |item| item != nil }
  end
  return chapter_title, sub_category_id, updated
end

# data(yaml)読み込み
data_yml = nil
File.open(File.join(data_dir, 'it_reverse_resolution.yml'), 'rt:utf-8') do |file|
  data_yml = YAML.load(file.read)
end
if !data_yml
  data_yml = {}
end

articles_reverse_resolution_dir = Dir.new(File.join(File.join(articles_dir, 'it'), 'reverse_resolution'))
articles_reverse_resolution_dir.children.filter { |name|
  FileTest.directory?(File.join(articles_reverse_resolution_dir, name))
}.each do |rr_article_id|
  rr_article_dir = Dir.new(File.join(articles_reverse_resolution_dir, rr_article_id))
  rr_article_dir.children.each do |article_file_name|
    chapter_title, sub_category_id, updated = read_front_matter(File.join(rr_article_dir, article_file_name))
    upd_flg = false
    # sub_category_idを持っている場合
    if sub_category_id != nil
      # data(yaml)更新
      if !data_yml.has_key? sub_category_id
        data_yml[sub_category_id] = []
        upd_flg = true
      end
      sub_category_entry = data_yml[sub_category_id]

      target = sub_category_entry.filter{ |item| item['article_id'] == rr_article_id }
      if target.size == 1
        if (target.first['chapter_id'] != chapter_title) ||
           (target.first['updated'] != updated)
          target.first['chapter_id'] = chapter_title
          target.first['updated'] = updated
          upd_flg = true
        end
      else
        sub_category_entry << {
          'article_id' => rr_article_id,
          'chapter_id' => chapter_title,
          'updated' => updated
        }
        upd_flg = true
      end
      if upd_flg
        puts "逆引き情報更新: #{rr_article_id} => updated at #{updated} from #{File.join(rr_article_dir, article_file_name)}"
      end
    end
  end
end

# data(yaml)書き込み
File.open(File.join(data_dir, 'it_reverse_resolution.yml'), 'wt:utf-8') do |file|
  file.puts YAML.dump(data_yml)
end
