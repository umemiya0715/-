module ApplicationHelper
  def default_meta_tags
    {
      site: "ドラッター | Dratter",
      title: "ドラッター | Dratter",
      description: "あなたのTwitterの使い方をドラゴンが見直してくれるサービスです。",
      keywords: "ドラッター,Dratter,ドラゴン,twitter診断",
      charset: "UTF-8",
      canonical: "http://dragon-twitter-analysis.herokuapp.com/"
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: '',
        image: '',
        locale: "ja_JP"
      },
      twitter: {
        site: "@dratter",
        card: "summary_large_image",
      }
    }
  end
end
