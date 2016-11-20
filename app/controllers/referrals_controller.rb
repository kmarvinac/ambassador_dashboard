class ReferralsController < ApplicationController
  def index
    @q = Referral.ransack(params[:q])
    @referrals = @q.result(:distinct => true).includes(:referrer, :school).page(params[:page]).per(10)

    render("referrals/index.html.erb")
  end

  def show
    @referral = Referral.find(params[:id])

    render("referrals/show.html.erb")
  end

  def new
    @referral = Referral.new

    render("referrals/new.html.erb")
  end

  def create
    @referral = Referral.new

    @referral.referrer_id = params[:referrer_id]
    @referral.school_id = params[:school_id]

    save_status = @referral.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/referrals/new", "/create_referral"
        redirect_to("/referrals")
      else
        redirect_back(:fallback_location => "/", :notice => "Referral created successfully.")
      end
    else
      render("referrals/new.html.erb")
    end
  end

  def edit
    @referral = Referral.find(params[:id])

    render("referrals/edit.html.erb")
  end

  def update
    @referral = Referral.find(params[:id])

    @referral.referrer_id = params[:referrer_id]
    @referral.school_id = params[:school_id]

    save_status = @referral.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/referrals/#{@referral.id}/edit", "/update_referral"
        redirect_to("/referrals/#{@referral.id}", :notice => "Referral updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Referral updated successfully.")
      end
    else
      render("referrals/edit.html.erb")
    end
  end

  def destroy
    @referral = Referral.find(params[:id])

    @referral.destroy

    if URI(request.referer).path == "/referrals/#{@referral.id}"
      redirect_to("/", :notice => "Referral deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Referral deleted.")
    end
  end
end
