class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_plans = user.plans.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_likings = user.likings.count
    # @count_likers = plan.likers.count
  end
end
