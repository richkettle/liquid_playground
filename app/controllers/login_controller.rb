class LoginController < ApplicationController

  def create; end

  def login
    require 'net/http'
    require 'net/https'
    require 'json'
    (@errors ||= []) << "Please include http(s):// in your base url" unless params[:login][:base_url].match? /http(s?)\:\/\//

    url = params[:login][:base_url] + "/api/v1/login/admin/#{params[:login][:company_id]}"
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    data = {'email' => params[:login][:email], 'password' => params[:login][:password]}.to_query
    headers = {"App-Id" => "f6b16c23", "App-Key" => "f0bc4f65f4fbfe7b4b3b7264b655f5eb"}

    resp, data = http.post(uri.path, data, headers)
    response_json = JSON.parse(resp.body)

    if resp.code != "201"
      (@errors ||= []) << "Login failed #{response_json["error"]}"
    else
      session[:jrni_login] = {auth_token: response_json["auth_token"], site: params[:login][:base_url], company_id: params[:login][:company_id]}
    end

    if @errors && @errors.any?
      render :create
    else
      redirect_to controller: "liquid_templates", action: "new"
    end
  end

  def logout
    reset_session
    redirect_to controller: :login, action: :create
  end
end