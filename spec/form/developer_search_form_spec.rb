# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeveloperSearchForm do
  describe '#search' do
    before do
      create :developer, email: 'hoa1@gmail.com'
      @language = create(:language, code: 'en')
      @programming_language = create(:programming_language, name: 'Ruby')
      create :developer,
             email: 'hoa@gmail.com',
             languages: [@language], programming_languages: [@programming_language]
    end

    context 'with no params' do
      it 'returns all developer' do
        form = DeveloperSearchForm.new({})
        expect(form.search.size).to eq(2)
      end
    end

    context 'with have language' do
      it 'returns one developer' do
        form = DeveloperSearchForm.new(language_id: @language.id)
        expect(form.search.size).to eq(1)
      end
    end

    context 'with have programming_language' do
      it 'returns one developer' do
        form = DeveloperSearchForm.new(programming_language_id: @programming_language.id)
        expect(form.search.size).to eq(1)
      end
    end

    context 'with have programming_language and language' do
      it 'returns one developer' do
        form = DeveloperSearchForm.new(language_id: @language.id, programming_language_id: @programming_language.id)
        expect(form.search.size).to eq(1)
      end
    end

    context 'with no existing language' do
      it 'returns no developer' do
        form = DeveloperSearchForm.new(language_id: 10, programming_language_id: @programming_language.id)
        expect(form.search.size).to eq(0)
      end
    end

    context 'with no existing programming_language' do
      it 'returns no developer' do
        form = DeveloperSearchForm.new(language_id: @language.id, programming_language_id: 'developer_params')
        expect(form.search.size).to eq(0)
      end
    end
  end
end
