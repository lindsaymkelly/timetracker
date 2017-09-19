# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  company    :string
#  address    :string
#  city       :string
#  state      :string
#  zip        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
  has_many :projects 
  #ensure has many and not has one
end
