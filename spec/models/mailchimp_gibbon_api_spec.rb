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
#       test_list = @gibbon.lists(ENV["MAILCHIMP_LIST_ID_TEST"]).retrieve 
#       expect(test_list['name']).to eq "rails list"
#     end
#   end

# end
