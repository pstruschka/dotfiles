import XMonad

main :: IO ()
main = xmonad $ def {
  terminal    = myTerminal,
  modMask     = myModMask,
  borderWidth = myBorderWidth
                    }

myTerminal :: String
myTerminal = "alacritty"

myModMask :: KeyMask
myModMask = mod4Mask

myBorderWidth :: Dimension
myBorderWidth = 3
