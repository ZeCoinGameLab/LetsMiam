module RestaurantsHelper
  def convert_score_to_star(score)
    return if score.nil?

    content = ''
    (score.to_f / 2).truncate.times do
      content += '<i class="bi bi-star-fill gold"></i> '
    end
    content += '<i class="bi bi-star-half gold"></i> ' unless score.even?
    ((10.0 - score.to_f) / 2).truncate.times do
      content += '<i class="bi bi-star gold"></i> '
    end
    content.html_safe
  end
end
