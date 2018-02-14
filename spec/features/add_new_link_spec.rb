feature "Add new links" do
  scenario "See the added new link" do
    link = "https://www.gmail.com"
    visit "/"
    fill_in :new_link, with: link
    click_button "Save link"
    expect(page).to have_content link
  end
end
