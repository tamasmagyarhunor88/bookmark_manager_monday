feature 'URI invalid' do
  scenario 'displays error message' do
    visit '/'
    fill_in 'new_link', with: 'I_am_not_a_link'
    click_button 'Save link'
    expect(page).to have_content 'URI not valid'
  end

  scenario 'URI not added to bookmarks' do
    visit '/'
    fill_in 'new_link', with: 'I_am_not_a_link'
    click_button 'Save link'
    expect(page).not_to have_content 'I_am_not_a_link'
  end
end
