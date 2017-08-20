# Warclight
[![Build Status](https://travis-ci.org/archivesunleashed/warclight.svg?branch=master)](https://travis-ci.org/archivesunleashed/warclight)
[![codecov](https://codecov.io/gh/archivesunleashed/warclight/branch/master/graph/badge.svg)](https://codecov.io/gh/archivesunleashed/warclight)
[![Gem Version](https://badge.fury.io/rb/warclight.svg)](https://badge.fury.io/rb/warclight)
[![Contribution Guidelines](http://img.shields.io/badge/CONTRIBUTING-Guidelines-blue.svg)](./CONTRIBUTING.md)
[![LICENSE](https://img.shields.io/badge/license-Apache-blue.svg?style=flat-square)](./LICENSE.txt)

A [Project Blacklight](http://projectblacklight.org/) based [Rails engine](http://guides.rubyonrails.org/engines.html) that supports the discovery of web archives held in the WARC and ARC formats. It allows faceted full-text search, record view, and other advanced discovery options. 

## Requirements

* [Ruby](https://www.ruby-lang.org/en/) 2.2 or later
* [Rails](http://rubyonrails.org) 5.1.2 or later

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'warclight'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install warclight
```

For further details, see our [Creating, installing, and running your Warclight application](https://github.com/archivesunleashed/warclight/wiki/Creating%2C-installing%2C-and-running-your-Warclight-application) documentation.

## Usage

Warclight is designed to work with web archive data that is indexed via the UK Web Archive's [webarchive-discovery](https://github.com/ukwa/webarchive-discovery) project. Warclight currently uses a fork of [webarchive-discovery](https://github.com/web-archive-group/webarchive-discovery/tree/addFields) that allows for three additional facets: `institution`, `collection_name`, and `collection_number`.

## Development

Warclight development uses [`solr_wrapper`](https://rubygems.org/gems/solr_wrapper/versions/0.18.1) and [`engine_cart`](https://rubygems.org/gems/engine_cart) to host development instances of Solr and Rails server on your local machine.

### Run the test suite

Ensure Solr and Rails are _not_ running (ports 8983 and 3000 respectively), then:

```sh
$ bundle exec rake
```

### Run a development server

```sh
$ bundle exec rake warclight:server
```

Then visit http://localhost:3000. It will also start a Solr instance on port 8983.

### Run a console

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Release a new version of the gem

To release a new version:

1. Update the version number in `lib/warclight/version.rb`
2. Run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, build the gem file (e.g., `gem build warclight.gemspec`) and push the `.gem` file to [rubygems.org](https://rubygems.org) (e.g., `gem push warclight-x.y.z.gem`).

## Contributing

[Bug reports](https://github.com/archivesunleashed/warclight/issues) and [pull requests](https://github.com/archivesunleashed/warclight/pulls) are welcome on WarcLight -- see [CONTRIBUTING.md](https://github.com/archivesunleashed/warclight/blob/master/CONTRIBUTING.md) for details.

## License

The gem is available as open source under the terms of the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

## Acknowledgments

This work is primarily supported by the [Andrew W. Mellon Foundation](https://uwaterloo.ca/arts/news/multidisciplinary-project-will-help-historians-unlock). Any opinions, findings, and conclusions or recommendations expressed are those of the researchers and do not necessarily reflect the views of the sponsors.

This project drew inspiration from the [Arclight](https://github.com/sul-dlss/arclight), and would like to thank those creators and contributors.
