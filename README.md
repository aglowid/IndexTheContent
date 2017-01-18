# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.3.3

* System dependencies
  
* Configuration
  1) clone the project repo by using following command:
    git clone https://github.com/aglowid/IndexTheContent.git
  2) Switch to project Directory 
    cd IndexTheContent
  3) Use ruby vesrion 2.3.3
  4) gem install bundler
  5) bundle install

* Database creation
  6) create database.yml - we have used database postgresql. For refrence use config/database.yml.example
  7) rake db:create
  8) rake db:migrate

  9) now start your server using command:
    rails s 

  Project is now ready to use : 
  
  1) api to get content of given URL
  api url - http://localhost:3000/api/get_content_from_url 
  params - URL
  request type - POST
  response -> data { page_url: "", h1_tag_data: [], h2_tag_data: [], h3_tag_data: [], link_urls: []}

  2) api to get stored page contents 
  api url - http://localhost:3000/api/list_contents
  request type - GET
  reponse -> data [{ page_url: "", h1_tag_data: [], h2_tag_data: [], h3_tag_data: [], link_urls: []},{ page_url: "", h1_tag_data: [], h2_tag_data: [], h3_tag_data: [], link_urls: []}] 


For api help - visit http://localhost:3000/api_help/index
On api help page, api list is available. and you can also call api from there. Response will be displayed to that page.

