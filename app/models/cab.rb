class Cab < ApplicationRecord
  enum status:
  {
     unavailable: 0, available: 1
  }
  belongs_to :user
  validates :reg_no , presence: true, uniqueness: true
  validates :user_id , presence: true
  validates :source , presence: true
 end
