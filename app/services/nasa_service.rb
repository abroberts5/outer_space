class NasaService

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date   = end_date
  end

  def dangerous_day
    updated = get_json.sort_by do |asteroid_record|
      selected = asteroid_record[1].select do |asteroid|
        asteroid[:is_potentially_hazardous_asteroid] == true
      end
      selected.count
    end
    updated.last
  end

  def get_json
    @response ||= Faraday.get("https://api.nasa.gov/neo/rest/v1/feed?start_date=#{@start_date}&end_date=#{@end_date}&api_key=#{ENV["NASA_API_KEY"]}")
    @parsed ||= JSON.parse(@response.body, symbolize_names: true)[:near_earth_objects].to_a
  end
end
