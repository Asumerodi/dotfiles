import           Graphics.X11.ExtraTypes.XF86
import           XMonad
import           XMonad.Config.Desktop
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ICCCMFocus
import           XMonad.Hooks.SetWMName
import           XMonad.Layout.MultiToggle
import           XMonad.Layout.MultiToggle.Instances
import           XMonad.Layout.NoBorders
import           XMonad.Util.EZConfig                (additionalKeys)

start = do
  spawn "$HOME/.xmonad/autostart"
  setWMName "LG3D"

myLayout = smartBorders
  $ mkToggle (NOBORDERS ?? FULL ?? EOT)
  $ tiled ||| Mirror tiled
    where
      tiled    = Tall nmaster delta ratio
      nmaster  = 1
      ratio    = 309/500
      delta    = 1/1000

modm = mod4Mask

fullToggle = do
  spawn "stoggle"
  sendMessage $ Toggle FULL

dzcall = "dzvol -fn 'DejaVu Sans Mono for Powerline'"

main = xmonad $ ewmh $ desktopConfig
  { terminal   = "st"
  , modMask    = modm
  , layoutHook = myLayout
  , startupHook = start
  , focusedBorderColor = "#CB4B16"
  , normalBorderColor = "#93A1A1"
  , logHook = takeTopFocus
  } `additionalKeys`
        -- toggle fullscreen, dpms and xautolock
      [ ( ( modm              , xK_f                     )
        , fullToggle                                          )
        -- lower volume
      , ( ( 0                 , xF86XK_AudioLowerVolume  )
        , spawn $ "pactl set-sink-volume 0 -1%; " ++ dzcall   )
        -- raise volume
      , ( ( 0                 , xF86XK_AudioRaiseVolume  )
        , spawn $ "pactl set-sink-volume 0 +1%; " ++ dzcall   )
        -- mute volume
      , ( ( 0                 , xF86XK_AudioMute         )
        , spawn $ "pactl set-sink-mute 0 toggle; " ++ dzcall  )
        -- start qutebrowser
      , ( ( modm              , xK_b                     )
        , spawn "qutebrowser --backend webengine"             )
        -- start qutebrowser with nvidia card
      , ( ( modm .|. shiftMask, xK_b                     )
        , spawn "optirun qutebrowser --backend webengine"     )
        -- screen lock
      , ( ( modm .|. shiftMask, xK_l                     )
        , spawn "loginctl lock-session"                       )
        -- screenshot
      , ( ( modm , xK_Print                              )
        , spawn "maim -u \
            \ | png2ff | lrzip -zp1 -L9 \
            \ > ~/shots/$(date +%m.%d.%y_%I.%M.%S_%p).ff.lrz" )
        -- screenshot focused window
      , ( ( modm .|. shiftMask, xK_Print                 )
        , spawn "maim -u -i$(xdotool getactivewindow) \
            \ | png2ff \
            \ | lrzip -zp1 -L9 \
            \ > ~/shots/$(date +%m.%d.%y_%I.%M.%S_%p).ff.lrz" )
        -- screenshot selection to clipboard
      , ( ( modm .|. controlMask, xK_Print               )
        , spawn "maim -s -u \
            \ | xclip -selection clipboard -t image/png"      )
        -- screenshot selection file
      , ( ( modm .|. controlMask .|. shiftMask, xK_Print )
        , spawn "maim -s -u \
            \ | png2ff \
            \ | lrzip -zp1 -L9 \
            \ > ~/shots/$(date +%m.%d.%y_%I.%M.%S_%p).ff.lrz" )
        -- screenshot selection to imgur and paste url in clipboard
      , ( ( modm .|. shiftMask, xK_i                     )
        , spawn "maim -s -u /tmp/img.png; \
            \ imgurbash.sh /tmp/img.png; \
            \ rm /tmp/img.png"                                )
        -- toggle touchpad
      , ( ( 0                 , xF86XK_TouchpadToggle    )
        , spawn "touchtoggle"                                 )
      ]
