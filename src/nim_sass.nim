when defined(Windows):
  const dynlibsass = "libsass.dll"
  
when defined(Linux):
  const dynlibsass = "libsass.so"
  
when defined(MacOSX):
  const dynlibsass = "libsass.dylib"
  
import strutils
{.passC: "-I\"" & gorge("nimble path libsass").strip() & "/libsass/include\"".}
import nim_sass/base
import nim_sass/version
import nim_sass/values
import nim_sass/functions
import nim_sass/context
import nim_sass/sass2scss

export base, version, values, functions, context, sass2scss