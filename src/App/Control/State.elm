module App.Control.State exposing (..)

import App.Control.Types exposing (..)


-- INIT

initialModel : Model
initialModel =
    { filter = All
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- UPDATE

update : Msg -> Model -> Model
update msg model =
    case msg of

        ApplyFilter filter ->
            { model | filter = filter }