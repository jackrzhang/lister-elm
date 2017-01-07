module App.Entries.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import App.Types as App
import App.Control.Types as Control exposing (Filter(..))
import App.Entries.Types as Entries


view : Entries.Model -> Html App.Msg
view model =
    let list =
        filterEntries model.filter model.list
    in
        div []
            [ div [] (List.map viewEntry list)
            ]


filterEntries : Filter -> List Entries.Entry -> List Entries.Entry
filterEntries filter list =
    case filter of

        All ->
            list

        Active ->
            List.filter (\entry -> entry.complete == False) list

        Complete ->
            List.filter (\entry -> entry.complete == True) list


viewEntry : Entries.Entry -> Html App.Msg
viewEntry entry =
    let textStyle =
        if entry.complete then
            " complete"
        else
            " active"
    in
        div [ class "entry" ]
            [ span
                [ class "checkmark" 
                , onClick <|
                    App.MsgForEntries (Entries.ToggleComplete entry.id)
                ]
                [ text "☑ "
                ]
            , span 
                [ class ("text" ++ textStyle)]
                [ text entry.text 
                ]
            , div [ class "container" ]
                [ span 
                    [ class "x" 
                    , onClick <|
                        App.MsgForEntries (Entries.RemoveEntry entry.id)
                    ] 
                    [ text " ×" 
                    ]
                ]
            ]
