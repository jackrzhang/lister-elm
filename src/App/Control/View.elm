module App.Control.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import App.Types as App
import App.Control.Types as Control


view : Control.Model -> Html App.Msg
view model =
    div []
        [ text (toString model.filter)
        ]
