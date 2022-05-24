# frozen_string_literal: true

class Author < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true, length: { maximum: 500 }
  validates :dob, presence: true

  has_many :talents
  has_many :courses, through: :talents

  def update_talents
    author_ids = Author.ids - [id]
    talents.update_all(author_id: author_ids.first)
  end
end
