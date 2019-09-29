# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Warclight do
  it 'has a version number' do
    expect(Warclight::VERSION).not_to be nil
  end

  describe 'Custom CatalogController field accessors' do
    subject(:custom_fields) do
      Warclight::Engine.config.catalog_controller_field_accessors
    end

    it { expect(custom_fields).to include :host, :crawl_date }
  end
end
