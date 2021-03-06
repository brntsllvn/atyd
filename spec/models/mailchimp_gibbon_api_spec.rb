# require 'rails_helper'

# RSpec.describe Gibbon::APIRequest, type: :model do

#   describe "gibbon" do
#     before :each do
#       @gibbon = Gibbon::Request.new
#     end

#     it "returns instance of Gibbon::Request" do
#       expect(@gibbon).to be_an_instance_of(Gibbon::Request)
#     end

#     it "returns array of lists" do
#       lists = @gibbon.lists.retrieve
#       expect(lists).to be_a(Hash)
#       expect(lists.count).to eq 3 # my lists + mailchimp admin list
#     end

#     it "returns test list" do
#       list = @gibbon.lists(ENV["MAILCHIMP_LIST_ID_TEST"]).retrieve 
#       expect(list['name']).to eq "rails list"
#       num_members = list['stats']['member_count']
#     end
    
#     it "adds a user to the test list" do 
#       subscriber_hash = Digest::MD5.hexdigest("abc123@gmail.com".downcase)
#       params = {:status=>"subscribed", :language=>"en", :email_address=>"abc123@gmail.com", :merge_fields=>{:FNAME=>"Jimmy", :LNAME=>"Bean"}}

#       @gibbon.lists(ENV["MAILCHIMP_LIST_ID_TEST"]).members(subscriber_hash).upsert(body: params)

#       list = @gibbon.lists(ENV["MAILCHIMP_LIST_ID_TEST"]).retrieve 
#       num_members = list['stats']['member_count']
#       expect(num_members).to eq 1      

#       # @gibbon.lists(ENV["MAILCHIMP_LIST_ID_TEST"]).members("bbb@bar.com").update(
#       #   body: { status: "unsubscribed" })

#       # list = @gibbon.lists(ENV["MAILCHIMP_LIST_ID_TEST"]).retrieve 
#       # num_members = list['stats']['member_count']

#       # expect(num_members).to eq 0
#     end
    
#   end
# end
