class Api::V1::BaseController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, :with => :bad_record
  after_filter :set_access_control_headers

  protected

  def render_json(json)
    callback = params[:callback]
    response = begin
      if callback
        "#{callback}(#{json});"
      else
        json
      end
    end
    render({:content_type => :js, :text => response})
  end

  def bad_record
    render_json({:result=>{:messages => "No records Found",:rstatus=>0, :errorcode => 404}}.to_json)
  end

  def parameter_errors
    render_json({:result=>{:messages => "You have supplied invalid parameter list.",:rstatus=>0, :errorcode => 404}}.to_json)
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

end