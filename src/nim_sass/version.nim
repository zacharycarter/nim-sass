when defined(Windows):
  const dynlibversion = "libsass.dll"

when defined(Linux):
  const dynlibversion = "libsass.so"

when defined(MacOSX):
  const dynlibversion = "libsass.dylib"

import strutils
{.passC: "-I\"" & gorge("nimble path libsass").strip() & "/libsass/include\"".}
