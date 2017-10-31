
items = []
quantity = []
subTotal = 0
total = 0

# print "How many items are "
# subTotalItems = gets.chomp.to_i

input = ""
i = 0

until input == "done" do # I guess this is superflous
  i += 1
  printf "%-40s #%s: $", "Enter item price, or 'done' to quit", i
  input = gets.chomp.downcase
  break if input == "done"
  items.push(input.to_f)
  printf "%-40s #%s: ", "Enter the quantity of item" , i
  quantity.push(gets.chomp.to_i)
end



i = 0
until i >= items.count do
  subTotal += (items[i] * quantity[i])
  i += 1
end

tax = subTotal * 0.055

total = subTotal + tax

printf("%-20s $%0.2f \n", "Subtotal: ", subTotal)
printf("%-20s $%0.2f \n", "Tax: " ,tax)
printf("%-20s $%0.2f \n", "Total: ", total)
