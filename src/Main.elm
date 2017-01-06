module Main exposing (main)

import Html

import App.Types exposing (..)
import App.State
import App.View


main : Program Never Model Msg
main =
    Html.program
        { init = App.State.init
        , update = App.State.update
        , view = App.View.view
        , subscriptions = \_ -> Sub.none
        }
