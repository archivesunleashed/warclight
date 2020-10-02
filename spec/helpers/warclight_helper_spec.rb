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
        expect(helper.url_to_link(value: ['https://ruebot.net/poutine.html'])).to include('(Not available)')
      end
    end

    context 'when "url" does not respond with a status code' do
      it 'prints "url" and (Not Available)' do
        expect(helper.url_to_link(value: ['http://boycottmellenpress.com'])).to include('(Not available)')
      end
    end
  end

  describe '#return_five' do
    context 'when a field has more than 5 items' do
      it 'prints the first 5 items in the array, seperated by ";", and ends with "..."' do
        expect(helper.return_five(value: %w[a b c d e f])).to eq('a; b; c; d; e...')
      end
    end

    context 'when a field has less than 5 items' do
      it 'prints all items in the array, seperated by ";"' do
        expect(helper.return_five(value: %w[a b])).to eq('a; b')
      end
    end
  end
end
