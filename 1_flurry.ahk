#Requires AutoHotkey v2.0

*1::
{
    ; Record when button was first pressed
    pressTime := A_TickCount

    ; Wait to see if this becomes a "long press" (>400ms)
    ; While waiting, check if button is released early
    Loop {
        Sleep(10)

        ; If button was released before 400ms, send a normal right-click
        if !GetKeyState("1", "P") {
            SendInput("{1 down}")
            Sleep(50)
            SendInput("{1 up}")
            return
        }

        ; If we've held for >400ms, break into the loop mode
        if (A_TickCount - pressTime > 400)
            break
    }

    ; === LOOP MODE ===
    ; Repeat the custom hold/release pattern while 1 is physically held
    Loop {
        ; Exit if button has been released
        if !GetKeyState("1", "P") {
            SendInput("{1 up}")
            break
        }

        ; Hold 1 for 35ms
        SendInput("{1 down}")
        Sleep(35)

        ; Release 1 for 73ms
        SendInput("{1 up}")
        Sleep(73)

        ; Hold 1 for 37ms
        SendInput("{1 down}")
        Sleep(37)

        ; Release 1 for 71ms
        SendInput("{1 up}")
        Sleep(71)
    }
}
#x::ExitApp  ; Win+X