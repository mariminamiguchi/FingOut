class CoursesController < ApplicationController
  before_action :require_user_logged_in, except: [:index, :show]
  before_action :correct_user, only: [:new, :create, :destroy]
  
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
    @course.destroy
    flash[:success] = 'コースを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  def plan_params
    params.require(:plan).permit(:id)
  end
  
  def course_params
    params.require(:course).permit(:number, :text, :outline, :photo)
  end
  
  def correct_user
    @course = current_user.courses.find_by(id: params[:id])
    unless @course
      redirect_to root_url
    end
  end
end
