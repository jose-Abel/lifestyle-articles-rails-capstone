require 'rails_helper'

RSpec.describe Vote do
  describe 'Validation of Vote' do
    let(:user) { User.create(name: 'Johny')}

    let(:pic) { File.open('spec/fixtures/ford-mustang-1970.jpg') }

    let(:article) { Article.create(title: 'Testing article', text: 'An article to test Article model functionalities', author_id: user.id, image: pic) }

    let(:vote) { Vote.create(user_id: user.id, article_id: article.id) }

    subject { Vote.create(user_id: user.id, article_id: article.id) }

    it 'should belong to user' do
      expect { Vote belong_to(:user) }
    end

    it 'should belong to article' do
      expect { Vote belong_to(:article) }
    end

    it 'confirms count of votes increase by 1' do
      expect { subject }.to change { Vote.count }.by(1)
    end

    it 'confirms uniqueness of user id' do
      subject
      expect(vote.valid?).to_not eq(true)
    end
  end
end
