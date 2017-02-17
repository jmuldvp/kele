module RoadCheck

  def get_roadmap(id)
    response = self.class.get(api_end_point("roadmaps/#{id}"), headers: {"authorization" => @auth_token})
    @user_data = JSON.parse(response.body)
  end

  def get_checkpoint(id)
    response = self.class.get(api_end_point("checkpoints/#{id}"), headers: {"authorization" => @auth_token})
    @user_data = JSON.parse(response.body)
  end

end
