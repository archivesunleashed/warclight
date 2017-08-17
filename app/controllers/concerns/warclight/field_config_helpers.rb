# frozen_string_literal: true

module Warclight
  ##
  # A module to add configuration helpers for certain fields used by Warclight
  module FieldConfigHelpers
    extend ActiveSupport::Concern
    include ActionView::Helpers::OutputSafetyHelper
    include ActionView::Helpers::TagHelper
  end
end
