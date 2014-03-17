module PagesHelper
  def truncate_review(review)
    output = truncate(review.body, length: 145)
    output += link_to('(more)', review_path(review)) if review.body.size > 144
    output.html_safe
  end
end
