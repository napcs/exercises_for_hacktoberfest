module Main exposing (main)

import Html exposing (Html, p, div, input, button, label, text)
import Html.Events exposing(onClick, onInput)

type Msg = Click | UpdateName String

type alias Model =
  { name: String
  , output: String
  }


update: Msg -> Model -> Model
update msg model =
  case msg of
    UpdateName string->
       {model | name = string}
    Click ->
       {model | output = "Hello, " ++ model.name ++ "!"}


model: Model
model =
    { name = "", output = "" }


view : Model -> Html Msg
view model =
    div []
      [ label [] [text "Enter your name."]
      , input [onInput UpdateName] []
      , button [onClick Click] [text "Click me!"]
      , p [] [text model.output]
      ]


main =
    Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }
