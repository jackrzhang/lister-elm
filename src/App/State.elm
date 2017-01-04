module App.State exposing (..)

import App.Types exposing (..)


-- INIT

initialModel : Model
initialModel =
    { text = "Hello World!"
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- UPDATE

updateWithCmd : Msg -> Model -> ( Model, Cmd Msg )
updateWithCmd msg model =
    ( update msg model, updateCmd msg )


update : Msg -> Model -> Model
update msg model =
    model


updateCmd : Msg -> Cmd Msg
updateCmd msg =
    Cmd.batch []
