# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
# You need to buy before you can sell
# Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.
def stock_picker(arr)
    all_profits = {}
    new_arr = arr
    until new_arr.length == 0
        # >while< is needed here to remove the maximum values if they come first in the given array, because we want to buy it at the lowest price(minimum) first and sell it at the highest price(maximum) later, so it makes no sense to keep the highest values if they come before we can buy it
        while new_arr.max == new_arr[0]
            new_arr = new_arr.drop(1)
            break if new_arr.length == 0
        end
        break if new_arr.length == 0
        "This is the max: #{max = new_arr.max}"
        fake_max_indx = new_arr.find_index { |item| item == max }
        true_max_indx = arr.find_index { |item| item == max }
        fake_new_arr = new_arr[0..fake_max_indx - 1]
        "This is the min: #{min = fake_new_arr.min}"
        fake_min_indx = new_arr.find_index { |item| item == min }
        true_min_indx = arr.find_index { |item| item == min }
        indx_minmax = [true_min_indx, true_max_indx]
        # the difference between the true_max/min_indx and the fake_max/min_indx above is that the true_ is necessary to return the max/min index based on the given array; the fake_ to calculate all the possible profits
        "This is the profit: #{profit = max - min}"
        hash_profit = {}
        hash_profit[indx_minmax] = profit
        all_profits.merge!(hash_profit)
        new_arr.delete_at(fake_max_indx)

    end
    p all_profits.key(all_profits.values.max)
end

stock_picker([17,3,6,9,15,8,6,1,10])
