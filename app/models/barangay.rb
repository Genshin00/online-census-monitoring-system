class Barangay < ApplicationRecord
  has_many :households
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  
  enum status: [:active, :inactive]
  
end
