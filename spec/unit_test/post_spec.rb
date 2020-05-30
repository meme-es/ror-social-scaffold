require_relative '../rails_helper'

RSpec.describe Post, type: :model do
  
  describe 'validations checks' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'associations checks' do
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end

end