module App.State exposing (..)

import App.Types exposing (..)
import App.Input.State as Input
import App.List.State as List


-- INIT

initialModel : Model
initialModel =
    { input = Input.initialModel
    , list = List.initialModel
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
    case msg of

        MsgForInput inputMsg ->
            { model | input = Input.update inputMsg model.input}

        MsgForList listMsg ->
            { model | list = List.update listMsg model.list}


updateCmd : Msg -> Cmd Msg
updateCmd msg =
    Cmd.batch
        []
