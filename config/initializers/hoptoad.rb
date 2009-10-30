HoptoadNotifier.configure do |config|
  begin
    config.api_key = Setting.current && Setting.current.hoptoad_api_key
  rescue => e
    RAILS_DEFAULT_LOGGER.debug "hoptoad error: #{e}"
  end
end