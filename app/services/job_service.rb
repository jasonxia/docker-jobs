class JobService
  include Singleton

  def all
    jobs.values
  end

  def add(image_uri, cronline, desc = "")
    raise DuplicateJobException.new("Job already exists with image #{image_uri}") if find(image_uri)
    job = Job.new(image_uri, cronline, desc)
    jobs[image_uri] = job
    job.start
  end

  def delete(image_uri)
    job = find(image_uri)
    raise JobNotFoundException.new("Job not found with image #{image_uri}") unless job
    job.shutdown if job.up?
  end

  private

  def jobs
    @jobs ||= {}
  end

  def find(image_uri)
    jobs[image_uri]
  end
end
