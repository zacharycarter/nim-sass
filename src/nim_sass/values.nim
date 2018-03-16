when defined(Windows):
  const dynlibvalues = "libsass.dll"

when defined(Linux):
  const dynlibvalues = "libsass.so"

when defined(MacOSX):
  const dynlibvalues = "libsass.dylib"

import strutils
{.passC: "-I\"" & gorge("nimble path libsass").strip() & "/libsass/include\"".}
import base
type
  Sass_Value* {.bycopy.} = object {.union.}
  
  Sass_Tag* {.size: sizeof(cint).} = enum
    SASS_BOOLEAN, SASS_NUMBER, SASS_COLOR, SASS_STRING, SASS_LIST, SASS_MAP,
    SASS_NULL, SASS_ERROR, SASS_WARNING


type
  Sass_Separator* {.size: sizeof(cint).} = enum
    SASS_COMMA, SASS_SPACE, SASS_HASH


type
  Sass_OP* {.size: sizeof(cint).} = enum
    AND, OR, EQ, NEQ, GT, GTE, LT, LTE, ADD, SUB, MUL, DIV, MOD, NUM_OPS


proc sass_make_null*(): ptr Sass_Value {.stdcall, importc: "sass_make_null",
                                     dynlib: dynlibvalues.}
proc sass_make_boolean*(val: bool): ptr Sass_Value {.stdcall,
    importc: "sass_make_boolean", dynlib: dynlibvalues.}
proc sass_make_string*(val: cstring): ptr Sass_Value {.stdcall,
    importc: "sass_make_string", dynlib: dynlibvalues.}
proc sass_make_qstring*(val: cstring): ptr Sass_Value {.stdcall,
    importc: "sass_make_qstring", dynlib: dynlibvalues.}
proc sass_make_number*(val: cdouble; unit: cstring): ptr Sass_Value {.stdcall,
    importc: "sass_make_number", dynlib: dynlibvalues.}
proc sass_make_color*(r: cdouble; g: cdouble; b: cdouble; a: cdouble): ptr Sass_Value {.
    stdcall, importc: "sass_make_color", dynlib: dynlibvalues.}
proc sass_make_list*(len: csize; sep: Sass_Separator; is_bracketed: bool): ptr Sass_Value {.
    stdcall, importc: "sass_make_list", dynlib: dynlibvalues.}
proc sass_make_map*(len: csize): ptr Sass_Value {.stdcall, importc: "sass_make_map",
    dynlib: dynlibvalues.}
proc sass_make_error*(msg: cstring): ptr Sass_Value {.stdcall,
    importc: "sass_make_error", dynlib: dynlibvalues.}
proc sass_make_warning*(msg: cstring): ptr Sass_Value {.stdcall,
    importc: "sass_make_warning", dynlib: dynlibvalues.}
proc sass_delete_value*(val: ptr Sass_Value) {.stdcall, importc: "sass_delete_value",
    dynlib: dynlibvalues.}
proc sass_clone_value*(val: ptr Sass_Value): ptr Sass_Value {.stdcall,
    importc: "sass_clone_value", dynlib: dynlibvalues.}
proc sass_value_op*(op: Sass_OP; a: ptr Sass_Value; b: ptr Sass_Value): ptr Sass_Value {.
    stdcall, importc: "sass_value_op", dynlib: dynlibvalues.}
proc sass_value_stringify*(a: ptr Sass_Value; compressed: bool; precision: cint): ptr Sass_Value {.
    stdcall, importc: "sass_value_stringify", dynlib: dynlibvalues.}
proc sass_value_get_tag*(v: ptr Sass_Value): Sass_Tag {.stdcall,
    importc: "sass_value_get_tag", dynlib: dynlibvalues.}
proc sass_value_is_null*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_value_is_null", dynlib: dynlibvalues.}
proc sass_value_is_number*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_value_is_number", dynlib: dynlibvalues.}
proc sass_value_is_string*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_value_is_string", dynlib: dynlibvalues.}
proc sass_value_is_boolean*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_value_is_boolean", dynlib: dynlibvalues.}
proc sass_value_is_color*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_value_is_color", dynlib: dynlibvalues.}
proc sass_value_is_list*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_value_is_list", dynlib: dynlibvalues.}
proc sass_value_is_map*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_value_is_map", dynlib: dynlibvalues.}
proc sass_value_is_error*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_value_is_error", dynlib: dynlibvalues.}
proc sass_value_is_warning*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_value_is_warning", dynlib: dynlibvalues.}
proc sass_number_get_value*(v: ptr Sass_Value): cdouble {.stdcall,
    importc: "sass_number_get_value", dynlib: dynlibvalues.}
proc sass_number_set_value*(v: ptr Sass_Value; value: cdouble) {.stdcall,
    importc: "sass_number_set_value", dynlib: dynlibvalues.}
proc sass_number_get_unit*(v: ptr Sass_Value): cstring {.stdcall,
    importc: "sass_number_get_unit", dynlib: dynlibvalues.}
proc sass_number_set_unit*(v: ptr Sass_Value; unit: cstring) {.stdcall,
    importc: "sass_number_set_unit", dynlib: dynlibvalues.}
