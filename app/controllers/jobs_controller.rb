class JobsController < ApplicationController

  def index
    render status: :ok, json: JobService.instance.all.to_json
  end

  def create
    JobService.instance.add(params[:image_uri], params[:cronline], params[:desc])
    render status: :created, json: ''
  end
end
