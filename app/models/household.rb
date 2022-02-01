class Household < ApplicationRecord
  belongs_to :barangay

  has_many :household_people, dependent: :destroy
  has_many :vehicles, dependent: :destroy

  accepts_nested_attributes_for :vehicles, allow_destroy: true

  enum status: [:active, :inactive]
  validates :house_no, presence: true
  validates :date_of_survey, presence: true
  validates :informant, presence: true
  validates :surveyed_by, presence: true

  def name
    house_no
  end

  def self.household_people
    HouseholdPerson.all.where(household_id: self.ids)
  end
end
