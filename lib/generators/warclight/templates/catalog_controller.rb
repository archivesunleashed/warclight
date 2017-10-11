# frozen_string_literal: true

class CatalogController < ApplicationController
  include Blacklight::Catalog
  include Warclight::Catalog

  configure_blacklight do |config|
    ## Class for sending and receiving requests from a search index
    # config.repository_class = Blacklight::Solr::Repository
    #
    ## Class for converting Blacklight's url parameters to into request parameters for the search index
    # config.search_builder_class = ::SearchBuilder
    #
    ## Model that maps search index responses to the blacklight response model
    # config.response_model = Blacklight::Solr::Response

    ## Default parameters to send to solr for all search-like requests. See also SearchBuilder#processed_parameters
    config.default_solr_params = {
      rows: 10
    }

    # solr field configuration for search results/index views
    config.index.title_field = ['title', 'resourcename']

    # solr fields that will be treated as facets by the blacklight application
    # The ordering of the field names is the order of the display
    #
    # Setting a limit will trigger Blacklight's 'more' facet values link.
    # * If left unset, then all facet values returned by solr will be displayed.
    # * If set to an integer, then "f.somefield.facet.limit" will be added to
    # solr request, with actual solr request being +1 your configured limit --
    # you configure the number of items you actually want _displayed_ in a page.
    # * If set to 'true', then no additional parameters will be sent to solr,
    # but any 'sniffed' request limit parameters will be used for paging, with
    # paging at requested limit -1. Can sniff from facet.limit or
    # f.specific_field.facet.limit solr request params. This 'true' config
    # can be used if you set limits in :default_solr_params, or as defaults
    # on the solr side in the request handler itself. Request handler defaults
    # sniffing requires solr requests to be made with "echoParams=all", for
    # app code to actually have it echo'd back to see it.
    #
    # :show may be set to false if you don't want the facet to be drawn in the
    # facet bar
    #
    # set :index_range to true if you want the facet pagination view to have
    # facet prefix-based navigation (useful when user clicks "more" on a large
    # facet and wants to navigate alphabetically across a large set of results)
    # :index_range can be an array or range of prefixes that will be used to
    # create the navigation (note: It is case sensitive when searching values)

    config.add_facet_field 'content_type_norm', label: 'General Content Type', collapse: false
    config.add_facet_field 'crawl_year', label: 'Crawl Year', collapse: false
    config.add_facet_field 'public_suffix', label: 'Public Suffix', collapse: false, limit: true
    config.add_facet_field 'domain', label: 'Domain', limit: true
    config.add_facet_field 'links_domains', label: 'Links Domains', limit: true
    config.add_facet_field 'content_language', label: 'Content Language', limit: true
    config.add_facet_field 'resourcename', label: 'Filename', limit: true
    config.add_facet_field 'institution', label: 'Institution'
    config.add_facet_field 'collection_name', label: 'Collection Name'
    config.add_facet_field 'collection_number', label: 'Collection Number'

    # Have BL send all facet field names to Solr, which has been the default
    # previously. Simply remove these lines if you'd rather use Solr request
    # handler defaults, or have no facets.
    config.add_facet_fields_to_solr_request!

    # solr fields to be displayed in the index (search results) view
    #   The ordering of the field names is the order of the display
    config.add_index_field 'title', label: 'Title'
    config.add_index_field 'host', label: 'Host', link_to_facet: true
    config.add_index_field 'crawl_date', label: 'Crawl Date'
    config.add_index_field 'content_type_norm', label: 'General Content Type', link_to_facet: true
    config.add_index_field 'content_language', label: 'Content Language', link_to_facet: true
    config.add_index_field 'domain', label: 'Domain', link_to_facet: true
    config.add_index_field 'institution', label: 'Institution', link_to_facet: true
    config.add_index_field 'collection_name', label: 'Collection Name', link_to_facet: true
    config.add_index_field 'collection_number', label: 'Collection Number', link_to_facet: true
    config.add_index_field 'links_domains', label: 'This page links to', link_to_facet: true,
                                            separator_options: { words_connector: '; ' }

    # solr fields to be displayed in the show (single result) view
    #   The ordering of the field names is the order of the display
    config.add_show_field 'url', label: 'URL', helper_method: :url_to_link
    config.add_show_field 'resourcename', label: 'Filename', link_to_facet: true
    config.add_show_field 'host', label: 'Host', link_to_facet: true
    config.add_show_field 'institution', label: 'Institution', link_to_facet: true
    config.add_show_field 'collection_name', label: 'Collection Name', link_to_facet: true
    config.add_show_field 'collection_number', label: 'Collection Number', link_to_facet: true
    config.add_show_field 'crawl_date', label: 'Crawl Date'
    config.add_show_field 'source_file', label: 'Source File'
    config.add_show_field 'content_type_norm', label: 'General Content Type', link_to_facet: true
    config.add_show_field 'content_language', label: 'Content Language', link_to_facet: true
    config.add_show_field 'content_length', label: 'Length'
    config.add_show_field 'links_hosts', label: 'Link Hosts', link_to_facet: true
    config.add_show_field 'links_domains', label: 'This page links to', link_to_facet: true,
                                           separator_options: { words_connector: '; ' }
    config.add_show_field 'content', label: 'Content'

    # "fielded" search configuration. Used by pulldown among other places.
    # For supported keys in hash, see rdoc for Blacklight::SearchFields
    #
    # Search fields will inherit the :qt solr request handler from
    # config[:default_solr_parameters], OR can specify a different one
    # with a :qt key/value. Below examples inherit, except for subject
    # that specifies the same :qt as default for our own internal
    # testing purposes.
    #
    # The :key is what will be used to identify this BL search field internally,
    # as well as in URLs -- so changing it after deployment may break bookmarked
    # urls.  A display label will be automatically calculated from the :key,
    # or can be specified manually to be different.

    # This one uses all the defaults set by the solr request handler. Which
    # solr request handler? The one set in config[:default_solr_parameters][:qt],
    # since we aren't specifying it otherwise.
    config.add_search_field 'text', label: 'Text' do |field|
      field.include_in_simple_select = true
    end

    config.add_search_field 'title', label: 'Title' do |field|
      field.qt = 'title_search'
    end

    config.add_search_field 'content', label: 'Content' do |field|
      field.qt = 'content_search'
    end

    config.add_search_field 'url', label: 'URL' do |field|
      field.qt = 'url_search'
    end

    config.add_search_field 'host', label: 'Host' do |field|
      field.qt = 'host_search'
    end

    # Field-based searches. We have registered handlers in the Solr configuration
    # so we have Blacklight use the `qt` parameter to invoke them

    # "sort results by" select (pulldown)
    # label in pulldown is followed by the name of the SOLR field to sort by and
    # whether the sort is ascending or descending (it must be asc or desc
    # except in the relevancy case).
    config.add_sort_field 'score desc', label: 'relevance'

    # If there are more than this many search results, no spelling ("did you
    # mean") suggestion is offered.
    config.spell_max = 5

    # Configuration for autocomplete suggestor
    config.autocomplete_enabled = true
    config.autocomplete_path = 'suggest'
  end
end
