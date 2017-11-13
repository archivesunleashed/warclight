# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Warclight::SolrDocument do
  let(:document) { SolrDocument.new }

  describe '#replay_link' do
    let(:document) do
      SolrDocument.new(wayback_date: '20150113163601', url: 'http://www.library.yorku.ca/cms/steacie/about-the-library/hackfest/')
    end

    it 'writes a replay url based on memento time travel response' do
      expect(document.replay_link).to eq '<a href="https://digital.library.yorku.ca/wayback/20150113163601/http://www.library.yorku.ca/cms/steacie/about-the-library/hackfest/" target="_blank">https://digital.library.yorku.ca/wayback/20150113163601/http://www.library.yorku.ca/cms/steacie/about-the-library/hackfest/</a> 🔗'
    end

    context 'when time_travel_response.empty?' do
      let(:document) do
        SolrDocument.new(wayback_date: '20150113163601', url: 'http://www.library.yorku.ca/cms/steacie/about-the-library/hackfest/FAIL')
      end

      it 'writes a replay url that is "Not Available."' do
        expect(document.replay_link).to eq 'Not Available.'
      end
    end
  end
end
