# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

user_list = [
    ["Carly", "Fiorina", "female", 1954],
    ["Donald", "Trump", "male", 1946],
    ["Ben", "Carson", "male", 1951],
    ["Hillary", "Clinton", "female", 1947]
]

# .create({first_name: x[0], last_name: x[1], gender:x[2], birth_year:x[3]})
user_list.each do |x|
  user = User.create({username: x[1]})
  user.profile = Profile.create({first_name: x[0], last_name: x[1], gender:x[2], birth_year:x[3]})
  list = user.todo_lists.create({list_due_date: Date.today + 1.years})
  5.times{|x| list.todo_items.create({due_date: Date.today + 1.years, title: "test", description: "tess"})}
end