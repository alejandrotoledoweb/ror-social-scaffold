require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @requester = User.create(name: 'Juan Andres', email: 'juan@gmail.com',
                             password: 'secret')
    @requestee = User.create(name: 'Alex', email: 'alex@gmail.com',
                             password: 'password')
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end

  describe 'validations' do
    subject { Friendship.create(user_id: @requester.id, friend_id: @requestee.id, confirmed: false) }
    it { should validate_presence_of(:friend_id) }
    it { should validate_presence_of(:user_id) }
  end
end