module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import App.Types exposing (..)
import App.Input.View as Input
import App.Entries.View as Entries


view : Model -> Html Msg
view model =
    div []
        [ Input.view model.input
        , Entries.view model.entries
        ]