{-# LANGUAGE NoMonomorphismRestriction #-}
module Extra where

import qualified Text.Show.Pretty as Pretty
import qualified Language.Haskell.HsColour as HsColour
import qualified Language.Haskell.HsColour.Colourise as HsColour
import qualified Language.Haskell.HsColour.Output as HsColour

myColourPrefs = HsColour.defaultColourPrefs
  { HsColour.conid    = [ HsColour.Foreground HsColour.Yellow
                        , HsColour.Bold
                        ]
  , HsColour.conop    = [ HsColour.Foreground HsColour.Yellow ]
  , HsColour.string   = [ HsColour.Foreground HsColour.Green ]
  , HsColour.char     = [ HsColour.Foreground HsColour.Cyan ]
  , HsColour.number   = [ HsColour.Foreground HsColour.Red
                        , HsColour.Bold
                        ]
  , HsColour.layout   = [ HsColour.Foreground HsColour.White ]
  , HsColour.keyglyph = [ HsColour.Foreground HsColour.White ]
  }

myPrint =
  putStrLn . HsColour.hscolour ( HsColour.TTYg HsColour.XTerm256Compatible )
    myColourPrefs False False "" False . Pretty.ppShow
