class ApiIndexRenderer
  attr_reader :name, :link_ref, :method_type
  
  def initialize(name, link_ref, method_type)
    @name        = name
    @link_ref    = link_ref
    @method_type = method_type
  end
  
  class << self
    
    def user_api_index
    	index_arr = []
      index_arr << ApiIndexRenderer.new("Get content from URL", "get_content_from_url", "POST")
      index_arr << ApiIndexRenderer.new("List Contents", "list_contents", "GET")
      index_arr
    end
  end
end