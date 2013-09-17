require 'active_support/inflector' #this is so we can use pluralizer

COINS = {quarter: 0, dime: 0, nickel: 0, penny: 0}
def make_change(amount)
  coins = COINS
  coins.default = 0 #make sure they are zero, and not nil
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

  puts "#{total} cents, makes"
  pluralizer(coins["quarter"], 0, k, 25)
  pluralizer(coins["dime"], 1, k, 10)
  pluralizer(coins["nickel"], 2, k, 5)
  pluralizer(coins["penny"], 3, k, 1)

end

def pluralizer(coinage, i, k, coin_value)
  if coinage > 1
    sp = k[i].to_s.pluralize
  else
    sp = k[i].to_s
  end
    amt = coinage * coin_value
    i < 3 ? puts("#{coinage} #{sp} (#{amt}),") : puts("and #{coinage} #{sp} (#{amt}).")
end