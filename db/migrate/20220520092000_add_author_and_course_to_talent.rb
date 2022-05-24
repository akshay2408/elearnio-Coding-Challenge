# frozen_string_literal: true

class AddAuthorAndCourseToTalent < ActiveRecord::Migration[6.1]
  def change
    add_reference :talents, :author, foreign_key: true
    add_reference :talents, :course, foreign_key: true
  end
end
