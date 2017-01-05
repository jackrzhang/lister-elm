module App.Input.Types exposing (..)


-- MODEL

type alias Model =
    { text : String
    }


-- MSG

type Msg
    = UpdateInput String
    | ClearInput