# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeveloperSearchForm do
  describe '#search' do
    before do
      @developer = create :developer, email: 'hoa1@gmail.com'
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

    context 'with have email' do
      it 'returns one developer' do
        from = DeveloperSearchForm.new(email: 'hoa@gmail.com')
        expect(from.search.size).to eq(1)
      end
    end

    context 'with have language' do
      it 'returns one developer' do
        from = DeveloperSearchForm.new(language_id: @language.id)
        expect(from.search.size).to eq(1)
      end
    end

    context 'with have programming_language' do
      it 'returns one developer' do
        from = DeveloperSearchForm.new(programming_language_id: @programming_language.id)
        expect(from.search.size).to eq(1)
      end
    end

    context 'with have programming_language and language' do
      it 'return one developer' do
        from = DeveloperSearchForm.new(language_id: @language.id, programming_language_id: @programming_language.id)
        expect(from.search.size).to eq(1)
      end
    end

    context 'with no existing email' do
      it 'return no developer' do
        from = DeveloperSearchForm.new(email: 'xx@gmail.com')
        expect(from.search.size).to eq(0)
      end
    end

    context 'with no existing language' do
      it 'return no developer' do
        from = DeveloperSearchForm.new(language_id: 10, programming_language_id: @programming_language.id)
        expect(from.search.size).to eq(0)
      end
    end

    context 'with no existing programming_language' do
      it 'return no developer' do
        from = DeveloperSearchForm.new(language_id: @language.id, programming_language_id: 0)
        expect(from.search.size).to eq(0)
      end
    end
  end
end
