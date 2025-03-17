require 'nokogiri'
require 'open-uri'
require 'json'

# 目标URL
url = "http://www.rv-c.com/?q=node/76"

# 获取网页内容
html = URI.open(url).read

# 使用Nokogiri解析HTML
doc = Nokogiri::HTML(html)

# 查找summary table
# 假设summary table是第一个表格
table = doc.at('table')

# 如果没有找到表格，输出错误信息
if table.nil?
  puts "未找到summary table"
  exit
end

# 初始化一个数组来存储表格数据
table_data = []

# 获取表头（如果有）
headers = table.search('tr').first.search('th, td').map { |header| header.text.strip }

# 遍历表格行（跳过表头）
table.search('tr').drop(1).each do |row|
  # 获取每行的单元格内容，并去除多余的空白字符
  cells = row.search('td').map { |cell| cell.text.strip }
  # 将表头和单元格内容组合成一个哈希
  row_data = headers.zip(cells).to_h
  # 将哈希添加到表格数据中
  table_data << row_data
end

# 将表格数据转换为JSON格式
json_data = JSON.pretty_generate(table_data)

# 保存JSON数据到本地文件
File.write('scripts/summary_table.json', json_data)

puts "数据已成功保存到 scripts/summary_table.json"