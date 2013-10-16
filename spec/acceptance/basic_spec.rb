# -*- encoding : utf-8 -*-
require 'guacamole'

class Article
  include Guacamole::Model

  attribute :title, String

  validates :title, presence: true
end

class ArticlesCollection
  include Guacamole::Collection
end

describe 'ModelBasics' do

  describe Article do
    it 'should allow setting its title' do
      subject.title = 'This is my fancy article'

      expect(subject.title).to eq('This is my fancy article')
    end

    it 'should have key and rev attributes' do
      expect(subject.key).to be_nil
      expect(subject.rev).to be_nil
    end

    it 'should have timestamp attributes which are empty' do
      expect(subject.created_at).to be_nil
      expect(subject.updated_at).to be_nil
    end

    it 'should validate its attributes' do
      expect(subject.valid?).to be_false
      subject.title = 'The Legend of Zelda'
      expect(subject.valid?).to be_true
    end

    it 'should know its model name' do
      # This test passes when you only require ActiveModel::Validations
      expect(subject.class.model_name).to eq 'Article'
    end

    it 'should convert itself to params' do
      subject.key = 'random_number'
      expect(subject.to_param).to eq 'random_number'
    end
  end
end

describe 'CollectionBasics' do

  describe ArticlesCollection do

    it 'should provide a method to find documents by key and return the appropriate model' do
      pending 'Not yet implemented'

      # TODO: To make this test work we need to implement the following things
      #   * Create test data
      #   * Setup the test database and ensure it is in a defined state
      #   * Implement the #== method on Guacamole::Model
      found_model = subject.by_key some_article.key
      expect(found_model).to eq some_article
    end

  end

end
