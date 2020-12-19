require 'rails_helper'

RSpec.describe Category do
  describe 'Validation of Vote' do
    let(:category) { Category.new(name: 'Sports') }

    subject { Category.create(name: 'Sports', priority: 1) }

    it 'should have many article_categories' do
      t = Category.reflect_on_association(:article_categories)
      expect(t.macro).to eq(:has_many)
    end

    it 'confirms count of categories increase by 1' do
      expect { subject }.to change { Category.count }.by(1)
    end

    it 'Ensure the name length is more than 3' do
      subject.name = 'aa'
      expect(subject.valid?).to_not eq(true)
    end

    it 'Ensure the name length is less than 20' do
      subject.name = 'a' * 21
      expect(subject.valid?).to_not eq(true)
    end

    it 'Ensure the priority is present' do
      category.save
      expect(category.valid?).to_not eq(true)
    end
  end
end
