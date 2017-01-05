module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import App.Types exposing (..)
import App.Input.View as Input
import App.List.View as List


view : Model -> Html Msg
view model =
    div []
        [ Html.map MsgForInput (Input.view model.input)
        , Html.map MsgForList (List.view model.list)
        ]