require "rails_helper"

RSpec.describe ComicMailer, type: :mailer do
  before :each do
    ActionMailer::Base.deliveries = []
  end

  it "#new_comic" do
    ComicMailer.new_comic.deliver_now
    expect(ActionMailer::Base.deliveries.last.to).to eq ['brntsllvn@gmail.com']
    expect(ActionMailer::Base.deliveries.last.from).to eq ['acetheyellowdog@gmail.com']
    expect(ActionMailer::Base.deliveries.last.subject).to eq 'Ace The Yellow Dog: New Comic'
  end
end
