# frozen_string_literal: true

module Warclight
  ##
  # Helper methods for Warclight.
  module ApplicationHelper
    def link_to_live_web(options = {})
      safe_join(options[:value].map do |url|
        begin
          res = Net::HTTP.get_response(URI(url))
          if res.code.start_with?('1', '2', '3')
            link_to(url, url, target: '_blank') << ' 🔗'
          else
            options[:value]
          end
        rescue
          options[:value]
        end
      end, '')
    end
  end
end
