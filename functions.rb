require 'active_support/inflector' #this is so we can use pluralizer
require 'pry-rails'

COINS = {quarter: 25, dime: 10, nickel: 5, penny: 1}
def make_change(amount)
  coins = COINS
  coins.default = 0 #here, they need to be all zero
  total = 0
  k = coins.keys
  total = amount
  while amount > 0
    if amount - 25 >= 0
      coins["quarter"] += 1
      amount -= 25
    elsif amount - 10 >= 0
      coins["dime"] += 1
      amount -= 10
    elsif amount - 5 >= 0
      coins["nickel"] += 1
      amount -= 5
    elsif amount - 1 >= 0
      coins["penny"] += 1
      amount -= 1
    end
  end
  puts "#{total} cents  = "
  pluralizer(coins["quarter"], 0, k, 25)
  pluralizer(coins["dime"], 1, k, 10)
  pluralizer(coins["nickel"], 2, k, 5)
  pluralizer(coins["penny"], 3, k, 1)

end

def pluralizer(coinage, i, k, coin_value)
  coinage > 1 || coinage == 0 ? sp = k[i].to_s.pluralize : sp = k[i].to_s
  amt = coinage * coin_value
  # binding.pry
  i < 3 ? puts("   #{coinage} #{sp} (#{amt}), ") : puts("   and #{coinage} #{sp} (#{amt}).")
end

def calculate_change(q, d, n, p)
  coins = COINS
  k = coins.keys
  v = coins.values
  @total = 0
  @var = ""
  calc_total(@total, q, v[0], k[0]) if q != nil
  calc_total(@total, d, v[1], k[1]) if d != nil
  calc_total(@total, n, v[2], k[2]) if n != nil
  calc_total(@total, p, v[3], k[3]) if p != nil
  puts "#{@var} #{@total} cents"
end

def calc_total(total, coin, value, multiplier)
  @total += (coin*value)
  coin > 1 ? printer(coin, multiplier.to_s.pluralize) : printer(coin, multiplier.to_s)
end

def printer(x, z)
  @hold_response == z || z == "penny" || z == "pennies" ? @var += "#{x} #{z} = " : @var += "#{x} #{z}, "
end