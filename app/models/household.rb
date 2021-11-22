class Household < ApplicationRecord
  belongs_to :barangay

  enum status: [:active, :inactive]
  validates :sitio, presence: true
  validates :house_no, presence: true
  validates :date_of_survey, presence: true
  validates :informant, presence: true
  validates :surveyed_by, presence: true

end
