FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {"password"}
    password_confirmation {"password"}
    phone {Faker::PhoneNumber.cell_phone}
    role {User.roles[:guess]}
  end

  factory :admin, class: User do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {"password"}
    password_confirmation {"password"}
    phone {Faker::PhoneNumber.cell_phone}
    role {User.roles[:admin]}
  end
end
