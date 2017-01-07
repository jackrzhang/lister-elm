module App.Types exposing (..)

import App.Input.Types as Input
import App.Entries.Types as Entries
import App.Control.Types as Control


-- MODEL

type alias Model =
    { input : Input.Model
    , entries : Entries.Model
    , control : Control.Model
    }


-- MSG

type Msg
    = NoOp
    | ChainMsgs (List Msg)
    | MsgForInput Input.Msg
    | MsgForEntries Entries.Msg
    | MsgForControl Control.Msg