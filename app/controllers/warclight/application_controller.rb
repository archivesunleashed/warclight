# frozen_string_literal: true

module Warclight
  ##
  # Controller. This might disappear.
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  end
end
