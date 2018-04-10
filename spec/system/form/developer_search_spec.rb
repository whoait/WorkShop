# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Developer search form', type: :system do
  before do
    @developer = create :developer, email: 'hoa1@gmail.com'
    @language = create(:language, code: 'En')
    @programming_language = create(:programming_language, name: 'Ruby')
    create(:language, code: 'Vi')
    create(:programming_language, name: 'Java')
    create :developer,
           email: 'hoa@gmail.com',
           languages: [@language], programming_languages: [@programming_language]
    visit root_path
  end
  
  it 'search with param language' do
    select @language.code, from: 'developer_search_form_language_id'
    click_on 'Search'
    expect(page).to have_content 'hoa@gmail.com'
    expect(page).to have_content @programming_language.name
    expect(page).to have_content @language.code
  end

  it 'search with param programming language' do
    select @programming_language.name, from: 'developer_search_form_programming_language_id'
    click_on 'Search'
    expect(page).to have_content 'hoa@gmail.com'
    expect(page).to have_content @programming_language.name
    expect(page).to have_content @language.code
  end

  it 'search with param language and programming language' do
    select @programming_language.name, from: 'developer_search_form_programming_language_id'
    select @language.code, from: 'developer_search_form_language_id'
    click_on 'Search'
    expect(page).to have_content 'hoa@gmail.com'
    expect(page).to have_content @programming_language.name
    expect(page).to have_content @language.code
  end
end
