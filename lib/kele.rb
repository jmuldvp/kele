require 'httparty'
class Kele
  include HTTParty

  def initialize(email, password)
    response = self.class.post(api_end_point("sessions"), body: {"email": email, "password": password})
    puts response.code
    raise "Error" if response.code == 404
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(api_end_point("users/me"), headers: {"authorization" => @auth_token})
    @user_data = JSON.parse(response.body)
  end

  def get_mentor_availability(id)
    response = self.class.get(api_end_point("mentors/#{id}/student_availability"), headers: {"authorization" => @auth_token})
    @user_data = [JSON.parse(response.body)]
  end

  private
  def api_end_point(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end

# require './lib/kele.rb'
# 623967
