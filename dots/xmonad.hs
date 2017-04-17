import           Graphics.X11.ExtraTypes.XF86
import           XMonad
import           XMonad.Config.Desktop
import           XMonad.Hooks.EwmhDesktops
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
  spawn "sleep 0.1; xset q | grep 'DPMS is' | dzen2 -p 2 -tw 250"
  sendMessage NextLayout

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
      [ ( ( modm              , xK_space                )
        , layoutToggle                                                  )
        -- lower volume
      , ( ( 0                 , xF86XK_AudioLowerVolume )
        , spawn "pactl set-sink-volume 0 -1%; dzvol"                    )
        -- raise volume
      , ( ( 0                 , xF86XK_AudioRaiseVolume )
        , spawn "pactl set-sink-volume 0 +1%; dzvol"                    )
        -- mute volume
      , ( ( 0                 , xF86XK_AudioMute        )
        , spawn "pactl set-sink-mute 0 toggle; dzvol"                   )
        -- start qutebrowser
      , ( ( modm              , xK_b                    )
        , spawn "qutebrowser --backend webengine"                       )
        -- start qutebrowser with nvidia card
      , ( ( modm .|. shiftMask, xK_b                    )
        , spawn "optirun qutebrowser --backend webengine"               )
        -- screen lock
      , ( ( modm .|. shiftMask, xK_l                    )
        , spawn "loginctl lock-session"                                 )
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
      , ( ( 0                 , xF86XK_TouchpadToggle   )
        , spawn "touchtoggle"                                           )
      ]
