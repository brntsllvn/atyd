require 'rails_helper'
require 'pry'

feature 'subscribe to email list' do

  before :each do
    @visitor_first = 'Smokey'
    @visitor_last = 'T. Bear'
    @visitor_email = 'SmokeyT@Bear.com'.downcase

    gibbon = Gibbon::Request.new
    members = gibbon.lists(ENV['MAILCHIMP_LIST_ID_REAL']).members.retrieve(params: {status: 'subscribed', count: '5000'}).to_s

    if members.include? @visitor_email
      gibbon.lists(ENV['MAILCHIMP_LIST_ID_REAL']).members(Digest::MD5.hexdigest(@visitor_email)).update(body: { status: "unsubscribed" })
    end
  end

  scenario 'success' do
    gibbon = Gibbon::Request.new
    members = gibbon.lists(ENV['MAILCHIMP_LIST_ID_REAL']).members.retrieve(params: {status: 'subscribed', count: '5000'}).to_s
    expect(members).not_to include @visitor_first
    expect(members).not_to include @visitor_last
    expect(members).not_to include @visitor_email

    visit '/'

    fill_in :first_name, with: @visitor_first
    fill_in :last_name, with: @visitor_last
    fill_in :email, with: @visitor_email
    click_on 'Submit'

    expect(page).to have_content 'Subscribed. Thanks!'

    members = gibbon.lists(ENV['MAILCHIMP_LIST_ID_REAL']).members.retrieve(params: {status: 'subscribed', count: '5000'}).to_s
    expect(members).to include @visitor_first
    expect(members).to include @visitor_last
    expect(members).to include @visitor_email
  end

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