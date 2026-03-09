#Requires AutoHotkey v2.0

*RButton::
{
    ; Record when button was first pressed
    pressTime := A_TickCount

    ; Wait to see if this becomes a "long press" (>150ms)
    ; While waiting, check if button is released early
    Loop {
        Sleep(10)

        ; If button was released before 400ms, send a normal right-click
        if !GetKeyState("RButton", "P") {
            SendInput("{RButton down}")
            Sleep(50)
            SendInput("{RButton up}")
            return
        }

        ; If we've held for >400ms, break into the loop mode
        if (A_TickCount - pressTime > 150)
            break
    }

    ; === LOOP MODE ===
    ; Repeat the custom hold/release pattern while RButton is physically held
    Loop {
        ; Exit if button has been released
        if !GetKeyState("RButton", "P") {
            SendInput("{RButton up}")
            break
        }

        ; Hold RButton for 35ms
        SendInput("{RButton down}")
        Sleep(35)

        ; Release RButton for 73ms
        SendInput("{RButton up}")
        Sleep(73)

        ; Hold RButton for 37ms
        SendInput("{RButton down}")
        Sleep(37)

        ; Release RButton for 71ms
        SendInput("{RButton up}")
        Sleep(71)
    }
}

#x::ExitApp  ; Win+X
