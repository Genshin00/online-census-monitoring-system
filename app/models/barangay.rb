class Barangay < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: true }
  
  enum status: [:active, :inactive]
  
end
