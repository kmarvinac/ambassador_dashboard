class ReferralsController < ApplicationController
  # before_action :current_user_must_be_referral_user, :only => [:index, :show_all]


  def index
    conversions = Referral.where.not(accepted_at: nil)
    @referrals = conversions.where(referrer_id: current_user.id)
  end


  def show_all
    @referrals = Referral.where(referrer_id: current_user.id)
  end


end
