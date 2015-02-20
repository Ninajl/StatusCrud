require "rails_helper"

describe 'user can CRUD Facebooks' do
  scenario 'user can create Facebook' do
    visit '/'
    click_on 'Create Facebook'
    fill_in 'User', :with => 'nina'
    fill_in 'Status', :with => 'capy_test'
    click_on 'Create Facebook'
    expect(page).to have_content('capy_test')
    Facebook.destroy_all
  end
  scenario 'user can view Facebooks show page' do
    @facebook = Facebook.create(user: "finn", status: "hungry")
    visit "/facebooks/#{@facebook.id}"
    expect(page).to have_content('hungry')
    Facebook.destroy_all
  end
  scenario 'user can update a Facebook' do
    @facebook = Facebook.create(user: "nina", status: "hungry")
    visit "/"
    click_on "Edit Facebook"
    fill_in 'Status', :with => 'hangry'
    click_on "Update Facebook"
    expect(page).to have_content('hangry')
    Facebook.destroy_all
  end
  scenario 'user can delete a Facebook' do
    @status = Facebook.create(user: "nina", status: "hungry")
    visit "/"
    click_on "Delete Facebook"
    expect(page).to have_no_content('hungry')
  end
end
