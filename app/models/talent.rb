# frozen_string_literal: true

class Talent < ApplicationRecord
  validates :skill, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :author_id, presence: true
  validates :course_id, presence: true

  belongs_to :author
  belongs_to :course
end
