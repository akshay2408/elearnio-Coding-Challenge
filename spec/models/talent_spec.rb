# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Talent, type: :model do
  it { is_expected.to validate_presence_of :skill }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_length_of(:description).is_at_most(500) }
  it { is_expected.to validate_presence_of :author_id }
  it { is_expected.to validate_presence_of :course_id }

  describe 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:course) }
  end
end
