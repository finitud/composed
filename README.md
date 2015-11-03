# Composed

This is my take at the checkout coding test for Composed.

## Usage

This solution is packaged as a gem, but it will most likely be run from the command line
directly from source. To run the examples:

1. `bundle install`
2. `rspec`

The pricing rules are defined in a Hash where the keys are the inventory item IDs and the
respective values are Proc objects that take the quantity of items to price and return
the respective price.

In the case of the particular rules given for this assignment, the business rules are:

```
{
  'FR1' => Proc.new { |q| ((q + 1).to_i / 2) * 3.11 },
  'SR1' => Proc.new { |q| q * (q >= 3 ? 4.50 : 5.00) },
  'CF1' => Proc.new { |q| q * 11.23 },
}
```

To run the examples directly in the REPL, the easiest way is to `rake install` the gem,
and then `require 'composed'` on an `irb` session. The class names are in the `Composed`
namespace.
