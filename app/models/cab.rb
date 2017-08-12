class Cab < ApplicationRecord
  has_many :cab_students
  has_many :students, through: :cab_students

  enum status:
  {
     unavailable: 0, available: 1
  }
  belongs_to :user
  validates :reg_no , presence: true, uniqueness: true
  validates :user_id , presence: true
  validates :source , presence: true
  validates :service_area, presence: true

  geocoded_by :service_address
  after_validation :geocode,
                        if: :service_address_changed?  

  def service_address
    [service_area , source].compact.join(", ")
  end
  def service_address_changed
   service_area_changed? || source_changed?
  end

 end
