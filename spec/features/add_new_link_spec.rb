feature "Add new links" do
  scenario "See the added new link" do
    link = "https://www.gmail.com"
    title = "gmail"
    visit "/"
    fill_in :new_link, with: link
    fill_in :title, with: title
    click_button "Save link"
    expect(page).to have_content title
  end
end
