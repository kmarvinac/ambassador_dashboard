class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(20)
    @referrals = Referral.all

    count_hash = @referrals.group(:referrer_id).count

    @user_count_hash = {}
    count_hash.each do |referrer_id, count|

      user = User.where(id: referrer_id).first
      next if user.nil?

      user_name = user.first_name
      @user_count_hash[user_name] = count
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
