# frozen_string_literal: true

module Warclight
  ##
  # Helper methods for Warclight.
  module ApplicationHelper
    def link_to_live_web(options = {})
      safe_join(options[:value].map do |url|
        link_to(url, url, target: '_blank') << ' 🔗'
      end, '')
    end
  end
end
