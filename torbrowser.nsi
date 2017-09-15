;NSIS Installer for JonDoBrowser Bundle
;Written by Moritz Bartl
;released under Public Domain

;--------------------------------
;Modern" UI

  !include "MUI2.nsh"

;--------------------------------
;General
 
  ; location of JonDoBrowser bundle to put into installer
  !define TBBSOURCE ".\JonDoBrowser\"  

  Name "JonDoBrowser"
  OutFile "torbrowser-install.exe"

  ;Default installation folder
  InstallDir "$DESKTOP\JonDoBrowser"
  
  ;Best (but slowest) compression
  SetCompressor /SOLID lzma
  SetCompressorDictSize 32

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Interface Configuration

  !define MUI_ICON   "jondobrowser.ico"
  !define MUI_ABORTWARNING

;--------------------------------
;Modern UI settings
  !define MUI_FINISHPAGE_NOREBOOTSUPPORT     ; we don't require a reboot
  !define MUI_FINISHPAGE_RUN
  !define MUI_FINISHPAGE_RUN_FUNCTION "StartJonDoBrowser"
  !define MUI_FINISHPAGE_SHOWREADME ; misuse for option to create shortcut; less ugly than MUI_PAGE_COMPONENTS
  !define MUI_FINISHPAGE_SHOWREADME_TEXT "&Add Start Menu && Desktop shortcuts"
  !define MUI_FINISHPAGE_SHOWREADME_FUNCTION "CreateShortCuts"
;--------------------------------
;Pages

  !define MUI_PAGE_CUSTOMFUNCTION_LEAVE CheckIfTargetDirectoryExists
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English" ;first language is the default language
  !insertmacro MUI_LANGUAGE "French"
  !insertmacro MUI_LANGUAGE "German"
  !insertmacro MUI_LANGUAGE "Spanish"
  !insertmacro MUI_LANGUAGE "SpanishInternational"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Japanese"
  !insertmacro MUI_LANGUAGE "Korean"
  !insertmacro MUI_LANGUAGE "Italian"
  !insertmacro MUI_LANGUAGE "Dutch"
  !insertmacro MUI_LANGUAGE "Danish"
  !insertmacro MUI_LANGUAGE "Swedish"
  !insertmacro MUI_LANGUAGE "Norwegian"
  !insertmacro MUI_LANGUAGE "NorwegianNynorsk"
  !insertmacro MUI_LANGUAGE "Finnish"
  !insertmacro MUI_LANGUAGE "Greek"
  !insertmacro MUI_LANGUAGE "Russian"
  !insertmacro MUI_LANGUAGE "Portuguese"
  !insertmacro MUI_LANGUAGE "PortugueseBR"
  !insertmacro MUI_LANGUAGE "Polish"
  !insertmacro MUI_LANGUAGE "Ukrainian"
  !insertmacro MUI_LANGUAGE "Czech"
  !insertmacro MUI_LANGUAGE "Slovak"
  !insertmacro MUI_LANGUAGE "Croatian"
  !insertmacro MUI_LANGUAGE "Bulgarian"
  !insertmacro MUI_LANGUAGE "Hungarian"
  !insertmacro MUI_LANGUAGE "Thai"
  !insertmacro MUI_LANGUAGE "Romanian"
  !insertmacro MUI_LANGUAGE "Latvian"
  !insertmacro MUI_LANGUAGE "Macedonian"
  !insertmacro MUI_LANGUAGE "Estonian"
  !insertmacro MUI_LANGUAGE "Turkish"
  !insertmacro MUI_LANGUAGE "Lithuanian"
  !insertmacro MUI_LANGUAGE "Slovenian"
  !insertmacro MUI_LANGUAGE "Serbian"
  !insertmacro MUI_LANGUAGE "SerbianLatin"
  !insertmacro MUI_LANGUAGE "Arabic"
  !insertmacro MUI_LANGUAGE "Farsi"
  !insertmacro MUI_LANGUAGE "Hebrew"
  !insertmacro MUI_LANGUAGE "Indonesian"
  !insertmacro MUI_LANGUAGE "Mongolian"
  !insertmacro MUI_LANGUAGE "Luxembourgish"
  !insertmacro MUI_LANGUAGE "Albanian"
  !insertmacro MUI_LANGUAGE "Breton"
  !insertmacro MUI_LANGUAGE "Belarusian"
  !insertmacro MUI_LANGUAGE "Icelandic"
  !insertmacro MUI_LANGUAGE "Malay"
  !insertmacro MUI_LANGUAGE "Bosnian"
  !insertmacro MUI_LANGUAGE "Kurdish"
  !insertmacro MUI_LANGUAGE "Irish"
  !insertmacro MUI_LANGUAGE "Uzbek"
  !insertmacro MUI_LANGUAGE "Galician"
  !insertmacro MUI_LANGUAGE "Afrikaans"
  !insertmacro MUI_LANGUAGE "Catalan"
  !insertmacro MUI_LANGUAGE "Esperanto"

