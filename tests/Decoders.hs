{-# Language CPP, TemplateHaskell #-}

module Decoders where

import Data.ByteString.Lazy

import Data.Aeson
import Data.Aeson.TH

import Instances ()
import Types

instance ToJSON Nullary where
    toJSON = $(mkToJSON defaultOptions ''Nullary)

instance FromJSON Nullary where
    parseJSON = $(mkParseJSON defaultOptions ''Nullary)

decodeLenient :: Nullary -> Bool
decodeLenient nullary = Data.Aeson.decodeLenient (encode nullary :: ByteString) == Just nullary
