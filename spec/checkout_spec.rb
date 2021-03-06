require 'composed'
# coding: utf-8

RSpec.describe Composed::Checkout do

  context 'should implement the given interface' do
  end

  context 'should price given examples correctly' do
    let(:pricing_rules) do
      {
        'FR1' => Proc.new { |q| ((q + 1).to_i / 2) * 3.11 },
        'SR1' => Proc.new { |q| q * (q >= 3 ? 4.50 : 5.00) },
        'CF1' => Proc.new { |q| q * 11.23 },
      }
    end
    let(:co) { Composed::Checkout.new(pricing_rules) }

    it 'empty checkout' do
      expect(co.price).to eq(0.0)
    end

    it 'single item' do
      co.scan('FR1')
      expect(co.price).to eq(3.11)
    end

    it 'FR1,FR1' do
      %w(FR1 FR1).each do |item|
        co.scan(item)
      end
      expect(co.price).to eq(3.11)
    end

    it 'SR1,SR1,FR1,SR1' do
      %w(SR1 SR1 FR1 SR1).each do |item|
        co.scan(item)
      end
      expect(co.price).to eq(16.61)
    end

    it 'FR1,SR1,FR1,FR1,CF1' do
      %w(FR1 SR1 FR1 FR1 CF1).each do |item|
        co.scan(item)
      end
      expect(co.price).to eq(22.45)
    end

  end

end
