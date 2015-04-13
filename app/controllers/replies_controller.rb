class RepliesController < ApplicationController
  before_action :set_poll
  before_action :set_coach

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
        format.html { redirect_to polls_path, notice: "Thank you for taking the poll." }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_poll
    @poll = Poll.find params[:poll_id]
  end

  def set_coach
    @coach = Coach.find(current_user.kind == "coach" ? current_user.coach.id : 1)
  end

  def reply_params
    params.require(:reply).permit( { answers_attributes: [ :value, :question_id, :possible_answer_id ] })
  end
end