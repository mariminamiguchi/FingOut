class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    plan = Plan.find(params[:plan_id])
    current_user.like(plan)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to plan
  end

  def destroy
    plan = Plan.find(params[:plan_id])
    current_user.unlike(plan)
    flash[:success] = 'お気に入りを削除しました。'
    redirect_to plan
  end
end
