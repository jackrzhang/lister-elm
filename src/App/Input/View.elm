module App.Input.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

import App.Input.Types exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ input
            [ type_ "text"
            , placeholder "Type and enter stuff"
            , onInput UpdateInput
            ]
            []
        ]