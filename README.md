# HTTPSignature

Ruby Implementation of [Joyent's HTTP Signature Authentication Scheme](https://github.com/joyent/node-http-signature/blob/master/http_signing.md).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'http_signature'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install http_signature

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Test certificate/key generation

This repo contains a certificate and the matching private key for the test suite to use. These should **never** be used for anything else, and we shouldn't presume requests signed by them are authenticated for anything more than testing.

If for whatever reason they need rotating, they were generated with the following commands:

```shell
cd spec/data

# Clean up previous versions
rm -f test_cert.csr test_cert.key test_cert.pem test_cert_fingerprint.txt

# Generate private key - enter 1234 for passphrase
openssl genrsa -des3 -out test_cert.key 2048

# Remove passphrase from key - enter 1234 for passphrase
openssl rsa -in test_cert.key -out test_cert.key

# Generate CSR - Hit enter to accept all defaults
openssl req -new -key test_cert.key -out test_cert.csr

# Generate the certificate & fingerprint
openssl x509 -req -days 1024 -in test_cert.csr -signkey test_cert.key -out test_cert.pem
openssl x509 -in test_cert.pem -noout -sha1 -fingerprint | cut -d= -f 2 > test_cert_fingerprint.txt
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/http_signature. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
