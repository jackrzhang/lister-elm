module App.Entries.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

import App.Types as App
import App.Entries.Types as Entries


view : Entries.Model -> Html App.Msg
view model =
    div []
        [ div [] (List.map viewEntry model.list)
        ]


viewEntry : Entries.Entry -> Html App.Msg
viewEntry entry =
    div [ class "entry" ]
        [ span [ class "checkmark" ]
            [ text "☑ " 
            ]
        , text entry.text
        , div [ class "container" ]
            [ span [ class "x" ] 
                [ text "×" 
                ]
            ]
        ]