class Cab < ApplicationRecord
  belongs_to :user
  validates :reg_no , presence: true, uniqueness: true
  validates :user_id , presence: true
  validates :source , presence: true
 end
