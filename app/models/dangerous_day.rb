class DangerousDay
  attr_reader :dangerous_asteroids

  def initialize(search_info)
    @start_date = search_info["start_date"]
    @end_date   = search_info["end_date"]
    @dangerous_asteroids = []
  end

  def search_dates
    search_start = Date.parse(@start_date).strftime("%B %-d, %Y")
    search_end   = Date.parse(@end_date).strftime("%B %-d, %Y")
    [search_start, search_end]
  end

  def result_day
    service = NasaService.new(@start_date, @end_date)
    result = service.dangerous_day
    result[1].each do |asteroid|
      if asteroid[:is_potentially_hazardous_asteroid] == true
      found = Asteroid.new(asteroid)
      @dangerous_asteroids << found
      end
    end
    Date.parse(result[0].to_s).strftime("%B %-d, %Y")
  end
end
