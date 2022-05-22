class Course < ApplicationRecord
  validates :title, presence: true
  validates :description, presence:true, length: { maximum: 500 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  has_many :talents, dependent: :destroy
  has_many :authors, through: :talents
end
