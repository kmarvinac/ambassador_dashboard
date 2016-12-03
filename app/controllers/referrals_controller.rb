class ReferralsController < ApplicationController
  def index
    @q = Referral.ransack(params[:q])
    @referrals = @q.result(:distinct => true).includes(:referrer, :school).page(params[:page]).per(10)
    render("referrals/index.html.erb")

  end


  def show_all
    @referrals = Referral.all
  end


end
