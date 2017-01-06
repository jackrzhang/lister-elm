module App.State exposing (..)

import App.Types exposing (..)
import App.Input.State as Input
import App.Entries.State as Entries
import App.Control.State as Control


-- INIT

initialModel : Model
initialModel =
    { input = Input.initialModel
    , entries = Entries.initialModel
    , control = Control.initialModel
    }


init : ( Model, Cmd Msg )
init =
    initialModel ! []


-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of

        ChainMsgs msgs ->
            (List.foldl chain (model ! []) msgs)

        MsgForInput inputMsg ->
            { model | input = Input.updateModel inputMsg model.input}
                ! []

        MsgForEntries entriesMsg ->
            { model | entries = Entries.updateModel entriesMsg model.entries }
                ! []

        MsgForControl controlMsg ->
            { model | control = Control.updateModel controlMsg model.control }
                ! []


chain : Msg -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
chain msg ( model, cmd ) =
    let ( nextModel, nextCmd ) =
        update msg model
    in
        nextModel ! [ cmd, nextCmd ]
