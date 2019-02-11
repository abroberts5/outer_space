class Asteroid
  attr_reader :name,
              :is_potentially_hazardous_asteroid

  def initialize(data)
    @name                              = data[:name]
    @is_potentially_hazardous_asteroid = data[:is_potentially_hazardous_asteroid]
  end

end
