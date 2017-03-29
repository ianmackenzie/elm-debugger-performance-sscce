module Main exposing (..)

import Html exposing (Html)
import AnimationFrame
import Time


type alias Model =
    { numbers : List (List Int)
    , fps : Float
    }


type Msg
    = Tick Float


init : ( Model, Cmd Msg )
init =
    ( { numbers = List.repeat 1000 (List.range 1 1000), fps = 0 }, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update (Tick delta) model =
    ( { model | fps = Time.second / delta }, Cmd.none )


view : Model -> Html Msg
view model =
    Html.text (toString model.fps ++ " fps")


subscriptions : Model -> Sub Msg
subscriptions model =
    AnimationFrame.diffs Tick


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
