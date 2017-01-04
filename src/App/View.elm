module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import App.Types exposing (..)


view : Model -> Html Msg
view model =
    div [] [ text model.text ]