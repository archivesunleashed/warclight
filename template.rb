# frozen_string_literal: true

gem 'warclight', github: 'archivesunleashed/warclight', branch: 'main'
gem 'blacklight_range_limit', '8.2.3'

run 'bundle install'

generate 'blacklight:install', '--devise'
generate 'warclight:install', '-f'

rake 'db:migrate'
