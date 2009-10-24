HoptoadNotifier.configure do |config|
  config.api_key = Setting.current && Setting.current.hoptoad_api_key
end