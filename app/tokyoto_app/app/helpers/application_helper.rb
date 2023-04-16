module ApplicationHelper

  def income_to_db(param)
    param.to_i * 10000
  end

  def income_to_view(data)
    data.to_i / 10000
  end

  def age(date)
    (Date.today.strftime('%Y%m%d').to_i - date.strftime('%Y%m%d').to_i) / 10000
  end

  def default_meta_tags
    {
      site: 'kocotto',
      title: 'あなたに合った支援が探せるサービス',
      reverse: true,
      charset: 'utf-8',
      description: 'kocottoでは、あなたにあった支援が探せます。',
      keywords: '制度,支援,1人親',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('kocotto_logo.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('kocotto_logo.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
