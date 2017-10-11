# frozen_string_literal: true

##
# Generic Helpers used in Warclight
module WarclightHelper
  def url_to_link(options = {})
    safe_join(options[:value].map do |url|
      begin
        res = Net::HTTP.get_response(URI(url))
        if res.code.start_with?('1', '2', '3')
          link_to(url, url, target: '_blank') << ' 🔗'
        else
          url + ' (Not available)'
        end
      rescue
        url + ' (Not available)'
      end
    end, '')
  end

  def return_five(options = {})
    options[:value][0, 5].join('; ') + '...'
  end
end
