FactoryBot.define do
  factory :dragon do
    sequence(:name, 'dragon_1')
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/yellowDragon.png'), 'image/png') }
    sequence(:explanation, 'explanation_1')
    sequence(:personality, 'personality_1')
    sequence(:advice, 'advice_1')
    sequence(:affinity, 'affinity_1')
  end

  trait :red do
    id { 1 }
    name { 'レッドドラゴン' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/redDragon.png'), 'image/png') }
    explanation { 'アドライグゴッホ' }
    affinity { 'サマエル' }
  end

  trait :yellow do
    id { 2 }
    name { 'イエロードラゴン' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/yellowDragon.png'), 'image/png') }
    explanation { 'ファフニール' }
    affinity { 'ファフナー' }
  end
end