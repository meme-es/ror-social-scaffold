require_relative '../rails_helper'

RSpec.describe Friendship, type: :model do

 

  describe 'associations checks' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end
end