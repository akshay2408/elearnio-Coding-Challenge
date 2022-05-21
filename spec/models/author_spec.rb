require 'rails_helper'

RSpec.describe Author, type: :model do

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :bio }
  it { is_expected.to validate_length_of(:bio).is_at_most(500)}
  it { is_expected.to validate_presence_of :dob }

  describe "associations" do
    it{ is_expected.to have_many(:talents) }
    it{ is_expected.to have_many(:courses).through(:talents)}
  end
end
