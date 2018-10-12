# frozen_string_literal: true

require 'rails/generators'

module Warclight
  ##
  # Warclight install generator
  class Install < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def create_blacklight_catalog
      remove_file 'app/controllers/catalog_controller.rb'
      copy_file 'catalog_controller.rb', 'app/controllers/catalog_controller.rb'
    end

    def include_warclight_solrdocument
      inject_into_file 'app/models/solr_document.rb', after: 'include Blacklight::Solr::Document' do
        "\n include Warclight::SolrDocument"
      end
    end

    def install_blacklight_range_limit
      generate 'blacklight_range_limit:install'
    end

    def add_custom_routes
      inject_into_file 'config/routes.rb', after: "mount Blacklight::Engine => '/'" do
        "\n    mount Warclight::Engine => '/'\n"
      end
    end

    def assets
      copy_file 'warclight.scss', 'app/assets/stylesheets/warclight.scss'
      copy_file 'warclight.js', 'app/assets/javascripts/warclight.js'
      inject_into_file 'app/assets/javascripts/application.js', after: '//= require blacklight/blacklight' do
        "\n//= require bootstrap/scrollspy\n" \
        "\n//= require bootstrap/tab\n"
      end
    end

    def add_warclight_search_behavior
      inject_into_file 'app/models/search_builder.rb', after: 'include Blacklight::Solr::SearchBuilderBehavior' do
        "\n  include Warclight::SearchBehavior"
      end
    end

    def solr_config
      directory '../../../../solr', 'solr', force: true
    end

    def modify_blacklight_yml
      gsub_file 'config/locales/blacklight.en.yml', "application_name: 'Blacklight'", "application_name: 'Warclight'"
    end
  end
end
