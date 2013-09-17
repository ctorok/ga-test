require_relative 'make_change'

# Use a currency set of pennies, nickels, dimes, quarters
# Make change from a given amount of cents and returns a currency set
# Make change for quantities up to 100 cents
# Make cents from a given amount of currency and returns as a total number of cents
# Take input from the command line
# Examples
# 3 cents            = 3 pennies
# 6 cents            = 1 nickel, 1 penny
# 14 cents           = 1 dime, 4 pennies

# 2 dimes, 3 pennies = 23 cents
# 3 pennies          = 3 cents

print "Enter the amount of cents you want change for (not more than 100): "
response = STDIN.gets.chomp.to_i

unless (response.nil?) && (response.is_a? Integer)
  make_change(response)

end
