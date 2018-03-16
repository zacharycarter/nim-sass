when defined(Windows):
  const dynlibfunctions = "libsass.dll"

when defined(Linux):
  const dynlibfunctions = "libsass.so"

when defined(MacOSX):
  const dynlibfunctions = "libsass.dylib"

import strutils
{.passC: "-I\"" & gorge("nimble path libsass").strip() & "/libsass/include\"".}
import base
import values
type
  Sass_Env* {.bycopy.} = object
  
  Sass_Callee* {.bycopy.} = object
  
  Sass_Import* {.bycopy.} = object
  
  Sass_Options* {.bycopy.} = object
  
  Sass_Compiler* {.bycopy.} = object
  
  Sass_Importer* {.bycopy.} = object
  
  Sass_Function* {.bycopy.} = object
  
  Sass_Env_Frame* = ptr Sass_Env
  Sass_Callee_Entry* = ptr Sass_Callee
  Sass_Import_Entry* = ptr Sass_Import
  Sass_Import_List* = ptr ptr Sass_Import
  Sass_Importer_Entry* = ptr Sass_Importer
  Sass_Importer_List* = ptr ptr Sass_Importer
  Sass_Importer_Fn* = proc (url: cstring; cb: Sass_Importer_Entry;
                         compiler: ptr Sass_Compiler): ptr Sass_Import_List {.stdcall.}
  Sass_Function_Entry* = ptr Sass_Function
  Sass_Function_List* = ptr ptr Sass_Function
  Sass_Function_Fn* = proc (a2: ptr Sass_Value; cb: Sass_Function_Entry;
                         compiler: ptr Sass_Compiler): ptr ptr Sass_Value {.stdcall.}
  Sass_Callee_Type* {.size: sizeof(cint).} = enum
    SASS_CALLEE_MIXIN, SASS_CALLEE_FUNCTION, SASS_CALLEE_C_FUNCTION


proc sass_make_importer_list*(length: csize): Sass_Importer_List {.stdcall,
    importc: "sass_make_importer_list", dynlib: dynlibfunctions.}
proc sass_importer_get_list_entry*(list: Sass_Importer_List; idx: csize): Sass_Importer_Entry {.
    stdcall, importc: "sass_importer_get_list_entry", dynlib: dynlibfunctions.}
proc sass_importer_set_list_entry*(list: Sass_Importer_List; idx: csize;
                                  entry: Sass_Importer_Entry) {.stdcall,
    importc: "sass_importer_set_list_entry", dynlib: dynlibfunctions.}
proc sass_delete_importer_list*(list: Sass_Importer_List) {.stdcall,
    importc: "sass_delete_importer_list", dynlib: dynlibfunctions.}
proc sass_make_importer*(importer: Sass_Importer_Fn; priority: cdouble;
                        cookie: pointer): Sass_Importer_Entry {.stdcall,
    importc: "sass_make_importer", dynlib: dynlibfunctions.}
proc sass_importer_get_function*(cb: Sass_Importer_Entry): Sass_Importer_Fn {.
    stdcall, importc: "sass_importer_get_function", dynlib: dynlibfunctions.}
proc sass_importer_get_priority*(cb: Sass_Importer_Entry): cdouble {.stdcall,
    importc: "sass_importer_get_priority", dynlib: dynlibfunctions.}
proc sass_importer_get_cookie*(cb: Sass_Importer_Entry): pointer {.stdcall,
    importc: "sass_importer_get_cookie", dynlib: dynlibfunctions.}
proc sass_delete_importer*(cb: Sass_Importer_Entry) {.stdcall,
    importc: "sass_delete_importer", dynlib: dynlibfunctions.}
proc sass_make_import_list*(length: csize): Sass_Import_List {.stdcall,
    importc: "sass_make_import_list", dynlib: dynlibfunctions.}
proc sass_make_import_entry*(path: cstring; source: cstring; srcmap: cstring): Sass_Import_Entry {.
    stdcall, importc: "sass_make_import_entry", dynlib: dynlibfunctions.}
proc sass_make_import*(imp_path: cstring; abs_base: cstring; source: cstring;
                      srcmap: cstring): Sass_Import_Entry {.stdcall,
    importc: "sass_make_import", dynlib: dynlibfunctions.}
proc sass_import_set_error*(`import`: Sass_Import_Entry; message: cstring;
                           line: csize; col: csize): Sass_Import_Entry {.stdcall,
    importc: "sass_import_set_error", dynlib: dynlibfunctions.}
proc sass_import_set_list_entry*(list: Sass_Import_List; idx: csize;
                                entry: Sass_Import_Entry) {.stdcall,
    importc: "sass_import_set_list_entry", dynlib: dynlibfunctions.}
proc sass_import_get_list_entry*(list: Sass_Import_List; idx: csize): Sass_Import_Entry {.
    stdcall, importc: "sass_import_get_list_entry", dynlib: dynlibfunctions.}
proc sass_callee_get_name*(a2: Sass_Callee_Entry): cstring {.stdcall,
    importc: "sass_callee_get_name", dynlib: dynlibfunctions.}
proc sass_callee_get_path*(a2: Sass_Callee_Entry): cstring {.stdcall,
    importc: "sass_callee_get_path", dynlib: dynlibfunctions.}
proc sass_callee_get_line*(a2: Sass_Callee_Entry): csize {.stdcall,
    importc: "sass_callee_get_line", dynlib: dynlibfunctions.}
