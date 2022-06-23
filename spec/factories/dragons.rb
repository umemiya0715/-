FactoryBot.define do
  factory :dragon do
    sequence(:name, 'dragon_1')
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/yellowDragon.png'), 'image/png') }
    sequence(:explanation, 'explanation_1')
    sequence(:personality, 'personality_1')
    sequence(:advice, 'advice_1')
  end

  trait :red do
    id { 1 }
    name { 'レッドドラゴン' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/redDragon.png'), 'image/png') }
    explanation { '炎のように熱く燃えるヤツ' }
  end

  trait :yellow do
    id { 2 }
    name { 'イエロードラゴン' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/yellowDragon.png'), 'image/png') }
    explanation { 'おしゃれで見栄っ張りな王様' }
  end
end