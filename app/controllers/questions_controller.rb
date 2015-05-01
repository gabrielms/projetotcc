class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_poll
  before_action :get_workouts

  def index
    @questions = Question.all
  end

  def show
  end

  def new
      @question = @poll.questions.build
      10.times {|value| @question.possible_answers.build({title: (value+1).to_s})}
  end

  def edit
  end

  def create
    saved = true
    @workouts.each do |w|
      @question = Question.new(question_params)
      @question.workout = w
      if(!@question.save)
        saved = false
      end
    end

    respond_to do |format|
      if saved
        format.html { redirect_to @poll, notice: 'Perfil criado.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Perfil atualizado.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to @poll, notice: 'Perfil excluido.' }
      format.json { head :no_content }
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:poll_id, :workout_id, :title, :kind, { possible_answers_attributes: [ :question_id, :title ] } )
    end

    def set_poll
      @poll = Poll.find params[:poll_id]
    end
    def get_workouts
      @workouts = Workout.all
    end
end