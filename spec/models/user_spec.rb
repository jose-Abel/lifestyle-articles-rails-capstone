require 'rails_helper'

RSpec.describe User do
  describe 'Validation of User' do
    subject { User.create(name: 'John') }

    it 'should have many articles' do
      t = User.reflect_on_association(:articles)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many votes' do
      t = User.reflect_on_association(:votes)
      expect(t.macro).to eq(:has_many)
    end

    it 'confirms the name of the new user' do
      expect(subject.name).to eq('john')
    end

    it 'Ensure the name of the User not to be empty' do
      expect(subject.name).to_not be_empty
    end

    it 'Ensure the name length is less than 10' do
      subject.name = 'a' * 11
      expect(subject.valid?).to_not eq(true)
    end

    it 'confirms count of users increase by 1' do
      expect { User.create(name: 'John') }.to change { User.count }.by(1)
    end
  end
end
