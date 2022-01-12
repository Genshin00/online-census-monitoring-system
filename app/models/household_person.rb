class HouseholdPerson < ApplicationRecord
  belongs_to :household

  def self.sexes
    ["Male", "Female"]
  end

  def self.civil_statuses
    ["Single", "Married", "Widowed", "Divorce",]
  end

  def self.migrateds
    ["Yes", "No"]
  end

  def self.highest_educations
    ["Daycare", "Kindergarted", "Elementary Student", "Elementary Graduate", "High School Student", "High School Graduate", "College Student", "College Graduate", "Vocational/Technical Student", "Vocational/Technical Graduate/Course"]
  end
  
  def self.school_attendeds
    ["Public", "Private"]
  end

  def self.can_reads
    ["Yes", "No"]
  end

  def self.employment_types
    ["NONE", "Government", "Private"]
  end

  def self.type_of_works
    ["NONE", "Part Time", "Full Time"]
  end

  def self.dialects
    ["Pangasinan", "Ilocano", "Tagalog", "Pampango", "Viscaya/Cebuano"]
  end

  def self.religions
    ["Roman Catholic", "Iglesia ni Cristo", "Islam", "Latter Day Saints", "Metodists", "Christian", "Jehovah's Witness", "Hinduisim", "Baptist", "Seven Day Adventist", "Mennonites"]
  end
end
