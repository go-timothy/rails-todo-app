require "rails_helper"

FactoryBot.define do
    factory :task do |f|
        f.title { "todo 100" }
        f.detail { "todo 100 detail ...." }
        f.user_id { 1 }
    end
end
  