class JobsController < ApplicationController
  rescue_from DuplicateJobException, with: :handle_duplicate_job
  rescue_from JobNotFoundException, with: :handle_job_not_found

  def index
    render status: :ok, json: JobService.instance.all.to_json
  end

  def create
    JobService.instance.add(params[:image_uri], params[:cronline], params[:desc])
    render status: :created, nothing: true
  end

  def destroy
    JobService.instance.delete(params[:image_uri])
    render status: :no_content, nothing: true
  end

  private
  def handle_duplicate_job(error)
    render json: { error_message: error.message }, status: :conflict
  end

  def handle_job_not_found(error)
    render json: { error_message: error.message }, status: :not_found
  end
end
