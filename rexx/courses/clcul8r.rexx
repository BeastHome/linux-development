/* Rexx exec CLCUL8R (calculator) lab 18 */
Signal On Syntax
Parse Arg calc
Do Forever
   Do While calc = ''
      Say "Please enter an arithmetic expression or 'EXIT':"
      Parse Pull calc
      If Translate(calc) = 'EXIT' Then
         Call Exit
   End /* While */
Call Runit
calc = ''
End /* Forever */
Runit:
Interpret 'Say calc "="' calc
Return
Exit:
Say "Goodbye."
Exit 0
Syntax:
Say "Error processing arithmetic expression:" calc
Say "Perhaps you didn't enter numeric values or proper arithmetic",
    "operators?"
Say "Try again."
Say
Return