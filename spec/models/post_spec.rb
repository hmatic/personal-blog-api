RSpec.describe Post do
  subject { build(:post) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content).is_at_least(30) }
  it { is_expected.to define_enum_for(:status).with([:draft, :published]) }

  context 'when status is draft and publish date is present' do
    it 'contains error on published_on attribute' do
      post = build(:post, status: :draft, published_on: Time.current)
      post.valid?
      expect(
        post.errors[:published_on]
      ).to include('can not be present if status is draft')
    end
  end

  context 'when status is published and publish date is blank' do
    it 'contains error on published_on attribute' do
      post = build(:post, status: :published, published_on: nil)
      post.valid?
      expect(
        post.errors[:published_on]
      ).to include('can not be present if status is draft')
    end
  end
end
