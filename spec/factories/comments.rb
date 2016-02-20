FactoryGirl.define do
  factory :comment do
    body 'My incredibly important comment.'

    factory :invalid_comment do
      body nil
    end

  end
end
