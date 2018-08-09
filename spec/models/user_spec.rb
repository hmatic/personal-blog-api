RSpec.describe User do
  subject { FactoryBot.build(:user, password: nil) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_length_of(:first_name).is_at_least(2) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_length_of(:last_name).is_at_least(2) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to define_enum_for(:role).with([:user, :moderator, :admin]) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(8) }
  it { is_expected.to validate_length_of(:password).is_at_most(30) }

  it 'is invalid when email is not in valid format' do
    user = build(:user, email: 'user@email')
    user.valid?
    expect(user.errors[:email]).to include('is invalid')
  end
end
