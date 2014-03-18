module PagesHelper
  def truncate_review(review)
    output = truncate(review.body, length: 140)
    output += link_to('(more)', review_path(review)) if review.body.size > 140
    output.html_safe
  end
end
