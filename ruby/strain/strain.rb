class Array

  def keep
    map { |e| e if yield(e) }.compact
  end

  def discard(&block)
    self - keep(&block)
  end

end
