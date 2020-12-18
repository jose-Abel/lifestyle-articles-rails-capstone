require 'rails_helper'

RSpec.describe Article do
  describe 'Validation of Article' do
    let(:user) { User.create(name: 'Johny', email: 'johny@domain.com', password: 'password') }

    subject { Post.create(content: 'Test', user_id: user.id) }

    it 'confirms count of posts increase by 1' do
      expect { subject }.to change { Post.count }.by(1)
    end

    it 'Ensure the content length is less than 1000' do
      subject.content = 'a' * 1001
      expect(subject.valid?).to_not eq(true)
    end

    it 'should belong to user' do
      expect { Post belong_to(:user) }
    end

    it 'should have many comments' do
      t = Post.reflect_on_association(:comments)

      expect(t.macro).to eq(:has_many)
    end

    it 'should have many likes' do
      t = Post.reflect_on_association(:likes)

      expect(t.macro).to eq(:has_many)
    end
  end
end