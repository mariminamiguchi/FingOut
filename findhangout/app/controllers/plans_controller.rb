class PlansController < ApplicationController
  before_action :require_user_logged_in, except: [:index, :show]
  before_action :correct_user, only: [:destroy]
  
  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
    @courses = @plan.courses
    
  end
  
  def new
    @plan = Plan.new
  end

  def create
    @plan = current_user.plans.build(plan_params)
    if @plan.save
      flash[:success] = 'プランを投稿しました。'
      redirect_to action: :show, id: @plan.id
    else
      @plans = current_user.plans.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'プランの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:success] = 'プランを削除しました。'
    redirect_to root_url
  end
  
  private
  def plan_params
    params.require(:plan).permit(:name, :outline, :topphoto)
  end
  
  def correct_user
    @plan = current_user.plans.find_by(id: params[:id])
    unless @plan
      redirect_to root_url
    end
  end

end
