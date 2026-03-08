# diablo4-flurry-fix

## Rationale

Currently (as of Season 11), there is a bug with Flurry and Shadow Clone that is somewhat attack speed dependent. I don't know the exact attack speed breakpoints where it triggers consistently, however it's not difficult to reach those breakpoints without trying to.

Long story short, when the bug triggers, Shadow Clone stops dealing any damage with Flurry if you hold down the Flurry key. However, if you mash the Flurry key instead of holding it down, Shadow Clone will deal damage as it should.

## The Fix

There are many ways of doing this, the simplest one - mash the button manually. At least for me this is hard on hands, so not a long term option. Some software for Logitech gaming mice and keyboards can configure a button press to behave like mashing if it's held down.

Vendor-agnostic way of doing this on Windows is to use [AutoHotkey](https://github.com/AutoHotkey/AutoHotkey). I won't give you step-by-step instructions on how to install and configure AutoHotkey here, and whether it is safe or not - do your own research and decide for yourself.

This repo has two scripts:

### 1_flurry.ahk
You can use this script if Flurry is bound to `1`. The script has the following logic:

 * Short press of `1` (< 400ms) → behaves like a normal `1` keypress
 * Long press (≥ 400ms) → enters loop mode and sends the repeating pattern (35ms on → 73ms off → 37ms on → 71ms off) for as long as you physically hold `1`

To stop the script from running and terurn to normal `1` behaviour, press `Win`+`X`.

### RButton_flurry.ahk
You can use this script if Flurry is bound to `Right Mouse Button (Secondary click)`. The script has the following logic:

 * Short press of `Right Mouse Button` (< 400ms) → behaves like a normal `Right Mouse Button` keypress
 * Long press (≥ 400ms) → enters loop mode and sends the repeating pattern (35ms on → 73ms off → 37ms on → 71ms off) for as long as you physically hold `Right Mouse Button`

To stop the script from running and terurn to normal `Right Mouse Button` behaviour, press `Win`+`X`.

## Ethical Considerations

You can decide for yourself if you consider this ethical or not. Here are my personal opinions:

 * This is **not** an exploit to somehow deal more damage that should be possible
 * This is technically a "nerf". In ideal conditions when you can hold down Flurry key and Shadow Clone deals damage as expected, your DPS will be higher compared to mashing Flurry
 * While *technically* a macro, the script doesn't modify gameplay or make it easier: without this script - you hold down Flurry key → you spam Flurry. With this script, you hold down Flurry key → you spam Flurry.
 * The key point of this is to make sure Shadow Clone deals damage like it's supposed to.

Use at your own risk. If you get banned or face any consequences for this - I am not in any way responsible. Make your own choices based on your own assessments.
