class Job
  attr_accessor :image_uri, :cronline, :desc

  def initialize(image_uri, cronline, desc)
    @desc = desc
    @image_uri = image_uri
    @cronline = cronline

    @scheduler = Rufus::Scheduler.new
  end

  def start
    @scheduler.cron(cronline) do
      system("docker run -ti #{image_uri}")
    end
  end

  def stop
    @scheduler.shutdown if @scheduler.up?
  end

  def as_json(*)
    {
      image_uri:  @image_uri,
      cronline:   @cronline,
      desc:       @desc,
      created_at: @scheduler.started_at,
      active:     @scheduler.up?,
      next_time:  @scheduler.jobs.first.try(:next_time)
    }
  end
end
