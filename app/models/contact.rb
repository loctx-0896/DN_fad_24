class Contact < ApplicationRecord
  belongs_to :user
  enum status: {pending: 1, success: 0}
  mount_uploader :picture, PictureUploader
  scope :sort_contacts, ->{order(created_at: :desc)}
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :description, presence: true
end
