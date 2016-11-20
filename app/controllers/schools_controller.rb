class SchoolsController < ApplicationController
  def index
    @q = School.ransack(params[:q])
    @schools = @q.result(:distinct => true).includes(:users, :referrals).page(params[:page]).per(10)

    render("schools/index.html.erb")
  end

  def show
    @referral = Referral.new
    @user = User.new
    @school = School.find(params[:id])

    render("schools/show.html.erb")
  end

  def new
    @school = School.new

    render("schools/new.html.erb")
  end

  def create
    @school = School.new

    @school.school_name = params[:school_name]
    @school.total_enrollment = params[:total_enrollment]
    @school.state = params[:state]

    save_status = @school.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/schools/new", "/create_school"
        redirect_to("/schools")
      else
        redirect_back(:fallback_location => "/", :notice => "School created successfully.")
      end
    else
      render("schools/new.html.erb")
    end
  end

  def edit
    @school = School.find(params[:id])

    render("schools/edit.html.erb")
  end

  def update
    @school = School.find(params[:id])

    @school.school_name = params[:school_name]
    @school.total_enrollment = params[:total_enrollment]
    @school.state = params[:state]

    save_status = @school.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/schools/#{@school.id}/edit", "/update_school"
        redirect_to("/schools/#{@school.id}", :notice => "School updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "School updated successfully.")
      end
    else
      render("schools/edit.html.erb")
    end
  end

  def destroy
    @school = School.find(params[:id])

    @school.destroy

    if URI(request.referer).path == "/schools/#{@school.id}"
      redirect_to("/", :notice => "School deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "School deleted.")
    end
  end
end
