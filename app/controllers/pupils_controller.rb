class PupilsController < ApplicationController
  before_action :set_pupil, only: [:show, :edit, :update, :destroy]
  # before_action :ensure_is_coach
  before_action :set_sexes, :set_objectives, :set_exercise_frequencies

  def index
    @pupils = Pupil.all
  end
    
  def show
  end
  
  def new
    @pupil = Pupil.new
    @pupil.build_physical_profile
  end
  
  def edit
  end
    
  def create
    @pupil = Pupil.new(pupil_params)

    respond_to do |format|
      if @pupil.save
        format.html { redirect_to action: "show", controller: "inference_results", pupil_id: @pupil.id, notice: 'Aluno criado com sucesso.' }
        format.json { render :show, status: :created, location: @pupil }
      else
        format.html { render :new }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def update
    respond_to do |format|
      if @pupil.update(pupil_params)
        format.html { redirect_to @pupil, notice: 'Aluno atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @pupil }
      else
        format.html { render :edit }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end
    
  def destroy
    @pupil.destroy
    respond_to do |format|
      format.html { redirect_to pupils_url, notice: 'Aluno destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private    
    def set_pupil
      @pupil = Pupil.find(params[:id])
    end

    def set_sexes
      @sexes = PhysicalProfile.sexes
    end

    def set_objectives
      @objectives = PhysicalProfile.objectives
    end

    def set_exercise_frequencies
      @exercise_frequencies = PhysicalProfile.how_often_pratice_exercises
    end   

    def ensure_is_coach
      authenticate_user!
      redirect_to(root_path, notice: 'Você precisa ser um treinador para cadastrar um aluno.') unless current_user.coach?
      @coach = current_user.coach
    end
    
    def pupil_params
      params.require(:pupil).permit(:name, physical_profile_attributes: [:age, :stature, :weight, :sex, :objective, :smoker, :has_cardiac_problem, :has_respiratory_problem, :cardiac_diseases_in_family, :how_often_pratice_exercises, :how_long_is_on_gym])
    end
end
