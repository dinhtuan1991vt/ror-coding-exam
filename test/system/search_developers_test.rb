require 'application_system_test_case'

class SearchDevelopersTest < ApplicationSystemTestCase
  test 'search by programming language return properly' do
    visit root_path
    fill_in 'programming_language', with: 'ruby'
    click_button 'Search'
    assert_selector('table tbody tr', count: 2)
    all('table tbody tr > td:nth-child(2)').each do |td|
      assert td.has_text?('ruby')
    end
  end

  test 'search by programming language return nothing' do
    visit root_path
    fill_in 'programming_language', with: 'python'
    click_button 'Search'
    assert_selector('table tbody tr', count: 0)
  end

  test 'search by language return properly' do
    visit root_path
    fill_in 'language', with: 'en'
    click_button 'Search'
    assert_selector('table tbody tr', count: 2)
    all('table tbody tr > td:nth-child(3)').each do |td|
      assert td.has_text?('en')
    end
  end

  test 'search by language return nothing' do
    visit root_path
    fill_in 'language', with: 'ja'
    click_button 'Search'
    assert_selector('table tbody tr', count: 0)
  end

  test 'search by programming language and language return properly' do
    visit root_path
    fill_in 'language', with: 'en'
    fill_in 'programming_language', with: 'ruby'
    click_button 'Search'
    assert_selector('table tbody tr', count: 1)
    all('table tbody tr > td:nth-child(2)').each do |td|
      assert td.has_text?('ruby')
    end
    all('table tbody tr > td:nth-child(3)').each do |td|
      assert td.has_text?('en')
    end
  end

  test 'search by programming language and language return nothing' do
    visit root_path
    fill_in 'language', with: 'ja'
    fill_in 'programming_language', with: 'javascript'
    click_button 'Search'
    assert_selector('table tbody tr', count: 0)
  end
end