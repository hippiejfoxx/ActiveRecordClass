class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items, dependent: :destroy

  default_scope do
    order(list_due_date: :asc)
  end
end
