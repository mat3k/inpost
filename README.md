# Inpost

Very light inpost machine API wrapper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inpost', :git => 'git://github.com/mat3k/inpost.git'
```

And then execute:

    $ bundle

## Usage

    # standard client initialization
    client = Inpost::MachineAPI.new

    # custom endpoint
    client = Inpost::MachineAPI.new(endpoint: 'http://some_other_valid_url.com/api')

    # cache disabled
    client = Inpost::MachineAPI.new(cache_store: nil)

    # get machines
    client.machines # => [{}, {}, ...]

    # get machine by ID
    client.machine('12345') => {}

    # Html render helper
    type_0_machines  = client.machines.select { |machine| machine['type'] == 0}
    Inpost::HtmlHelper::select_tag(collection: client.machines)
    Inpost::HtmlHelper::select_tag(collection: type_0_machines, params: {id: '', class: '', style: ''})

## Contributing

1. Fork it ( https://github.com/[my-github-username]/inpost/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
