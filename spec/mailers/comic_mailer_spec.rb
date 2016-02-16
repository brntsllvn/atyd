require "rails_helper"

RSpec.describe ComicMailer, type: :mailer do
  before :each do
    ActionMailer::Base.deliveries = []
  end

  it "#new_comic" do
    ComicMailer.new_comic.deliver_now
    expect(last_email.to).to eq ['brntsllvn@gmail.com']
    expect(last_email.from).to eq ['acetheyellowdog@gmail.com']
    expect(last_email.subject).to eq 'Ace The Yellow Dog: New Comic'
  end
end
