class SchoolsController < ApplicationController
  def index

    school_ids = School.ambassador_schools.pluck(:tc_id)
    class_year_start = "2016"
    class_year_end = "2021"
    @school_list_count = TransparentCareer.new.users_count_by_schools({school_ids: school_ids,
                      class_year_start: class_year_start, class_year_end: class_year_end}).sort! { |a,b| b.count <=> a.count }

    @school_count = []
    @school_list_count.each do |school_count|
      school = School.find_by(tc_id: school_count.school_id)

      @school_count << [school.school_name, school_count.count]
    end


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
