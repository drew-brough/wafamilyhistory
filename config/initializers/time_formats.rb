Time::DATE_FORMATS[:pretty] = lambda do |time|
  time.strftime('%I:%M%p').gsub(/\A0*/, '').downcase
end
