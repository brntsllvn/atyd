require 'rails_helper'

feature 'visit homepage' do

  scenario 'success' do
    visit '/'
    expect(page).to have_content 'Adventures'
  end

end