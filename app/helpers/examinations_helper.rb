module ExaminationsHelper
  def boolean(var)
    if var
      fa_icon 'check-circle', class: 'true'
    else
      far_icon 'circle', class: 'false'
    end
  end
end
