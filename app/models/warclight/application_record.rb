# frozen_string_literal: true

module Warclight
  ##
  # ApplicationRecord class. We'll probably get rid of this.
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
