module Composed
  class Checkout
    def initialize(pricing_rules)
      @pricing_rules = pricing_rules
      @content ||= {}
    end

    def scan(item)
      @content[item] = @content.fetch(item, 0) + 1
    end

    def price
      total = 0.0
      @content.each do |item, quantity|
        total += @pricing_rules.price(item, quantity)
      end
      total
    end
  end
end
