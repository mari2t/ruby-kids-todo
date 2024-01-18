module ApplicationHelper
    def theme_color(theme_name)
      case theme_name
      when '恐竜'
        '#b3d7de' 
      when 'プリンセス'
        '#d8ccd3' 
      else
        '#e9c680' # デフォルト色
      end
    end
  end
  