when defined(Windows):
  const dynlibbase = "libsass.dll"

when defined(Linux):
  const dynlibbase = "libsass.so"

when defined(MacOSX):
  const dynlibbase = "libsass.dylib"

import strutils
{.passC: "-I\"" & gorge("nimble path libsass").strip() & "/libsass/include\"".}
type
  Sass_Output_Style* {.size: sizeof(cint).} = enum
    SASS_STYLE_NESTED, SASS_STYLE_EXPANDED, SASS_STYLE_COMPACT,
    SASS_STYLE_COMPRESSED, SASS_STYLE_INSPECT, SASS_STYLE_TO_SASS


proc sass_alloc_memory*(size: csize): pointer {.stdcall,
    importc: "sass_alloc_memory", dynlib: dynlibbase.}
proc sass_copy_c_string*(str: cstring): cstring {.stdcall,
    importc: "sass_copy_c_string", dynlib: dynlibbase.}
proc sass_free_memory*(`ptr`: pointer) {.stdcall, importc: "sass_free_memory",
                                      dynlib: dynlibbase.}
proc sass_string_quote*(str: cstring; quote_mark: char): cstring {.stdcall,
    importc: "sass_string_quote", dynlib: dynlibbase.}
proc sass_string_unquote*(str: cstring): cstring {.stdcall,
    importc: "sass_string_unquote", dynlib: dynlibbase.}
proc libsass_version*(): cstring {.stdcall, importc: "libsass_version",
                                dynlib: dynlibbase.}
proc libsass_language_version*(): cstring {.stdcall,
    importc: "libsass_language_version", dynlib: dynlibbase.}