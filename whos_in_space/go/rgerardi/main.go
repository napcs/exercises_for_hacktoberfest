package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"sort"
	"strings"
)

const url string = "http://api.open-notify.org/astros.json"

type person struct {
	Name  string `json:"name"`
	Craft string `json:"craft"`
	first string
	last  string
}

type astros struct {
	Number  int       `json:"number"`
	Message string    `json:"message"`
	People  []*person `json:"people"`
}

// getAstros queries the API for astronauts names/craft, decodes it
// into an astros struct and returns it
func getAstros(url string) (*astros, error) {
	// Get JSON output from API
	res, err := http.Get(url)

	if err != nil {
		return nil, err
	}

	defer res.Body.Close()

	a := &astros{}

	// Decode JSON output into astros struct
	if err := json.NewDecoder(res.Body).Decode(a); err != nil {
		return nil, err
	}

	// Getting the first and last name of each astronaut so they can
	// be used for sorting later
	for _, v := range a.People {
		names := strings.Split(v.Name, " ")
		v.first = strings.Join(names[0:len(names)-1], " ")
		v.last = names[len(names)-1]
	}

	return a, nil

}

// formatTable formats a table with the name of all astronauts
// and their crafts. Returns the formated table as string
func formatTable(a *astros) string {
	maxLenName := 0
	maxLenCraft := len("Craft")
	table := ""

	// Determine the max lenght of all names/craft
	for _, v := range a.People {
		if len(v.Name) > maxLenName {
			maxLenName = len(v.Name)
		}
		if len(v.Craft) > maxLenCraft {
			maxLenCraft = len(v.Craft)
		}
	}

	// Adding additional spaces for aestetics
	maxLenName++
	maxLenCraft += 2

	// Creating header first line
	table += fmt.Sprintf(fmt.Sprintf("%%-%ds| Craft\n", maxLenName), "Name")

	// Creating header second line
	table += strings.Repeat("-", maxLenName)
	table += "|"
	table += strings.Repeat("-", maxLenCraft)
	table += "\n"

	// Challenge: sorting by last name and craft (for grouping)
	sort.SliceStable(a.People, func(i, j int) bool { return a.People[i].last < a.People[j].last })
	sort.SliceStable(a.People, func(i, j int) bool { return a.People[i].Craft < a.People[j].Craft })

	// Print Astronaut name and craft (grouped)
	lastCraft := ""
	for _, v := range a.People {
		table += fmt.Sprintf(fmt.Sprintf("%%-%ds|", maxLenName), v.Name)
		// Only print craft if different from previous, therefore grouping similar
		if lastCraft != v.Craft {
			table += fmt.Sprintf(" %s", v.Craft)
			lastCraft = v.Craft
		}
		table += "\n"
	}

	return table
}

func main() {

	// Get Astronauts names from API
	a, err := getAstros(url)

	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	// Print table
	fmt.Println(formatTable(a))

}
