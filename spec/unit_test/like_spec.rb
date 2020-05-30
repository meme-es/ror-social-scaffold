require_relative '../rails_helper'

RSpec.describe Like, type: :model do

  describe 'validations checks' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end

  describe 'associations checks' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end