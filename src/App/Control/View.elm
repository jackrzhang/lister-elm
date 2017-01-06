module App.Control.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import App.Types as App
import App.Control.Types as Control exposing (..)
import App.Entries.Types as Entries exposing (..)


view : Control.Model -> Html App.Msg
view model =
    div [ class "control" ]
        [ viewFilters
            [ ( All, model.filter )
            , ( Active, model.filter )
            , ( Complete, model.filter )
            ]
        ]


viewFilters : List ( Filter, Filter ) -> Html App.Msg
viewFilters options =
    div [] (List.map viewFilter options)


viewFilter : ( Filter, Filter ) -> Html App.Msg
viewFilter ( filter, current ) = 
    let classes =
        if filter == current then
            "filter current"
        else
            "filter"
    in
        span 
            [ class classes
            , onClick <| App.ChainMsgs
                [ App.MsgForControl (Control.ApplyFilter filter)
                , App.MsgForEntries (Entries.ApplyFilter filter)
                ]
            ]
            [ text (toString filter)
            ]

