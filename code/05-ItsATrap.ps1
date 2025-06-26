# Failsafe
return

#----------------------------------------------------------------------------#
#                               IT'S A TRAP!!!                               #
#----------------------------------------------------------------------------#

# 1) Ambushing Innocent Code
code "$presentationRoot\resources\trap1-nothing.ps1"
& "$presentationRoot\resources\trap1-nothing.ps1"

# 2) Ambushing Not-So-Innocent Code
code "$presentationRoot\resources\trap2-mathematically-challenged.ps1"
& "$presentationRoot\resources\trap2-mathematically-challenged.ps1"

# 3) Capturing other evil
code "$presentationRoot\resources\trap3-throwing-in-with-evil.ps1"
& "$presentationRoot\resources\trap3-throwing-in-with-evil.ps1"
& "$presentationRoot\resources\trap3-throwing-in-with-evil.ps1" -ErrorAction Ignore

# 4) Slaying Evil
code "$presentationRoot\resources\trap4-ending-it-right.ps1"
& "$presentationRoot\resources\trap4-ending-it-right.ps1"

# 5) Handling it responsibly
code "$presentationRoot\resources\trap5-handling-stuff.ps1"
& "$presentationRoot\resources\trap5-handling-stuff.ps1"

# 6) Breaking and Entering
code "$presentationRoot\resources\trap6-breaking-things.ps1"
& "$presentationRoot\resources\trap6-breaking-things.ps1"

# 7) Moving on
code "$presentationRoot\resources\trap7-LetsContinue.ps1"
& "$presentationRoot\resources\trap7-LetsContinue.ps1"


# X) Default Error Handling in Scripts
code "$presentationRoot\resources\trap8-ScriptDefaults.ps1"
& "$presentationRoot\resources\trap8-ScriptDefaults.ps1"
$error[0].ScriptStackTrace
$error[0]
$error[1].ScriptStackTrace

# Next: Preferential Treatment
code "$presentationRoot\06-Preferences.ps1"