class PlansController < ApplicationController
  before_action :require_user_logged_in, except: [:index, :show, :hashtag]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
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
  
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plan_params)
      redirect_to action: :show, id: @plan.id
    else
      render action: :edit
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    flash[:success] = 'プランを削除しました。'
    redirect_to root_url
  end
  
  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @plans = @tag.plans.page(params[:page])
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
