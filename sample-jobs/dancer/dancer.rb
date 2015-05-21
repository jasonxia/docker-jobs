class Dancer
  class << self
    def execute
      puts "-----------------------------"
      puts "I'm a dancer and I will run."
      puts "The time is #{Time.now}"
      puts "dance dance dance dance dance"
      puts "dance dance dance dance dance"
      puts "-----------------------------"
    end
  end
end

Dancer.execute
