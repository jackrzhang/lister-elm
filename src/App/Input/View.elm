module App.Input.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Utility.OnEnter exposing (onEnter)

import App.Types as App
import App.Input.Types as Input
import App.List.Types as List


view : Input.Model -> Html App.Msg
view model =
    div []
        [ input
            [ type_ "text"
            , placeholder "Type and enter stuff"
            --, onInput App.MsgForInput <| UpdateInput model.text
            , onEnter App.NoOp (createAddEntryMsg model)
            ]
            []
        ]


createAddEntryMsg : Input.Model -> App.Msg
createAddEntryMsg model =
    List.Entry 0 model.text False
        |> List.AddEntry
        |> App.MsgForList