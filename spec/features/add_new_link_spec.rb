feature 'Adding a new link' do
  scenario 'A user can add a link to Bookmark Manager' do
    visit('/add-new-link')
    fill_in('url', with: 'http://testlink.com')
    fill_in('title', with: 'Test Link')
    click_button('Submit')
    expect(page).to have_content 'Test Link'
  end

  scenario 'The link must be a valid URL' do
    visit('/add-new-link')
    fill_in('url', with: 'not a real link')
    fill_in('title', with: 'not a real link')
    click_button('Submit')

    expect(page).not_to have_content"not a real link"
    expect(page).to have_content"You must submit a valid URL."
  end
end
