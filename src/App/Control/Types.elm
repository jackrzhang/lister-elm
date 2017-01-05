module App.Control.Types exposing (..)


-- MODEL

type Filter
    = All
    | Active
    | Complete


type alias Model =
    { filter : Filter
    }


-- MSG

type Msg
    = ApplyFilter Filter