proc sass_string_get_value*(v: ptr Sass_Value): cstring {.stdcall,
    importc: "sass_string_get_value", dynlib: dynlibvalues.}
proc sass_string_set_value*(v: ptr Sass_Value; value: cstring) {.stdcall,
    importc: "sass_string_set_value", dynlib: dynlibvalues.}
proc sass_string_is_quoted*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_string_is_quoted", dynlib: dynlibvalues.}
proc sass_string_set_quoted*(v: ptr Sass_Value; quoted: bool) {.stdcall,
    importc: "sass_string_set_quoted", dynlib: dynlibvalues.}
proc sass_boolean_get_value*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_boolean_get_value", dynlib: dynlibvalues.}
proc sass_boolean_set_value*(v: ptr Sass_Value; value: bool) {.stdcall,
    importc: "sass_boolean_set_value", dynlib: dynlibvalues.}
proc sass_color_get_r*(v: ptr Sass_Value): cdouble {.stdcall,
    importc: "sass_color_get_r", dynlib: dynlibvalues.}
proc sass_color_set_r*(v: ptr Sass_Value; r: cdouble) {.stdcall,
    importc: "sass_color_set_r", dynlib: dynlibvalues.}
proc sass_color_get_g*(v: ptr Sass_Value): cdouble {.stdcall,
    importc: "sass_color_get_g", dynlib: dynlibvalues.}
proc sass_color_set_g*(v: ptr Sass_Value; g: cdouble) {.stdcall,
    importc: "sass_color_set_g", dynlib: dynlibvalues.}
proc sass_color_get_b*(v: ptr Sass_Value): cdouble {.stdcall,
    importc: "sass_color_get_b", dynlib: dynlibvalues.}
proc sass_color_set_b*(v: ptr Sass_Value; b: cdouble) {.stdcall,
    importc: "sass_color_set_b", dynlib: dynlibvalues.}
proc sass_color_get_a*(v: ptr Sass_Value): cdouble {.stdcall,
    importc: "sass_color_get_a", dynlib: dynlibvalues.}
proc sass_color_set_a*(v: ptr Sass_Value; a: cdouble) {.stdcall,
    importc: "sass_color_set_a", dynlib: dynlibvalues.}
proc sass_list_get_length*(v: ptr Sass_Value): csize {.stdcall,
    importc: "sass_list_get_length", dynlib: dynlibvalues.}
proc sass_list_get_separator*(v: ptr Sass_Value): Sass_Separator {.stdcall,
    importc: "sass_list_get_separator", dynlib: dynlibvalues.}
proc sass_list_set_separator*(v: ptr Sass_Value; value: Sass_Separator) {.stdcall,
    importc: "sass_list_set_separator", dynlib: dynlibvalues.}
proc sass_list_get_is_bracketed*(v: ptr Sass_Value): bool {.stdcall,
    importc: "sass_list_get_is_bracketed", dynlib: dynlibvalues.}
proc sass_list_set_is_bracketed*(v: ptr Sass_Value; value: bool) {.stdcall,
    importc: "sass_list_set_is_bracketed", dynlib: dynlibvalues.}
proc sass_list_get_value*(v: ptr Sass_Value; i: csize): ptr Sass_Value {.stdcall,
    importc: "sass_list_get_value", dynlib: dynlibvalues.}
proc sass_list_set_value*(v: ptr Sass_Value; i: csize; value: ptr Sass_Value) {.stdcall,
    importc: "sass_list_set_value", dynlib: dynlibvalues.}
proc sass_map_get_length*(v: ptr Sass_Value): csize {.stdcall,
    importc: "sass_map_get_length", dynlib: dynlibvalues.}
proc sass_map_get_key*(v: ptr Sass_Value; i: csize): ptr Sass_Value {.stdcall,
    importc: "sass_map_get_key", dynlib: dynlibvalues.}
proc sass_map_set_key*(v: ptr Sass_Value; i: csize; a4: ptr Sass_Value) {.stdcall,
    importc: "sass_map_set_key", dynlib: dynlibvalues.}
proc sass_map_get_value*(v: ptr Sass_Value; i: csize): ptr Sass_Value {.stdcall,
    importc: "sass_map_get_value", dynlib: dynlibvalues.}
proc sass_map_set_value*(v: ptr Sass_Value; i: csize; a4: ptr Sass_Value) {.stdcall,
    importc: "sass_map_set_value", dynlib: dynlibvalues.}
proc sass_error_get_message*(v: ptr Sass_Value): cstring {.stdcall,
    importc: "sass_error_get_message", dynlib: dynlibvalues.}
proc sass_error_set_message*(v: ptr Sass_Value; msg: cstring) {.stdcall,
    importc: "sass_error_set_message", dynlib: dynlibvalues.}
proc sass_warning_get_message*(v: ptr Sass_Value): cstring {.stdcall,
    importc: "sass_warning_get_message", dynlib: dynlibvalues.}
proc sass_warning_set_message*(v: ptr Sass_Value; msg: cstring) {.stdcall,
    importc: "sass_warning_set_message", dynlib: dynlibvalues.}