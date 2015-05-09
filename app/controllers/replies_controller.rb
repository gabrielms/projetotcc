class RepliesController < ApplicationController
  before_action :set_poll
  before_action :set_coach
  before_action :ensure_is_coach, :ensure_not_responded_yet

  def new
    @reply = @poll.replies.build
    @poll.questions.each do |question|
      @reply.answers.build question: question
    end
  end

  def create
    @reply = @poll.replies.build reply_params
    @reply.coach_id = @coach.id
    respond_to do |format|
      if @reply.save
        format.html { redirect_to polls_path, notice: "Obrigado por responder este questionário." }
      else
        format.html { render :new }
      end
    end
  end

  private

  def ensure_is_coach
    redirect_to polls_path, alert: t("errors.messages.is_not_a_coach") unless current_user.kind == "coach"
  end

  def ensure_not_responded_yet
    if(Reply.where(poll_id: @poll.id, coach_id: @coach.id).any?)
      redirect_to polls_path, alert: t("errors.messages.poll_allready_responded")
    end
  end

  def set_poll
    @poll = Poll.find params[:poll_id]
  end

  def set_coach
    @coach = Coach.find current_user.coach.id if current_user.coach?
  end

  def reply_params
    params.require(:reply).permit( { answers_attributes: [ :value, :question_id, :possible_answer_id ] })
  end
end