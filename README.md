# Inpost

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inpost'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inpost

## Usage

    # standard client init
    client = Inpost::MachineAPI.new

    # custom endpoint
    client = Inpost::MachineAPI.new(endpoint: 'http://some_other_valid_url.com/api')

    # cache disabled
    client = Inpost::MachineAPI.new(cache_store: nil)

    # get machines
    client.machines # => [{}, {}, ...] get machines

    # get machine by ID
    client.machine(12345) => {}

    # Html render helper
    html = Inpost::HtmlHelper.new
    html.select_tag(collection: client.machines)
    html.select_tag(collection: client.machine, type: '0')

## Contributing

1. Fork it ( https://github.com/[my-github-username]/inpost/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
