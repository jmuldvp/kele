require 'httparty'
require_relative 'roadcheck'
include RoadCheck

class Kele
  include HTTParty

  def initialize(email, password)
    response = self.class.post(api_end_point("sessions"), body: {"email": email, "password": password})
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

  def get_messages(id)
    response = self.class.get(api_end_point("message_threads"), headers: {"authorization" => @auth_token})
    @user_data = [JSON.parse(response.body)]
  end

  def create_message(sender, recip_id, subject, text)
    @message = self.class.post(api_end_point("messages"),
      body: {
        "sender": sender,
        "recipient_id": recip_id,
        "subject": subject,
        "stripped-text": text
        },
      headers: {"authorization" => @auth_token})
  end

  def create_submission(assign_branch, assign_commit_link, checkpoint_id, comment, enroll_id)
    @submission = self.class.post(api_end_point("checkpoint_submissions"),
      body: {
        "assignment_branch": assign_branch,
        "assignment_commit_link": assign_commit_link,
        "checkpoint_id": checkpoint_id,
        "comment": comment,
        "enrollment_id": enroll_id,
      },
      headers: {"authorization" => @auth_token})
  end

  private
  def api_end_point(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end

# require './lib/kele.rb'
# 623967
