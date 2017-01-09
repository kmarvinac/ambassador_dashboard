namespace :db do
  desc "Add shools from TransparentCarreer to this database"
  task update_schools: :environment do
    tc_schools = TransparentCareer.new.schools

    p "Creating Schools"
    tc_schools.each do |tc_school|
      school = School.find_by(school_name: tc_school[:name], tc_id: tc_school[:id])

      if school.blank?
        School.create(school_name: tc_school[:name], tc_id: tc_school[:id])
      end
    end
    p "Finished Creating Schools"

    p "Performing Sanity Check"
    our_schools_tc_ids = School.all.map(&:tc_id)
    tc_school_ids = tc_schools.map{|t| t[:id]}

    missing_in_our_db = tc_school_ids - our_schools_tc_ids
    extra_in_our_db = our_schools_tc_ids - tc_school_ids

    p "The following Schools are missing in our DB: #{missing_in_our_db}" if missing_in_our_db.size > 0
    p "The following Schools are extra in our DB: #{extra_in_our_db}" if extra_in_our_db.size > 0

    p "Finished!"
  end
end
