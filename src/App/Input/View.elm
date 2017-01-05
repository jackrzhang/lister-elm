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
    div []
        [ input
            [ type_ "text"
            , placeholder "Type and enter stuff"
            , autofocus True
            , value model.text
            , onInput (App.MsgForInput << Input.UpdateInput)
                -- equivalent to: (\str -> App.MsgForInput (Input.UpdateInput str))
            , onEnter <| App.ChainMsgs
                [ (createAddEntryMsg model)
                , (App.MsgForInput Input.ClearInput)
                ]
            ]
            []
        ]


createAddEntryMsg : Input.Model -> App.Msg
createAddEntryMsg model =
    Entries.Entry 0 model.text False
        |> Entries.AddEntry
        |> App.MsgForEntries