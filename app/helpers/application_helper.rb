module ApplicationHelper
  def default_meta_tags
    {
      title: 'ドラッター',
      description: 'あなたのTwitterの使い方をドラゴンが見直してくれるサービスです。',
      keywords: 'ドラッター,dratter,ドラゴン,twitter',
      charset: 'UTF-8',
      og: {
        title: 'ドラッター',
        description: '診断したいTwitterIDを入力してあなたの心の中のドラゴンを診断しよう',
        type: 'website',
        url: '',
        image: '',
        locale: 'ja_JP'
      },
      twitter: {
        site: '@dratter',
        card: 'summary_large_image'
      }
    }
  end
end
