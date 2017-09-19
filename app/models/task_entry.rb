# == Schema Information
#
# Table name: task_entries
#
#  id         :integer          not null, primary key
#  task_id    :integer
#  duration   :integer
#  note       :string
#  start_time :time
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskEntry < ApplicationRecord
  belongs_to :task 
  

  def display_time
    Time.at(duration).utc.strftime("%H:%M:%S")
  end
end
