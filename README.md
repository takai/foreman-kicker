# Foreman::Kicker
## Usage
### RSpec

```ruby
RSpec.configure do |config|
  config.before(:suite) do
    Foreman::Kicker.kick '-p', '5000'
    sleep 0.1 # wait for servers to start up
  end

  config.after(:suite) do
    Foreman::Kicker.stop
  end
end
```
