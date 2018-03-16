when defined(Windows):
  const dynlibsass2scss = "libsass.dll"

when defined(Linux):
  const dynlibsass2scss = "libsass.so"

when defined(MacOSX):
  const dynlibsass2scss = "libsass.dylib"

import strutils
{.passC: "-I\"" & gorge("nimble path libsass").strip() & "/libsass/include\"".}
const
  SASS2SCSS_PRETTIFY_0* = 0
  SASS2SCSS_PRETTIFY_1* = 1
  SASS2SCSS_PRETTIFY_2* = 2
  SASS2SCSS_PRETTIFY_3* = 3
  SASS2SCSS_KEEP_COMMENT* = 32
  SASS2SCSS_STRIP_COMMENT* = 64
  SASS2SCSS_CONVERT_COMMENT* = 128

proc sass2scss*(sass: cstring; options: cint): cstring {.stdcall, importc: "sass2scss",
    dynlib: dynlibsass2scss.}
proc sass2scss_version*(): cstring {.stdcall, importc: "sass2scss_version",
                                  dynlib: dynlibsass2scss.}