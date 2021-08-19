class CoursesController < ApplicationController
  before_action :require_user_logged_in, except: [:index, :show]
  before_action :correct_user, only: [:destroy]
  
  def index
    @courses = Course.order(id: :desc)
  end

  def new
    @plan = Plan.find(params[:plan_id])
    @course = Course.new
    
  end

  def create
    @plan = Plan.find(params[:plan_id])
    @course = @plan.courses.build(course_params)
    if @course.save
      flash[:success] = 'コースを設定しました。'
      redirect_to plan_path(id: @plan)
    else
      @course = courses.order(id: :desc)
      flash.now[:danger] = 'コースの設定に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    # @current_user = @current_user || User.find_by(id: session[:user_id])
    @plan = Plan.find(params[:plan_id])
    course = Course.find(params[:id])
    course.destroy
    flash[:success] = 'コースを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def plan_params
    params.require(:plan).permit(:id)
  end
  
  def course_params
    params.require(:course).permit(:id, :number, :headding, :text, :outline, :photo)
  end
  
  def correct_user
    @plan = Plan.find(params[:plan_id])
    @course = @plan.courses.find_by(id: params[:id])
    unless @course
      redirect_to root_url
    end
  end
end
