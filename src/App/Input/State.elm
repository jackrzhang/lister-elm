module App.Input.State exposing (..)

import App.Input.Types exposing (..)


-- INIT

initialModel : Model
initialModel =
    { text = "Hello World!"
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


-- UPDATE

update : Msg -> Model -> Model
update msg model =
    case msg of

        UpdateInput text ->
            { model | text = text }