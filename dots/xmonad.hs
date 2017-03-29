import           Graphics.X11.ExtraTypes.XF86
import           XMonad
import           XMonad.Config.Desktop
import           XMonad.Hooks.ICCCMFocus
import           XMonad.Hooks.SetWMName
import           XMonad.Layout.NoBorders
import           XMonad.Util.EZConfig         (additionalKeys)

start = do
  spawn "$HOME/.xmonad/autostart"
  setWMName "LG3D"

myLayout = smartBorders tiled ||| noBorders Full
  where
    tiled    = Tall nmaster delta ratio
    nmaster  = 1
    ratio    = 309/500
    delta    = 9/500

modm = mod4Mask

layoutToggle = do
  spawn "stoggle"
  sendMessage NextLayout

main = xmonad $ desktopConfig
  { terminal   = "st"
  , modMask    = modm
  , layoutHook = myLayout
  , startupHook = start
  , focusedBorderColor = "#CB4B16"
  , normalBorderColor = "#93A1A1"
  , logHook = takeTopFocus
  } `additionalKeys`
        -- toggle fullscreen, dpms and xautolock
      [ ((modm              , xK_space               ),
        layoutToggle                                   )
        -- lower volume
      , ((0                 , xF86XK_AudioLowerVolume),
        spawn "pactl set-sink-volume 0 -1%; dzvol"     )
        -- raise volume
      , ((0                 , xF86XK_AudioRaiseVolume),
        spawn "pactl set-sink-volume 0 +1%; dzvol"     )
        -- mute volume
      , ((0                 , xF86XK_AudioMute       ),
        spawn "pactl set-sink-mute 0 toggle; dzvol"    )
        -- start qutebrowser
      , ((modm              , xK_b                   ),
        spawn "qutebrowser --backend webengine"        )
        -- start qutebrowser with nvidia card
      , ((modm .|. shiftMask, xK_b                   ),
        spawn "optirun qutebrowser --backend webengine")
        -- screen lock
      , ((modm .|. shiftMask, xK_l                   ),
        spawn "loginctl lock-session"                  )
        -- toggle touchpad
      , ((0                 , xF86XK_TouchpadToggle  ),
        spawn "touchtoggle"                            )
      ]
