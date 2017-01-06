module App.Control.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import App.Types as App
import App.Control.Types as Control exposing (..)


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
        span [ class classes ]
            [ text (toString filter)
            ]

