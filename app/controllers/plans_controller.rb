class PlansController < ApplicationController
  before_action :require_user_logged_in, except: [:index, :show]
  
  def index
    @plans = Plan.order(id: :desc).page(params[:page]).per(25)
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
      redirect_to root_url
    else
      @plans = current_user.plans.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'プランの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
  end
  
  private
  def plan_params
    params.require(:plan).permit(:name, :outline, :topphoto)
  end
end
