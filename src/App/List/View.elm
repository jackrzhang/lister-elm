module App.List.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

import App.List.Types exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ viewEntries model
        ]


viewEntries : List Entry -> Html Msg
viewEntries entries =
    div []
        (List.map viewEntry entries)


viewEntry : Entry -> Html Msg
viewEntry entry =
    div []
        [ text entry.text ]