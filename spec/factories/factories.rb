FactoryGirl.define do

  factory :user do
    name              "kareemgrant"
    access_token      "318092c9fa74468dba0507844d29cf4d"
    uid               "5234295"
  end

  factory :activity do
    user

    provider          "RunKeeper"
    duration          3138.844
    distance          10622.2704823343
    detail_present    false
    sequence(:activity_id) { |n| "#{n}769314" }
  end


end
