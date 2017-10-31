#!/usr/bin/python

def ask_for(word_type):
    word = input("Enter a {}: ".format(word_type))
    return word

def funny_sentence():
    noun = ask_for("noun")
    verb = ask_for("verb")
    adjective = ask_for("adjective")
    adverb = ask_for("adverb")

    return ("Do you {verb} your {adjective} {noun} {adverb}? That's hilarious!"
            .format(verb=verb, adjective=adjective, noun=noun, adverb=adverb))

if __name__ == "__main__":
    sentance = funny_sentence()
    print(sentance)
