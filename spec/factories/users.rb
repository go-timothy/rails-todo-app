require "rails_helper"

FactoryBot.define do
    factory :user do |f|
        f.id { 1 }
        f.email { "admin@gmail.com" }
    end
end
  