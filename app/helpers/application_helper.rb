module ApplicationHelper
  def strip_tags(html)
    self.class.full_sanitizer.sanitize(html, encode_special_chars: false)
  end


end
