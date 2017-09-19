# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  project_name :string
#  customer_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Project < ApplicationRecord
  belongs_to :customer 
  has_many :tasks 
  # ensure one to many relationship
end