;--------------------------------
;Multi Language support: Read strings from separate file

; !include torbrowser-langstrings.nsi

;--------------------------------
;Reserve Files
  
  ;If you are using solid compression, files that are required before
  ;the actual installation should be stored first in the data block,
  ;because this will make your installer start faster.
  
  !insertmacro MUI_RESERVEFILE_LANGDLL
;--------------------------------
;Version Information
  VIProductVersion "Version_To_Be_Replaced"
  ;English
  VIAddVersionKey /LANG=${Lang_To_Be_Replaced} "ProductVersion" "Version_To_Be_Replaced"
  VIAddVersionKey /LANG=${Lang_To_Be_Replaced} "FileDescription" "JonDoBrowser"
  VIAddVersionKey /LANG=${Lang_To_Be_Replaced} "ProductName" "JonDoBrowser"
  VIAddVersionKey /LANG=${Lang_To_Be_Replaced} "CompanyName" "Jondos GmbH"
  VIAddVersionKey /LANG=${Lang_To_Be_Replaced} "LegalTrademarks" "Legal_Notice_To_Be_Replaced"
  
;--------------------------------
;Installer Sections

Section "JonDoBrowser Bundle" SecTBB

  SetOutPath "$INSTDIR"
  File /r "${TBBSOURCE}\*.*"
  SetOutPath "$INSTDIR\Browser"
  CreateShortCut "$INSTDIR\Start JonDoBrowser.lnk" "$INSTDIR\Browser\firefox.exe"

SectionEnd

Function VersionCompare
  !define VersionCompare `!insertmacro VersionCompareCall`
  !macro VersionCompareCall _VER1 _VER2 _RESULT
    Push `${_VER1}`
    Push `${_VER2}`
    Call VersionCompare
    Pop ${_RESULT}
  !macroend
  Exch $1
  Exch
  Exch $0
  Exch
  Push $2
  Push $3
  Push $4
  Push $5
  Push $6
  Push $7
  begin:
  StrCpy $2 -1
  IntOp $2 $2 + 1
  StrCpy $3 $0 1 $2
  StrCmp $3 '' +2
  StrCmp $3 '.' 0 -3
  StrCpy $4 $0 $2
  IntOp $2 $2 + 1
  StrCpy $0 $0 '' $2
  StrCpy $2 -1
  IntOp $2 $2 + 1
  StrCpy $3 $1 1 $2
  StrCmp $3 '' +2
  StrCmp $3 '.' 0 -3
  StrCpy $5 $1 $2
  IntOp $2 $2 + 1
  StrCpy $1 $1 '' $2
  StrCmp $4$5 '' equal
  StrCpy $6 -1
  IntOp $6 $6 + 1
  StrCpy $3 $4 1 $6
  StrCmp $3 '0' -2
  StrCmp $3 '' 0 +2
  StrCpy $4 0
  StrCpy $7 -1
  IntOp $7 $7 + 1
  StrCpy $3 $5 1 $7
  StrCmp $3 '0' -2
  StrCmp $3 '' 0 +2
  StrCpy $5 0
  StrCmp $4 0 0 +2
  StrCmp $5 0 begin newer2
  StrCmp $5 0 newer1
  IntCmp $6 $7 0 newer1 newer2
  StrCpy $4 '1$4'
  StrCpy $5 '1$5'
  IntCmp $4 $5 begin newer2 newer1
  equal:
  StrCpy $0 0
  goto end
  newer1:
  StrCpy $0 1
  goto end
  newer2:
  StrCpy $0 2
  end:
  Pop $7
  Pop $6
  Pop $5
  Pop $4
  Pop $3
  Pop $2
  Pop $1
  Exch $0
