class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
         
  has_many :messages, dependent: :destroy
  belongs_to :barangay, optional: true
  
  has_one_attached :image

  enum status: ["Active", "Inactive"]
  enum role: ["admin", "bhw"]

  def image_path
    return Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) if image.attached?
  end
  
  def password_required?
    return false
    super
  end

  def admin? 
    role == "admin"
  end

  def bhw? 
    role == "bhw"
  end
end
