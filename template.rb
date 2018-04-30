# frozen_string_literal: true

# We can remove `blacklight` and `blacklight_range_limit` once they are released
# since they are already dependents of Warclight (but we need to pin to particular branches)
gem 'blacklight', github: 'projectblacklight/blacklight'

gem 'warclight', github: 'archivesunleashed/warclight'

run 'bundle install'

generate 'blacklight:install', '--devise'
generate 'warclight:install', '-f'

rake 'db:migrate'