FunctionEnd
Section "Install Java SE Runtime Environment" INSTALLJAVA
  Var /GLOBAL JRE_REG_DIR
  Var /GLOBAL JRE_CUR_VERSION
  Var /GLOBAL JRE_HOME_DIR
  Var /GLOBAL JRE_CHK_VERSION
  ; check 32-bit JRE
  SetRegView 32
  StrCpy $JRE_REG_DIR "SOFTWARE\Wow6432Node\JavaSoft\Java Runtime Environment"
  StrCpy $JRE_CUR_VERSION 0
  ReadRegStr $JRE_CUR_VERSION HKLM "$JRE_REG_DIR" "CurrentVersion"
  StrCmp $JRE_CUR_VERSION "" DetectJRE64
  ReadRegStr $JRE_HOME_DIR HKLM "$JRE_REG_DIR\$JRE_CUR_VERSION" "JavaHome"
  StrCmp $JRE_HOME_DIR "" DetectJRE64
  Goto JREVersionCompare
  ; check 64-bit JRE
  DetectJRE64:
  SetRegView 64
  StrCpy $JRE_REG_DIR "SOFTWARE\JavaSoft\Java Runtime Environment"
  StrCpy $JRE_CUR_VERSION 0
  ReadRegStr $JRE_CUR_VERSION HKLM "$JRE_REG_DIR" "CurrentVersion"
  StrCmp $JRE_CUR_VERSION "" DetectJDK32
  ReadRegStr $JRE_HOME_DIR HKLM "$JRE_REG_DIR\$JRE_CUR_VERSION" "JavaHome"
  StrCmp $JRE_HOME_DIR "" DetectJDK32
  Goto JREVersionCompare
  DetectJDK32:
  SetRegView 32
  ReadRegStr $JRE_CUR_VERSION HKLM "SOFTWARE\Wow6432Node\JavaSoft\Java Development Kit" "CurrentVersion"
  StrCmp $JRE_CUR_VERSION "" DetectJDK64
  ReadRegStr $JRE_HOME_DIR HKLM "SOFTWARE\Wow6432Node\JavaSoft\Java Development Kit\$JRE_CUR_VERSION" "JavaHome"
  StrCmp $JRE_HOME_DIR "" DetectJDK64
  Goto JREVersionCompare
  DetectJDK64:
  SetRegView 64
  ReadRegStr $JRE_CUR_VERSION HKLM "SOFTWARE\JavaSoft\Java Development Kit" "CurrentVersion"
  StrCmp $JRE_CUR_VERSION "" NoJava
  ReadRegStr $JRE_HOME_DIR HKLM "SOFTWARE\JavaSoft\Java Development Kit\$JRE_CUR_VERSION" "JavaHome"
  StrCmp $JRE_HOME_DIR "" NoJava
  Goto JREVersionCompare
  JREVersionCompare:
    StrCpy $JRE_CHK_VERSION 0
    ${VersionCompare} "1.8" "$JRE_CUR_VERSION" $JRE_CHK_VERSION
    ${If} $JRE_CHK_VERSION == "1"
      Goto NoJava
    ${Else}
      RETURN
    ${EndIf}
  NoJava:
    MessageBox MB_OK|MB_ICONINFORMATION "Installer will now install Java SE Runtime Environment"
    File "${TBBSOURCE}\Browser\JonDo\jre.exe"
    ExecWait "$INSTDIR\Browser\JonDo\jre.exe"
    RETURN
SectionEnd

Function CreateShortcuts

  CreateShortCut "$SMPROGRAMS\Start JonDoBrowser.lnk" "$INSTDIR\Browser\firefox.exe" 
  CreateShortCut "$DESKTOP\Start JonDoBrowser.lnk" "$INSTDIR\Browser\firefox.exe"

FunctionEnd
;--------------------------------
;Installer Functions

Function .onInit

  !insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd

;--------------------------------
;Helper Functions

Function CheckIfTargetDirectoryExists
${If} ${FileExists} "$INSTDIR\*.*"
 MessageBox MB_YESNO "The destination directory already exists. You can try to upgrade the JonDoBrowser Bundle, but if you run into any problems, use a new directory instead. Continue?" IDYES NoAbort
   Abort
 NoAbort:
${EndIf}
FunctionEnd


Function StartJonDoBrowser
ExecShell "open" "$INSTDIR/Start JonDoBrowser.lnk"
FunctionEnd

