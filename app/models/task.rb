# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  task_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Task < ApplicationRecord
  belongs_to :project 
  belongs_to :user 
  has_many :task_entries
end
