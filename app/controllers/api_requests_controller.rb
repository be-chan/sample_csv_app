class ApiRequestsController < ApplicationController 
    require 'net/http'
    require 'uri'
    require 'json'
    require 'csv'

    def connection
      url = URI.parse('http://localhost:3000/users') 
      req = Net::HTTP::Get.new(url.path)
      res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
      @lists = JSON.parse(res.body)
      puts @lists["users"]
      @users = @lists["users"]
      
    end
end
