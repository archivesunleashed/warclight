# frozen_string_literal: true

require 'spec_helper'

RSpec.describe WarclightHelper, type: :helper do
  describe '#url_to_link' do
    context 'when "url" responds with 1xx, 2xx, or 3xx' do
      it 'prints a "url" that is a link' do
        expect(helper.url_to_link(value: ['http://yorku.ca'])).to include('🔗')
      end
    end
    context 'when "url" responds with 404' do
      it 'prints "url" and (Not Available)' do
        expect(helper.url_to_link(value: ['http://www.yorku.ca/poutine.html'])).to include('Not available)')
      end
    end
    context 'when "url" does not respond with a status code' do
      it 'prints "url" and (Not Available)' do
        expect(helper.url_to_link(value: ['http://boycottmellenpress.com'])).to include('(Not available)')
      end
    end
  end
end
