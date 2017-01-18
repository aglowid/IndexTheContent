json.result do
  json.messages "ok"
  json.rstatus  "1"
  json.errorcode ""
end
if @page_contents.is_a?(ActiveRecord::Base)
  @page_contents = [@page_contents]
end
  json.data @page_contents.each do |page_content|
  json.id page_content.id  
  json.page_url page_content.url
  json.h1_tag_data JSON.parse(page_content.data)['h1']
  json.h2_tag_data JSON.parse(page_content.data)['h2']
  json.h3_tag_data JSON.parse(page_content.data)['h3']
  json.link_urls JSON.parse(page_content.data)['links']
end