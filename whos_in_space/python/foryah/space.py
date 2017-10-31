#!/usr/bin/python

import requests

API_URL = "http://api.open-notify.org/astros.json"


def get_data(url):
    response = requests.get(url)

    if response.status_code == requests.codes.ok:
        return response.json()
    else:
        raise Exception("Request failed with code: {}.\nDetails: {}"
                        .format(response.code, response.content))


def process_data(request_data):
    if request_data["message"] != "success":
        raise Exception("Api didn't return good data! Message: {}"
                        .format(request_data["message"]))

    processed_data = {"people": []}
    max_name = -1
    max_craft = -1
    for data in request_data["people"]:
        len_name = len(data["name"])
        if len_name > max_name:
            max_name = len_name

        len_craft = len(data["craft"])
        if len_craft > max_craft:
            max_craft = len_craft

        processed_data["people"].append(
            [data["name"], data["craft"]]
        )

    processed_data["lengths"] = {"max_name": max_name, "max_craft": max_craft}

    return processed_data


def draw_headers(lengths):
    NAME = "Name"
    SHIP = "Ship"

    spaces = " " * (lengths["max_name"] - len(NAME))
    name = "{}{}".format(NAME, spaces)
    ship = " {}".format(SHIP)
    header = "{}|{}".format(name, ship)

    max_name = lengths["max_name"] if lengths["max_name"] > len(name) else len(name)
    max_craft = lengths["max_craft"] if lengths["max_craft"] > len(ship) else len(ship)

    print header
    print "{}|{}".format("-" * max_name, "-" * max_craft)


def draw_data(data):
    for name, ship in data["people"]:
        spaces = " " * (data["lengths"]["max_name"] - len(name))
        print "{}{}| {}".format(name, spaces, ship)


def draw_table(data):
    draw_headers(data["lengths"])
    draw_data(data)


if __name__ == "__main__":
    request_data = get_data(API_URL)
    processed_data = process_data(request_data)
    draw_table(processed_data)
