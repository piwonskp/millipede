{-# LANGUAGE OverloadedStrings #-}
module GUI (createGUI) where

import Data.Maybe (fromJust)
import Data.GI.Base.ManagedPtr (unsafeCastTo)
import qualified GI.Gtk.Functions as GI (main, init)
import GI.Gtk (widgetShowAll, mainQuit, onButtonClicked, Button(..), Window(..), Label(..), builderGetObject, builderAddFromFile, builderNew, labelSetText)
import Network.Wreq
import Control.Lens
import Data.Aeson.Lens (_String, key)
import Data.Text.Encoding (decodeUtf8)


getVersion response = response ^. responseBody . key "version" . _String

setVersion label = do
  response <- get "http://web:8000/version"
  labelSetText label $ getVersion response

createGUI = do
  GI.init Nothing
  builder <- builderNew
  builderAddFromFile builder "../interface.glade"

  window <- builderGetObject builder "window" >>= unsafeCastTo Window . fromJust
  close <- builderGetObject builder "close" >>= unsafeCastTo Button . fromJust
  appVersion <- builderGetObject builder "app-version" >>= unsafeCastTo Label . fromJust

  refresh <- builderGetObject builder "refresh" >>= unsafeCastTo Button . fromJust
  serverVersion <- builderGetObject builder "server-version" >>= unsafeCastTo Label . fromJust


  labelSetText appVersion "Haskell"
  onButtonClicked close mainQuit
  onButtonClicked refresh $ setVersion serverVersion

  widgetShowAll window
  GI.main
