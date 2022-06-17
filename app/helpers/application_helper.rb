module ApplicationHelper
  def default_meta_tags
    {
      title: "ドラッター | Dratter",
      description: "あなたのTwitterの使い方をドラゴンが見直してくれるサービスです。",
      keywords: "ドラッター,Dratter,ドラゴン,twitter診断",
      charset: "UTF-8",
      og: {
        title: :title,
        description: :description,
        type: "website",
        url: 'https://www.dragon-twitter-analysis.com',
        image: 'https://www.dragon-twitter-analysis.com/img/ogpImage.png',
        locale: "ja_JP"
      },
      twitter: {
        site: "@umesho0415",
        card: "summary_large_image",
      }
    }
  end
end
