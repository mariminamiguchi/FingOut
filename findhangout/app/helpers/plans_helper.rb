module PlansHelper
  def render_with_hashtags(outline)
    outline.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/plan/hashtag/#{word.delete("#")}"}.html_safe
  end
end