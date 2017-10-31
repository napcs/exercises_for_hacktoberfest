def main():
    subtotal = 0
    item = 0
    for item in range(3):
        item += 1
        price = input('Enter the price of item {}: '.format(item))
        qnty = input('Enter the quantity of item {}: '.format(item))
        subtotal += int(price) * int(qnty)

    tax = subtotal * 0.055
    total = subtotal + tax

    print('Subtotal: ${0:.2f}'.format(subtotal))
    print('Tax: ${0:.2f}'.format(tax))
    print('Total: ${0:.2f}'.format(total))


if __name__ == '__main__':
    main()
