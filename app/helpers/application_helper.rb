module ApplicationHelper
  def background_image_style(theme_name)
    image_url = case theme_name
                when 'プリンセス'
                  asset_path('princess_background.jpg')
                when '恐竜'
                  asset_path('dinosaur_background.jpg')
                else
                  asset_path('default_background.jpg')
                end

    "background: url(#{image_url}) no-repeat center center; background-size: cover;"
  end
end
