class CabStudent < ActiveRecord::Base
belongs_to :cab
belongs_to :student
validates_uniqueness_of :student_id
end
