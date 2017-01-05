module App.Types exposing (..)

import App.Input.Types as Input
import App.Entries.Types as Entries


-- MODEL

type alias Model =
    { input : Input.Model
    , entries : Entries.Model
    }


-- MSG

type Msg
    = ChainMsgs (List Msg)
    | MsgForInput Input.Msg
    | MsgForEntries Entries.Msg