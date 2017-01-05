# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'schools_seed.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = School.new
  t.school_name = row['school_name']
  t.save
  puts "#{t.school_name} saved"
end

puts "there are now #{School.count} schools in the table"


require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'referrals_seed.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Referral.new
  t.invited_user_email = row['invited_user_email']
  t.record_type = row['record_type']
  t.created_at = row['created_at']
  t.accepted_at = row['accepted_at']
  t.school_id = row['school_id']
  t.referrer_id = row['referrer_id']

  t.save
  puts "#{t.invited_user_email}, #{t.school_id} saved"
end

puts "There are now #{Referral.count} rows in the transactions table"
