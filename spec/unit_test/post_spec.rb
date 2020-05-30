# rubocop:disable Layout/LineLength
require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations checks' do
    it { should validate_length_of(:content).is_at_most(1000).with_long_message('1000 characters in post is the maximum allowed.') }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'associations checks' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end
end
# rubocop:enable Layout/LineLength
