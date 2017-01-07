module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import App.Types exposing (..)
import App.Input.View as Input
import App.Entries.View as Entries
import App.Control.View as Control


view : Model -> Html Msg
view model =
    div []
        [ title
        , Input.view model.input
        , Entries.view model.entries
        , viewControl model
        , infoFooter
        ]


viewControl : Model -> Html Msg
viewControl model =
    if not (List.isEmpty model.entries.list) then
        Control.view model.control
    else 
        div [] []


title : Html Msg
title =
    header []
        [ h1 []
            [ a [ href "https://github.com/jackrzhang/lister-elm" ] 
                [ text "lister"] 
            ]
        ]


infoFooter : Html Msg
infoFooter =
    footer []
        [ p []
            [ text "Written by "
            , a [ href "https://github.com/jackrzhang" ] [ text "Jack Zhang" ]
            ]
        , p []
            [ text "Built with "
            , a [ href "http://elm-lang.org" ] [ text "Elm" ]
            ]
        ]
