require 'rails_helper'

RSpec.describe Article do
  describe 'Validation of Article' do
    let(:user) { User.create(name: 'Johny') }

    let(:pic) { File.open('spec/fixtures/ford-mustang-1970.jpg') }

    subject { Article.create(title: 'Testing article', text: 'An article to test Article model functionalities', author_id: user.id, image: pic) }

    it 'confirms count of articles increase by 1' do
      expect { subject }.to change { Article.count }.by(1)
    end
    
    it 'Ensure the title length is more than 6' do
      subject.title = 'a' * 5
      expect(subject.valid?).to_not eq(true)
    end

    it 'Ensure the title length is less than 100' do
      subject.title = 'a' * 101
      expect(subject.valid?).to_not eq(true)
    end

    it 'Ensure the text length is more than 10' do
      subject.text = 'a' * 9
      expect(subject.valid?).to_not eq(true)
    end

    it 'Ensure the text length is less than 10001' do
      subject.text = 'a' * 10001
      expect(subject.valid?).to_not eq(true)
    end

    it 'should belong to user' do
      expect { Article belong_to(:user) }
    end

    it 'should have many votes' do
      t = Article.reflect_on_association(:votes)
      expect(t.macro).to eq(:has_many)
    end
  end
end