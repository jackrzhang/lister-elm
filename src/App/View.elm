module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import App.Types exposing (..)
import App.Input.View as Input


view : Model -> Html Msg
view model =
    div []
        [ Html.map MsgForInput (Input.view model.input)
        ]