FactoryGirl.define do
  factory :user do
    provider "MyString"
    uid "MyString"
    name "MyString"
    oauth_token "MyString"
    email 'foo@bar.com'
    oauth_expires_at "2016-02-18 19:05:33"

    factory :admin do
      email ENV['ADMIN_EMAIL']
    end

  end
end
