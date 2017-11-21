# HamburgerMenuAnimation
A UIButton "Hamburger Menu" which turns into a "back arrow" button or a "quit" button.

## Installation
For now, only the manual installation is available. Copy the 3 source files in your project to make it work. If you only want to use **HamburgerToArrow** or **HamburgerToQuit**, you only need to copy `Hamburger.swift` and one of these two files : `HamburgerToArrow.swift` or `HamburgerToQuit.swift`.

## Usage
`HamburgerToArrow` and `HamburgerToQuit` are UIButton subclasses. You can create a UIButton from the storyboard and assign the class you want to use in the Identity Inspector. That's it.

If you want to force a state without waiting for the user to interact with the button, you can do it by using the following methods :
```
myHamburgerButton.toHamburger()
myHamburgerButton.toArrow()
myHamburgerButton.toQuit()
```

You can get the current button state by reading the `isArrow` or `isQuit` properties. If it returns false, the button is in Hamburger mode.
