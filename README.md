# NOTE

Warclight is no longer under active development. This repo has been set to public archive.

If you're interested in web archive collections and Apache Solr, check out [SolrWayback](https://github.com/netarchivesuite/solrwayback). It uses the same underlying library as Warclight to index web archives into Solr, and offers many more features than Warclight.

<3 AU Team

# Warclight
[![codecov](https://codecov.io/gh/archivesunleashed/warclight/branch/main/graph/badge.svg)](https://codecov.io/gh/archivesunleashed/warclight)
[![Gem Version](https://badge.fury.io/rb/warclight.svg)](https://badge.fury.io/rb/warclight)
[![Contribution Guidelines](http://img.shields.io/badge/CONTRIBUTING-Guidelines-blue.svg)](./CONTRIBUTING.md)
[![LICENSE](https://img.shields.io/badge/license-Apache-blue.svg?style=flat-square)](./LICENSE.txt)
[![Depfu](https://badges.depfu.com/badges/d201582abe1955866e1b56ac43040541/overview.svg)](https://depfu.com/github/archivesunleashed/warclight?project_id=6476)

A [Project Blacklight](http://projectblacklight.org/) based [Rails engine](http://guides.rubyonrails.org/engines.html) that supports the discovery of web archives held in the WARC and ARC formats. It allows faceted full-text search, record view, and other advanced discovery options.

The following article provides a nice overview:

Ruest, Nick, Milligan, Ian, and Lin, Jimmy. [Warclight: A Rails Engine for Web Archive Discovery](http://hdl.handle.net/10315/36159). Proceedings of the 2019 IEEE/ACM Joint Conference on Digital Libraries (JCDL 2019), June 2019, Urbana-Champaign, Illinois.

## Requirements

* [Ruby](https://www.ruby-lang.org/en/) 2.6 < 3.0
* [Bundler](https://bundler.io/) < 2.2
* [Rails](http://rubyonrails.org) 5.1 < 6.2
* [Solr](https://solr.apache.org/) < 9

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

Warclight is designed to work with web archive data that is indexed via the UK Web Archive's [webarchive-discovery](https://github.com/ukwa/webarchive-discovery) project. A guide on indexing is available [here](https://github.com/archivesunleashed/warclight/wiki/Indexing-WARCs-ARCs-into-Warclight).

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

Then visit [http://localhost:3000](http://localhost:3000). It will also start a Solr instance on port 8983.

### Run a console

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Run with docker

Ensure Docker is installed and configured.

```sh
$ docker-compose build
$ docker-compose up
```

Then visit [http://localhost:3000](http://localhost:3000). It will also start a Solr instance on port 8983.

### Release a new version of the gem

To release a new version:

1. Update the version number in `lib/warclight/version.rb`
2. Run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, build the gem file (e.g., `gem build warclight.gemspec`) and push the `.gem` file to [rubygems.org](https://rubygems.org) (e.g., `gem push warclight-x.y.z.gem`).

## Contributing

[Bug reports](https://github.com/archivesunleashed/warclight/issues) and [pull requests](https://github.com/archivesunleashed/warclight/pulls) are welcome on Warclight -- see [CONTRIBUTING.md](https://github.com/archivesunleashed/warclight/blob/main/CONTRIBUTING.md) for details.

## License

The gem is available as open source under the terms of the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

## Acknowledgments

This work is primarily supported by the [Andrew W. Mellon Foundation](https://mellon.org/). Other financial and in-kind support comes from the [Social Sciences and Humanities Research Council](http://www.sshrc-crsh.gc.ca/), [Compute Canada](https://www.computecanada.ca/), the [Ontario Ministry of Research, Innovation, and Science](https://www.ontario.ca/page/ministry-research-innovation-and-science), [York University Libraries](https://www.library.yorku.ca/web/), [Start Smart Labs](http://www.startsmartlabs.com/), and the [Faculty of Arts](https://uwaterloo.ca/arts/) and [David R. Cheriton School of Computer Science](https://cs.uwaterloo.ca/) at the [University of Waterloo](https://uwaterloo.ca/).

Any opinions, findings, and conclusions or recommendations expressed are those of the researchers and do not necessarily reflect the views of the sponsors.

This project drew inspiration from the [Arclight](https://github.com/sul-dlss/arclight) and [UKWA's Shine](https://github.com/ukwa/shine/), and would like to thank those creators and contributors.
