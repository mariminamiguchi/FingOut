class ToppagesController < ApplicationController
  def index
    @plans = Plan.order(id: :desc).page(params[:page]).per(25)
    
    if logged_in?
      @plan = current_user.plans.build # form_with用
      # @plans = current_user.plans.order(id: :desc).page(params[:page]) 
    end
  end
  
end
