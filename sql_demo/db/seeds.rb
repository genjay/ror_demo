# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
uid = 100
name = '部門'
  3.times do |i|
	uid+=1
	Department.create(uid: uid, name: "#{name}_#{uid}")
end