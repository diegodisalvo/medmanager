module ExaminationsHelper
  def boolean(var)
    if var
      fa_icon 'check-circle', class: 'true'
    else
      fa_icon 'times-circle', class: 'false'
    end
  end
end
