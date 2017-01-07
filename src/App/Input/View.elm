module App.Input.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Utility.OnEnter exposing (onEnter)

import App.Types as App
import App.Input.Types as Input
import App.Entries.Types as Entries


view : Input.Model -> Html App.Msg
view model =
    div [ class "input" ]
        [ span [ class "caret" ] [ text "❯ " ]
        , input
            [ type_ "text"
            , placeholder "write stuff, hit enter"
            , autofocus True
            , value model.text
            , onInput (App.MsgForInput << Input.UpdateInput)
                -- equivalent to: (\str -> App.MsgForInput (Input.UpdateInput str))
            , onEnter (selectOnEnterMsg model)
            ]
            []
        ]


selectOnEnterMsg : Input.Model -> App.Msg
selectOnEnterMsg model =
    if model.text == "" then
        App.NoOp
    else 
        App.ChainMsgs
            [ (createAddEntryMsg model)
            , (App.MsgForInput Input.ClearInput)
            ]


createAddEntryMsg : Input.Model -> App.Msg
createAddEntryMsg model =
    model.text
        |> Entries.AddEntry
        |> App.MsgForEntries