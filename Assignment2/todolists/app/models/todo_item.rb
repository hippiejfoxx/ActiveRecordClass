class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user

  default_scope do
    order(due_date: :asc)
  end
end
