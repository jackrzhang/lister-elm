module App.Entries.Types exposing (..)


-- MODEL

type alias Entry =
    { id : Int
    , text : String
    , starred : Bool
    }


type alias Model =
    List Entry


-- MSG

type Msg
    = AddEntry Entry