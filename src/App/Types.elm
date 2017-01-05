module App.Types exposing (..)

import App.Input.Types as Input


-- MODEL

type alias Model =
    { input : Input.Model
    }


-- MSG

type Msg
    = NoOp
    | MsgForInput Input.Msg