class Proposal < ActiveRecord::Base
  def send_to_codea
      api_token = Rails.application.secrets.codea_tag_api_token            
      # url = "http://codeatag.herokuapp.com/api_create"
      url = "http://localhost:3000/api_create"
      params = {"api_token" => api_token, 
                "proposal[name]"=> self.name, 
                "proposal[avatar]" => self.avatar, 
                "proposal[twitter_handle]" => self.twitter_handle}        
      Net::HTTP.post_form(URI.parse(url), params)  
  end
  
  def counter_codea
      api_token = Rails.application.secrets.codea_tag_api_token            
      # url = "http://codeatag.herokuapp.com/api_counter"
      url = "http://localhost:3000/api_counter"
      params = {"api_token" => api_token, 
                "proposal[twitter_handle]" => self.twitter_handle}        
      Net::HTTP.post_form(URI.parse(url), params)  
  end
end
