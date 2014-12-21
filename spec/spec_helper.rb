RSpec.configure do |config|
  config.color     = true
  config.tty       = true
  config.formatter = :documentation

  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
