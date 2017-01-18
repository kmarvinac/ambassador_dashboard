class UsersController < ApplicationController
  def index
    user_ids = User.all.map(&:tc_id) - [current_user.tc_id]
    @referrals = TransparentCareer.new.all_referrals(user_ids)

    @user_count_hash = {}
    @referrals.each do |referral|
      user = User.find_by(tc_id: referral.id)
      next if user.nil?

      @user_count_hash[user.email] = referral.referrals.size
    end
  end

  def show
    @user = User.find(params[:id])

    if @user.id != current_user.id
      redirect_to root_path
      return
    end
  end
end
