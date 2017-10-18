# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Warclight::SolrDocument do
  let(:document) { SolrDocument.new }

  describe '#replay_link' do
    let(:document) do
      SolrDocument.new(crawl_date: '2015-01-13T16:36:01Z', url: 'http://www.library.yorku.ca/cms/steacie/about-the-library/hackfest/')
    end

    it 'writes a replay url based on memento time travel response' do
      expect(document.replay_link).to eq '<a href="https://digital.library.yorku.ca/wayback/20150113163601/http://www.library.yorku.ca/cms/steacie/about-the-library/hackfest/" target="_blank">https://digital.library.yorku.ca/wayback/20150113163601/http://www.library.yorku.ca/cms/steacie/about-the-library/hackfest/</a> 🔗'
    end
  end
end
