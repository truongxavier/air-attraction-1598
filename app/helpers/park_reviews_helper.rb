# frozen_string_literal: true

# class ReviewsHelper
module ParkReviewsHelper
  def render_stars(rating)
    full_stars = rating.floor
    half_star = (rating - full_stars).round(1) == 0.5

    stars = ''
    full_stars.times { stars += '★' }
    stars += '☆' if half_star

    stars.html_safe
  end
end
