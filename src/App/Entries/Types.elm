module App.Entries.Types exposing (..)

import App.Control.Types exposing (Filter)

-- MODEL

type alias Entry =
    { id : Int
    , text : String
    , starred : Bool
    }


type alias Model =
    { list : List Entry
    , filter : Filter
    }


-- MSG

type Msg
    = AddEntry Entry
    | ApplyFilter Filter