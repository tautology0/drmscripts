# drmscripts

Some scripts to remove DRM so you can backup your legally purchased data and play them on unintended devices.

## aaxtomp3

Converts an audible aax file to one mp3 file per chapter. Most of the current utilities only seem to convert one aax to one mp3, which when you're listening to a 52 hour audio book, is a tad excessive.

I wrote this as one of my mp3 players doesn't support audible so I wanted a way of transferring my audio books in a supported format.

Syntax:
powershell .\aaxtomp3 \<keyfile\> \<aaxfile\> \<outdirectory\>

The keyfile is a file containing your audible activation token. How to get this I'll leave as an exercise to the reader. Five minutes searching the web should tell you.

Note as Powershell's execution model is very strange you may need to bypass its execution policy.