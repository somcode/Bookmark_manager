feature 'Updating a link' do
  scenario 'A user can update a link' do
    visit('/update-link/2')

    fill_in('url', with: "http://www.snakersacademy.com")
    fill_in('title', with: "Snakers Academy")

    click_button 'submit'
    expect(current_path).to eq '/'
    expect(page).not_to have_content 'Google'
    expect(page).to have_content 'Snakers Academy'
  end
end
