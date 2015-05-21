class Singer
  class << self
    def execute
      puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
      puts "I'm a singer and I will run."
      puts "The time is #{Time.now}"
      puts "Sing Sing Sing Sing Sing Sing"
      puts "Sing Sing Sing Sing Sing Sing"
      puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    end
  end
end

Singer.execute
