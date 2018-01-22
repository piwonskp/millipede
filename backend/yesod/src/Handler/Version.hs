{-# LANGUAGE OverloadedStrings #-}
module Handler.Version where

import Import
import Data.Aeson (object, (.=))


getVersionR :: Handler Value
getVersionR = return $ object [ ("version" .= ("Yesod" :: String))]
