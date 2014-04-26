module ConvertBools
  def to_bool(str)
    return true if %w(true 1 yes on t).include? str
    return false if %w(false 0 no off f).include? str
    nil
  end
end