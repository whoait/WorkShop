# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Developer search form', type: :system do
  before do
    @developer = create(:developer, email: 'hoa@gmail.com')
    create(:developer, email: 'hoa1@gmail.com')
    @language = create(:language, code: 'En')
    create(:language, code: 'Vi')
    @programming_language = create(:programming_language, name: 'Ruby')
    create(:programming_language, name: 'Java')
    create(:developer_language, developer_id: @developer.id, language_id: @language.id)
    create(:developer_programming_language, developer_id: @developer.id, programming_language_id: @programming_language.id)
    visit root_path
  end

  it 'first load page and search with no param' do
    expect(page).to have_content 'Developers'
    expect(page).to have_button 'Search'
    expect(page).to have_content 'hoa@gmail.com'
    expect(page).to have_content 'hoa1@gmail.com'
  end

  it 'search with no param' do
    click_on 'Search'
    expect(page).to have_content 'hoa@gmail.com'
    expect(page).to have_content 'hoa1@gmail.com'
  end

  it 'search with correct param email' do
    fill_in 'developer_search_form[email]', with: @developer.email
    click_on 'Search'
    expect(page).to have_content @developer.email
    expect(page).to have_content @programming_language.name
    expect(page).to have_content @language.code
  end

  it 'search with correct param language' do
    select 'En', from: 'developer_search_form_language_id'
    click_on 'Search'
    expect(page).to have_content @developer.email
    expect(page).to have_content @programming_language.name
    expect(page).to have_content @language.code
  end

  it 'search with incorrect param language' do
    select 'Vi', from: 'developer_search_form_language_id'
    click_on 'Search'
    expect(page).to have_no_content @developer.email
  end

  it 'search with correct param programming language' do
    select 'Ruby', from: 'developer_search_form_programming_language_id'
    click_on 'Search'
    expect(page).to have_content @developer.email
    expect(page).to have_content @programming_language.name
    expect(page).to have_content @language.code
  end

  it 'search with incorrect param programming language' do
    select 'Java', from: 'developer_search_form_programming_language_id'
    click_on 'Search'
    expect(page).to have_no_content @developer.email
  end

  it 'search with correct param language and programming language' do
    select 'Ruby', from: 'developer_search_form_programming_language_id'
    select 'En', from: 'developer_search_form_language_id'
    click_on 'Search'
    expect(page).to have_content @developer.email
    expect(page).to have_content @programming_language.name
    expect(page).to have_content @language.code
  end
end
