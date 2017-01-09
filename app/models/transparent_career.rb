class TransparentCareer
  include HTTParty
  base_uri "#{ENV["TRANSPARENT_CAREER_API_BASE_URI"]}"

  def initialize
    @headers = {headers: {"Authorization": "#{ENV["TRANSPARENT_CAREER_API_TOKEN"]}", "Content-Type": "application/json"}}
  end

  def schools
    response = self.class.get("/schools", @headers)
    if response.success?
      object_array = JSON.parse response.body, symbolize_names: true
      object_array.map{|o| OpenStruct.new(o)}
    else
      raise response.response
    end
  end

  def user_referrals(user_id)
    query = {query: {accepted: true}}
    response = self.class.get("/users/#{user_id}/referrals", @headers.merge(query))
    if response.success?
      object_array = JSON.parse response.body, symbolize_names: true
      return object_array.map{|o| OpenStruct.new(o)}
    else
      raise response.response
    end
  end

  def all_referrals(user_ids)
    query = {query: {user_ids: user_ids, accepted: true}}
    response = self.class.post("/referrals", @headers.merge(query))
    if response.success?
      return_object = JSON.parse response.body, symbolize_names: true
      return return_object.map{|o| OpenStruct.new(o)}
    else
      raise response.response
    end
  end

end