proc sass_callee_get_column*(a2: Sass_Callee_Entry): csize {.stdcall,
    importc: "sass_callee_get_column", dynlib: dynlibfunctions.}
proc sass_callee_get_type*(a2: Sass_Callee_Entry): Sass_Callee_Type {.stdcall,
    importc: "sass_callee_get_type", dynlib: dynlibfunctions.}
proc sass_callee_get_env*(a2: Sass_Callee_Entry): Sass_Env_Frame {.stdcall,
    importc: "sass_callee_get_env", dynlib: dynlibfunctions.}
proc sass_env_get_lexical*(a2: Sass_Env_Frame; a3: cstring): ptr Sass_Value {.stdcall,
    importc: "sass_env_get_lexical", dynlib: dynlibfunctions.}
proc sass_env_set_lexical*(a2: Sass_Env_Frame; a3: cstring; a4: ptr Sass_Value) {.
    stdcall, importc: "sass_env_set_lexical", dynlib: dynlibfunctions.}
proc sass_env_get_local*(a2: Sass_Env_Frame; a3: cstring): ptr Sass_Value {.stdcall,
    importc: "sass_env_get_local", dynlib: dynlibfunctions.}
proc sass_env_set_local*(a2: Sass_Env_Frame; a3: cstring; a4: ptr Sass_Value) {.stdcall,
    importc: "sass_env_set_local", dynlib: dynlibfunctions.}
proc sass_env_get_global*(a2: Sass_Env_Frame; a3: cstring): ptr Sass_Value {.stdcall,
    importc: "sass_env_get_global", dynlib: dynlibfunctions.}
proc sass_env_set_global*(a2: Sass_Env_Frame; a3: cstring; a4: ptr Sass_Value) {.
    stdcall, importc: "sass_env_set_global", dynlib: dynlibfunctions.}
proc sass_import_get_imp_path*(a2: Sass_Import_Entry): cstring {.stdcall,
    importc: "sass_import_get_imp_path", dynlib: dynlibfunctions.}
proc sass_import_get_abs_path*(a2: Sass_Import_Entry): cstring {.stdcall,
    importc: "sass_import_get_abs_path", dynlib: dynlibfunctions.}
proc sass_import_get_source*(a2: Sass_Import_Entry): cstring {.stdcall,
    importc: "sass_import_get_source", dynlib: dynlibfunctions.}
proc sass_import_get_srcmap*(a2: Sass_Import_Entry): cstring {.stdcall,
    importc: "sass_import_get_srcmap", dynlib: dynlibfunctions.}
proc sass_import_take_source*(a2: Sass_Import_Entry): cstring {.stdcall,
    importc: "sass_import_take_source", dynlib: dynlibfunctions.}
proc sass_import_take_srcmap*(a2: Sass_Import_Entry): cstring {.stdcall,
    importc: "sass_import_take_srcmap", dynlib: dynlibfunctions.}
proc sass_import_get_error_line*(a2: Sass_Import_Entry): csize {.stdcall,
    importc: "sass_import_get_error_line", dynlib: dynlibfunctions.}
proc sass_import_get_error_column*(a2: Sass_Import_Entry): csize {.stdcall,
    importc: "sass_import_get_error_column", dynlib: dynlibfunctions.}
proc sass_import_get_error_message*(a2: Sass_Import_Entry): cstring {.stdcall,
    importc: "sass_import_get_error_message", dynlib: dynlibfunctions.}
proc sass_delete_import_list*(a2: Sass_Import_List) {.stdcall,
    importc: "sass_delete_import_list", dynlib: dynlibfunctions.}
proc sass_delete_import*(a2: Sass_Import_Entry) {.stdcall,
    importc: "sass_delete_import", dynlib: dynlibfunctions.}
proc sass_make_function_list*(length: csize): Sass_Function_List {.stdcall,
    importc: "sass_make_function_list", dynlib: dynlibfunctions.}
proc sass_make_function*(signature: cstring; cb: Sass_Function_Fn; cookie: pointer): Sass_Function_Entry {.
    stdcall, importc: "sass_make_function", dynlib: dynlibfunctions.}
proc sass_delete_function*(entry: Sass_Function_Entry) {.stdcall,
    importc: "sass_delete_function", dynlib: dynlibfunctions.}
proc sass_delete_function_list*(list: Sass_Function_List) {.stdcall,
    importc: "sass_delete_function_list", dynlib: dynlibfunctions.}
proc sass_function_get_list_entry*(list: Sass_Function_List; pos: csize): Sass_Function_Entry {.
    stdcall, importc: "sass_function_get_list_entry", dynlib: dynlibfunctions.}
proc sass_function_set_list_entry*(list: Sass_Function_List; pos: csize;
                                  cb: Sass_Function_Entry) {.stdcall,
    importc: "sass_function_set_list_entry", dynlib: dynlibfunctions.}
proc sass_function_get_signature*(cb: Sass_Function_Entry): cstring {.stdcall,
    importc: "sass_function_get_signature", dynlib: dynlibfunctions.}
proc sass_function_get_function*(cb: Sass_Function_Entry): Sass_Function_Fn {.
    stdcall, importc: "sass_function_get_function", dynlib: dynlibfunctions.}
proc sass_function_get_cookie*(cb: Sass_Function_Entry): pointer {.stdcall,
    importc: "sass_function_get_cookie", dynlib: dynlibfunctions.}