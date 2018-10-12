# frozen_string_literal: true

gem 'warclight', github: 'archivesunleashed/warclight'
gem 'blacklight_range_limit', '7.0.0.rc2'

run 'bundle install'

generate 'blacklight:install', '--devise'
generate 'warclight:install', '-f'

rake 'db:migrate'
