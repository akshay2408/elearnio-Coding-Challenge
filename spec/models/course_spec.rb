require 'rails_helper'

RSpec.describe Course, type: :model do

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_length_of(:description).is_at_most(500)}
  it { is_expected.to validate_presence_of :start_date }
  it { is_expected.to validate_presence_of :end_date }

  describe "associations" do
    it{ is_expected.to have_many(:talents) }
    it{ is_expected.to have_many(:authors).through(:talents)}
  end
end
