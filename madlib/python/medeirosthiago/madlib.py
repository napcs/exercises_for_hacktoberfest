def main():
    noun = input('Enter a noun: ')
    verb = input('Enter a verb: ')
    adj = input('Enter an adjective: ')
    adv = input('Enter an adverb: ')

    msg = "Do you {} your {} {} {}? That's hilarious!"

    print(msg.format(verb, adj, noun, adv))


if __name__ == '__main__':
    main()
