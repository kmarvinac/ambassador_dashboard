class ReferralsController < ApplicationController
  # before_action :current_user_must_be_referral_user, :only => [:index, :show_all]


  def index
    @referrals = TransparentCareer.new.user_referrals(current_user.tc_id)

    date_hash = @referrals.group_by{|r| r.accepted_at.to_datetime.strftime("%m/%d/%Y")}
    @referral_by_day_hash = {}
    date_hash.each do |date, referrals|
      @referral_by_day_hash[date] = referrals.size
    end


    name_hash = @referrals.group_by{|r| r.current_school ? r.current_school[:name] : "N/A"}
    @school_count_hash = {}
    name_hash.each do |school_name, referrals|
      @school_count_hash[school_name] = referrals.size
    end
  end


  def show_all
    referrals = TransparentCareer.new.user_referrals(current_user.tc_id)

    @referrals = referrals.select{|r| r.accepted == true}
  end


end
