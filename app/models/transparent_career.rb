class TransparentCareer
  include HTTParty
  base_uri "https://transparentcareer.herokuapp.com/api/v2"

  def initialize
    @headers = {headers: {"Authorization": "#{ENV["TRANSPARENT_CAREER_API_TOKEN"]}", "Content-Type": "application/json"}}
  end

  def schools
    response = self.class.get("/schools", @headers)
    if response.success?
      return JSON.parse response.body, symbolize_names: true
    else
      return nil
    end
  end

end
