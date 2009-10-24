class Setting < ActiveRecord::Base
  def self.current
    Setting.last
  end
end
