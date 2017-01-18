class Api::V1::PagesController < Api::V1::BaseController

	def get_content_from_url
		if params[:URL].present?
      begin
				require 'nokogiri'
				require 'open-uri'
				# Fetch and parse HTML document
				doc = Nokogiri::HTML(open(params[:URL]))			
				puts "### Or mix and match."
				a_tags = doc.search('a').map do |link|
	        link['href']
				end	
				h1_tags = doc.search('h1').map do |h1|
				  h1.content
				end		
				h2_tags = doc.search('h2').map do |h2|
				  h2.content
				end	
				h3_tags = doc.search('h3').map do |h3|
				  h3.content
				end		
				data = { :links => a_tags, :h1 => h1_tags, :h2 => h2_tags, :h3 => h3_tags }.to_json								
				@page_contents = PageContent.new(:url => params[:URL], :data => data)
				unless @page_contents.save
					render_json({:result=>{:messages => @page_content.errors.full_message, :rstatus=>0, :errorcode => 404}}.to_json)
				end	
			rescue OpenURI::HTTPError => e
			  if e.message == '404 Not Found'
			  	render_json({:result=>{:messages => "URL not found", :rstatus=>0, :errorcode => 404}}.to_json)
			  else
			    render_json({:result=>{:messages => e, :rstatus=>0, :errorcode => 404}}.to_json)
			  end
			rescue SocketError, Net::ReadTimeout => e
				render_json({:result=>{:messages => "Server can't be reached", :rstatus=>0, :errorcode => 404}}.to_json)	
			rescue 
				render_json({:result=>{:messages => "Invalid URL", :rstatus=>0, :errorcode => 404}}.to_json)	
			end 	
		else
			render_json({:result=>{:messages => "Please enter URL", :rstatus=>0, :errorcode => 404}}.to_json)
		end	
	end	

	def list_contents
		@page_contents = PageContent.order(:created_at)
		render "api/v1/pages/get_content_from_url"
	end	
end
