class InferenceResultsController < ApplicationController
  before_filter :authenticate_user!
  def index
  	@inference_results = InferenceResult.all
  end
  
  def show
  	@inference_results = InferenceResult.where(pupil_id: params[:pupil_id]).all.order("points DESC")
  end
end
