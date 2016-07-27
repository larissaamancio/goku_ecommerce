FactoryGirl.define do
  factory :customer do
    name "John"
    zip_code  "03977406"
    street "das Americas"
    state "SP"
    city "Sao Paulo"
    neighborhood "Bela Vista"
    number "56"
    
  end

  factory :user do
    email "larissa@teste.com"
    password "password"
    password_confirmation "password"
  end

end

