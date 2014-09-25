# Freak

Freak is a general purpose frequency analysis toolkit for English. It provides a set of helper methods for calculating
absolute and relative frequency for the English alphabet.

## Installation

Add this line to your application's Gemfile:

    gem 'freak'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freak

## Usage

require "freak"

results = Freak::Frequency.frequency("your string here")

relative_frequency = Freak::Frequency.relative_frequency(results)

csv = Freak::Frequency.csv(results)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/freak/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
