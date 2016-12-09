class ReferralsController < ApplicationController
  # before_action :current_user_must_be_referral_user, :only => [:index, :show_all]


  def index
    conversions = Referral.includes(:school).where.not(accepted_at: nil)
    @referrals = conversions.where(referrer_id: current_user.id)
    count_hash = @referrals.group(:school_id).count

    @school_count_hash = {}
    count_hash.each do |school_id, count|

      school = School.where(id: school_id).first
      next if school.nil?

      school_name = school.school_name
      @school_count_hash[school_name] = count
    end
  end


  def show_all
    conversions = Referral.where.not(accepted_at: nil)
    @referrals = conversions.where(referrer_id: current_user.id)
  end


end


{1=>1, 2=>2, 3=>1, 4=>1, 5=>2, 6=>3, 7=>3, 10=>2, 11=>2, 13=>2, 14=>2, 16=>1, 17=>1, 18=>4, 19=>1, 20=>1, 21=>1, 22=>1, 24=>1, 25=>2}
{"school" => 3}
