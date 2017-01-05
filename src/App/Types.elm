module App.Types exposing (..)

import App.Input.Types as Input
import App.List.Types as List


-- MODEL

type alias Model =
    { input : Input.Model
    , list : List.Model
    }


-- MSG

type Msg
    = MsgForInput Input.Msg
    | MsgForList List.Msg