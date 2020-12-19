RSpec.describe ArticleCategory do
  describe 'Validation of ArticleCategory' do
    let(:pic) { File.open('spec/fixtures/ford-mustang-1970.jpg') }

    let(:article) { Article.create(title: 'Testing', text: 'Creating testing article', author_id: user.id, image: pic) }

    let(:category) { Category.create(name: 'Sports', priority: 1) }

    let(:article_category) { ArticleCategory.create(article_id: article.id, category_id: category.id) }

    it 'should belong to article' do
      expect { ArticleCategory belong_to(:article) }
    end

    it 'should belong to category' do
      expect { ArticleCategory belong_to(:category) }
    end
  end
end
