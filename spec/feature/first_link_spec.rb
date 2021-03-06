feature 'links page' do
  Link.create(link_address: "first_link", link_name: "this is the first link")

  scenario 'first page is actually loading' do
    visit '/'
    expect(page.status_code).to eq 200
  end

  scenario 'first page has a button' do
    visit '/'
    expect(page).to have_button "click here"
  end

  scenario 'link page has a default link' do
    visit '/'
    click_button "click here"
    expect(page).to have_link 'this is the first link'
    Link.all.destroy
  end

end
