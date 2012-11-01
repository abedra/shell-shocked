import XMonad

main = do
  xmonad $ defaultConfig
    { terminal = "gnome-terminal" }
