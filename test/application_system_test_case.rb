require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :headless_chrome
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
end
