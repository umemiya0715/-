FactoryBot.define do
  factory :dragon do
    name { 'イエロードラゴン' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/yellowDragon.png'), 'image/png') }
    explanation { 'おしゃれで見栄っ張りな王様' }
    personality { 'このドラゴンが心の中に住んでるあなたは、誰かに自分を認めてほしい気持ちが強いかも。
    色々とおしゃれして見た目を良くしようとしているけど、あまり結果には結びついてはいない様子。' }
    advice { 'ツイートの内容には力が入っている様子。行動力は低めなので、認められたければもう少し積極的になった方がいいかも。' }
  end
end