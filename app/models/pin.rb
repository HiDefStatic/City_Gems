class Pin < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :comments
  has_many :pin_tags
end
