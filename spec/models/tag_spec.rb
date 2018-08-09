RSpec.describe Tag do
  subject { FactoryBot.build(:tag) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(2) }
  it { is_expected.to validate_length_of(:name).is_at_most(30) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
