require 'rails_helper'
require 'pry'

feature 'subscribe to email list' do

    # scenario 'success' do

    #   user = create(:user)
    #   sign_in_with_google user

    #   gibbon = Gibbon::Request.new
    #   members = gibbon.lists(ENV['MAILCHIMP_LIST_ID_TEST']).members.retrieve
    #   expect(members).not_to include user.email

    #   visit '/'

    #   click_link 'Sign up for weekly comic notifications'
    #   expect(page).to have_context 'Successfully sucscribed!'
    #   expect(members).to include user.email
    #   # garbarge-collect

    # end

    # scenario 'fail' do
    #   visit '/'
    #   # list should not contain user
    #   click_button('Subscribe')
    #   expect(page).to have_contect 'Something went wrong'
    #   # list should not contain user
    #   # error message should be: ___
    # end


# context 'user not signed in' do
#     scenario 'success' do
#       visit '/'
#       expect(page).to have_content 'Sign up for weekly comic notifications'
#       # list should not contain user
#       click_button('Subscribe')
#       # sign in user
#       expect(page).to have_context 'Successfully sucscribed!'
#       # list should contain user
#       # garbarge-collect
#     end

#     scenario 'sign in fail' do
#       visit '/'
#       expect(page).to have_content 'Sign up for weekly comic notifications'
#       # list should not contain user
#       click_button('Subscribe')
#       # sign in user
#       expect(page).to have_contect 'Something went wrong'
#       # error should be: ___
#     end

#     scenario 'mail chimp fail' do
#       visit '/'
#       expect(page).to have_content 'Sign up for weekly comic notifications'
#       # list should not contain user
#       click_button('Subscribe')
#       # sign in user
#       expect(page).to have_contect 'Something went wrong'
#       # mail chimp error code should be: ___
#     end
#   end

end