when defined(Windows):
  const dynlibcontext = "libsass.dll"

when defined(Linux):
  const dynlibcontext = "libsass.so"

when defined(MacOSX):
  const dynlibcontext = "libsass.dylib"

import strutils
{.passC: "-I\"" & gorge("nimble path libsass").strip() & "/libsass/include\"".}
import base
import values
import functions
type
  Sass_Compiler* {.bycopy.} = object
  
  Sass_Options* {.bycopy.} = object
  
  Sass_Context* {.bycopy.} = object
  
  Sass_File_Context* {.bycopy.} = object
  
  Sass_Data_Context* {.bycopy.} = object
  
  Sass_Compiler_State* {.size: sizeof(cint).} = enum
    SASS_COMPILER_CREATED, SASS_COMPILER_PARSED, SASS_COMPILER_EXECUTED


proc sass_make_options*(): ptr Sass_Options {.stdcall, importc: "sass_make_options",
    dynlib: dynlibcontext.}
proc sass_make_file_context*(input_path: cstring): ptr Sass_File_Context {.stdcall,
    importc: "sass_make_file_context", dynlib: dynlibcontext.}
proc sass_make_data_context*(source_string: cstring): ptr Sass_Data_Context {.
    stdcall, importc: "sass_make_data_context", dynlib: dynlibcontext.}
proc sass_compile_file_context*(ctx: ptr Sass_File_Context): cint {.stdcall,
    importc: "sass_compile_file_context", dynlib: dynlibcontext.}
proc sass_compile_data_context*(ctx: ptr Sass_Data_Context): cint {.stdcall,
    importc: "sass_compile_data_context", dynlib: dynlibcontext.}
proc sass_make_file_compiler*(file_ctx: ptr Sass_File_Context): ptr Sass_Compiler {.
    stdcall, importc: "sass_make_file_compiler", dynlib: dynlibcontext.}
proc sass_make_data_compiler*(data_ctx: ptr Sass_Data_Context): ptr Sass_Compiler {.
    stdcall, importc: "sass_make_data_compiler", dynlib: dynlibcontext.}
proc sass_compiler_parse*(compiler: ptr Sass_Compiler): cint {.stdcall,
    importc: "sass_compiler_parse", dynlib: dynlibcontext.}
proc sass_compiler_execute*(compiler: ptr Sass_Compiler): cint {.stdcall,
    importc: "sass_compiler_execute", dynlib: dynlibcontext.}
proc sass_delete_compiler*(compiler: ptr Sass_Compiler) {.stdcall,
    importc: "sass_delete_compiler", dynlib: dynlibcontext.}
proc sass_delete_options*(options: ptr Sass_Options) {.stdcall,
    importc: "sass_delete_options", dynlib: dynlibcontext.}
proc sass_delete_file_context*(ctx: ptr Sass_File_Context) {.stdcall,
    importc: "sass_delete_file_context", dynlib: dynlibcontext.}
proc sass_delete_data_context*(ctx: ptr Sass_Data_Context) {.stdcall,
    importc: "sass_delete_data_context", dynlib: dynlibcontext.}
proc sass_file_context_get_context*(file_ctx: ptr Sass_File_Context): ptr Sass_Context {.
    stdcall, importc: "sass_file_context_get_context", dynlib: dynlibcontext.}
proc sass_data_context_get_context*(data_ctx: ptr Sass_Data_Context): ptr Sass_Context {.
    stdcall, importc: "sass_data_context_get_context", dynlib: dynlibcontext.}
proc sass_context_get_options*(ctx: ptr Sass_Context): ptr Sass_Options {.stdcall,
    importc: "sass_context_get_options", dynlib: dynlibcontext.}
proc sass_file_context_get_options*(file_ctx: ptr Sass_File_Context): ptr Sass_Options {.
    stdcall, importc: "sass_file_context_get_options", dynlib: dynlibcontext.}
proc sass_data_context_get_options*(data_ctx: ptr Sass_Data_Context): ptr Sass_Options {.
    stdcall, importc: "sass_data_context_get_options", dynlib: dynlibcontext.}
proc sass_file_context_set_options*(file_ctx: ptr Sass_File_Context;
                                   opt: ptr Sass_Options) {.stdcall,
    importc: "sass_file_context_set_options", dynlib: dynlibcontext.}
proc sass_data_context_set_options*(data_ctx: ptr Sass_Data_Context;
                                   opt: ptr Sass_Options) {.stdcall,
    importc: "sass_data_context_set_options", dynlib: dynlibcontext.}
proc sass_option_get_precision*(options: ptr Sass_Options): cint {.stdcall,
    importc: "sass_option_get_precision", dynlib: dynlibcontext.}
proc sass_option_get_output_style*(options: ptr Sass_Options): Sass_Output_Style {.
    stdcall, importc: "sass_option_get_output_style", dynlib: dynlibcontext.}
proc sass_option_get_source_comments*(options: ptr Sass_Options): bool {.stdcall,
    importc: "sass_option_get_source_comments", dynlib: dynlibcontext.}
proc sass_option_get_source_map_embed*(options: ptr Sass_Options): bool {.stdcall,
    importc: "sass_option_get_source_map_embed", dynlib: dynlibcontext.}
proc sass_option_get_source_map_contents*(options: ptr Sass_Options): bool {.
    stdcall, importc: "sass_option_get_source_map_contents", dynlib: dynlibcontext.}
proc sass_option_get_source_map_file_urls*(options: ptr Sass_Options): bool {.
    stdcall, importc: "sass_option_get_source_map_file_urls", dynlib: dynlibcontext.}
proc sass_option_get_omit_source_map_url*(options: ptr Sass_Options): bool {.
    stdcall, importc: "sass_option_get_omit_source_map_url", dynlib: dynlibcontext.}
proc sass_option_get_is_indented_syntax_src*(options: ptr Sass_Options): bool {.
    stdcall, importc: "sass_option_get_is_indented_syntax_src",
    dynlib: dynlibcontext.}
proc sass_option_get_indent*(options: ptr Sass_Options): cstring {.stdcall,
    importc: "sass_option_get_indent", dynlib: dynlibcontext.}
proc sass_option_get_linefeed*(options: ptr Sass_Options): cstring {.stdcall,
    importc: "sass_option_get_linefeed", dynlib: dynlibcontext.}
proc sass_option_get_input_path*(options: ptr Sass_Options): cstring {.stdcall,
    importc: "sass_option_get_input_path", dynlib: dynlibcontext.}
proc sass_option_get_output_path*(options: ptr Sass_Options): cstring {.stdcall,
    importc: "sass_option_get_output_path", dynlib: dynlibcontext.}
proc sass_option_get_source_map_file*(options: ptr Sass_Options): cstring {.stdcall,
    importc: "sass_option_get_source_map_file", dynlib: dynlibcontext.}
proc sass_option_get_source_map_root*(options: ptr Sass_Options): cstring {.stdcall,
    importc: "sass_option_get_source_map_root", dynlib: dynlibcontext.}
proc sass_option_get_c_headers*(options: ptr Sass_Options): Sass_Importer_List {.
    stdcall, importc: "sass_option_get_c_headers", dynlib: dynlibcontext.}
proc sass_option_get_c_importers*(options: ptr Sass_Options): Sass_Importer_List {.
    stdcall, importc: "sass_option_get_c_importers", dynlib: dynlibcontext.}
proc sass_option_get_c_functions*(options: ptr Sass_Options): Sass_Function_List {.
    stdcall, importc: "sass_option_get_c_functions", dynlib: dynlibcontext.}
proc sass_option_set_precision*(options: ptr Sass_Options; precision: cint) {.stdcall,
    importc: "sass_option_set_precision", dynlib: dynlibcontext.}
proc sass_option_set_output_style*(options: ptr Sass_Options;
                                  output_style: Sass_Output_Style) {.stdcall,
    importc: "sass_option_set_output_style", dynlib: dynlibcontext.}
proc sass_option_set_source_comments*(options: ptr Sass_Options;
                                     source_comments: bool) {.stdcall,
    importc: "sass_option_set_source_comments", dynlib: dynlibcontext.}
proc sass_option_set_source_map_embed*(options: ptr Sass_Options;
                                      source_map_embed: bool) {.stdcall,
    importc: "sass_option_set_source_map_embed", dynlib: dynlibcontext.}
proc sass_option_set_source_map_contents*(options: ptr Sass_Options;
    source_map_contents: bool) {.stdcall,
                                importc: "sass_option_set_source_map_contents",
                                dynlib: dynlibcontext.}
proc sass_option_set_source_map_file_urls*(options: ptr Sass_Options;
    source_map_file_urls: bool) {.stdcall, importc: "sass_option_set_source_map_file_urls",
                                 dynlib: dynlibcontext.}
proc sass_option_set_omit_source_map_url*(options: ptr Sass_Options;
    omit_source_map_url: bool) {.stdcall,
                                importc: "sass_option_set_omit_source_map_url",
                                dynlib: dynlibcontext.}
proc sass_option_set_is_indented_syntax_src*(options: ptr Sass_Options;
    is_indented_syntax_src: bool) {.stdcall, importc: "sass_option_set_is_indented_syntax_src",
                                   dynlib: dynlibcontext.}
proc sass_option_set_indent*(options: ptr Sass_Options; indent: cstring) {.stdcall,
    importc: "sass_option_set_indent", dynlib: dynlibcontext.}
proc sass_option_set_linefeed*(options: ptr Sass_Options; linefeed: cstring) {.
    stdcall, importc: "sass_option_set_linefeed", dynlib: dynlibcontext.}
proc sass_option_set_input_path*(options: ptr Sass_Options; input_path: cstring) {.
    stdcall, importc: "sass_option_set_input_path", dynlib: dynlibcontext.}
proc sass_option_set_output_path*(options: ptr Sass_Options; output_path: cstring) {.
    stdcall, importc: "sass_option_set_output_path", dynlib: dynlibcontext.}
proc sass_option_set_plugin_path*(options: ptr Sass_Options; plugin_path: cstring) {.
    stdcall, importc: "sass_option_set_plugin_path", dynlib: dynlibcontext.}
proc sass_option_set_include_path*(options: ptr Sass_Options; include_path: cstring) {.
    stdcall, importc: "sass_option_set_include_path", dynlib: dynlibcontext.}
proc sass_option_set_source_map_file*(options: ptr Sass_Options;
                                     source_map_file: cstring) {.stdcall,
    importc: "sass_option_set_source_map_file", dynlib: dynlibcontext.}
proc sass_option_set_source_map_root*(options: ptr Sass_Options;
                                     source_map_root: cstring) {.stdcall,
    importc: "sass_option_set_source_map_root", dynlib: dynlibcontext.}
proc sass_option_set_c_headers*(options: ptr Sass_Options;
                               c_headers: Sass_Importer_List) {.stdcall,
    importc: "sass_option_set_c_headers", dynlib: dynlibcontext.}
proc sass_option_set_c_importers*(options: ptr Sass_Options;
                                 c_importers: Sass_Importer_List) {.stdcall,
    importc: "sass_option_set_c_importers", dynlib: dynlibcontext.}
proc sass_option_set_c_functions*(options: ptr Sass_Options;
                                 c_functions: Sass_Function_List) {.stdcall,
    importc: "sass_option_set_c_functions", dynlib: dynlibcontext.}
proc sass_context_get_output_string*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_get_output_string", dynlib: dynlibcontext.}
proc sass_context_get_error_status*(ctx: ptr Sass_Context): cint {.stdcall,
    importc: "sass_context_get_error_status", dynlib: dynlibcontext.}
proc sass_context_get_error_json*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_get_error_json", dynlib: dynlibcontext.}
proc sass_context_get_error_text*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_get_error_text", dynlib: dynlibcontext.}
proc sass_context_get_error_message*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_get_error_message", dynlib: dynlibcontext.}
proc sass_context_get_error_file*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_get_error_file", dynlib: dynlibcontext.}
proc sass_context_get_error_src*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_get_error_src", dynlib: dynlibcontext.}
proc sass_context_get_error_line*(ctx: ptr Sass_Context): csize {.stdcall,
    importc: "sass_context_get_error_line", dynlib: dynlibcontext.}
proc sass_context_get_error_column*(ctx: ptr Sass_Context): csize {.stdcall,
    importc: "sass_context_get_error_column", dynlib: dynlibcontext.}
proc sass_context_get_source_map_string*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_get_source_map_string", dynlib: dynlibcontext.}
proc sass_context_get_included_files*(ctx: ptr Sass_Context): cstringArray {.stdcall,
    importc: "sass_context_get_included_files", dynlib: dynlibcontext.}
proc sass_option_get_include_path_size*(options: ptr Sass_Options): csize {.stdcall,
    importc: "sass_option_get_include_path_size", dynlib: dynlibcontext.}
proc sass_option_get_include_path*(options: ptr Sass_Options; i: csize): cstring {.
    stdcall, importc: "sass_option_get_include_path", dynlib: dynlibcontext.}
proc sass_context_get_included_files_size*(ctx: ptr Sass_Context): csize {.stdcall,
    importc: "sass_context_get_included_files_size", dynlib: dynlibcontext.}
proc sass_context_take_error_json*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_take_error_json", dynlib: dynlibcontext.}
proc sass_context_take_error_text*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_take_error_text", dynlib: dynlibcontext.}
proc sass_context_take_error_message*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_take_error_message", dynlib: dynlibcontext.}
proc sass_context_take_error_file*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_take_error_file", dynlib: dynlibcontext.}
proc sass_context_take_output_string*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_take_output_string", dynlib: dynlibcontext.}
proc sass_context_take_source_map_string*(ctx: ptr Sass_Context): cstring {.stdcall,
    importc: "sass_context_take_source_map_string", dynlib: dynlibcontext.}
proc sass_context_take_included_files*(ctx: ptr Sass_Context): cstringArray {.
    stdcall, importc: "sass_context_take_included_files", dynlib: dynlibcontext.}
proc sass_compiler_get_state*(compiler: ptr Sass_Compiler): Sass_Compiler_State {.
    stdcall, importc: "sass_compiler_get_state", dynlib: dynlibcontext.}
proc sass_compiler_get_context*(compiler: ptr Sass_Compiler): ptr Sass_Context {.
    stdcall, importc: "sass_compiler_get_context", dynlib: dynlibcontext.}
proc sass_compiler_get_options*(compiler: ptr Sass_Compiler): ptr Sass_Options {.
    stdcall, importc: "sass_compiler_get_options", dynlib: dynlibcontext.}
proc sass_compiler_get_import_stack_size*(compiler: ptr Sass_Compiler): csize {.
    stdcall, importc: "sass_compiler_get_import_stack_size", dynlib: dynlibcontext.}
proc sass_compiler_get_last_import*(compiler: ptr Sass_Compiler): Sass_Import_Entry {.
    stdcall, importc: "sass_compiler_get_last_import", dynlib: dynlibcontext.}
proc sass_compiler_get_import_entry*(compiler: ptr Sass_Compiler; idx: csize): Sass_Import_Entry {.
    stdcall, importc: "sass_compiler_get_import_entry", dynlib: dynlibcontext.}
proc sass_compiler_get_callee_stack_size*(compiler: ptr Sass_Compiler): csize {.
    stdcall, importc: "sass_compiler_get_callee_stack_size", dynlib: dynlibcontext.}
proc sass_compiler_get_last_callee*(compiler: ptr Sass_Compiler): Sass_Callee_Entry {.
    stdcall, importc: "sass_compiler_get_last_callee", dynlib: dynlibcontext.}
proc sass_compiler_get_callee_entry*(compiler: ptr Sass_Compiler; idx: csize): Sass_Callee_Entry {.
    stdcall, importc: "sass_compiler_get_callee_entry", dynlib: dynlibcontext.}
proc sass_option_push_plugin_path*(options: ptr Sass_Options; path: cstring) {.
    stdcall, importc: "sass_option_push_plugin_path", dynlib: dynlibcontext.}
proc sass_option_push_include_path*(options: ptr Sass_Options; path: cstring) {.
    stdcall, importc: "sass_option_push_include_path", dynlib: dynlibcontext.}
proc sass_find_file*(path: cstring; opt: ptr Sass_Options): cstring {.stdcall,
    importc: "sass_find_file", dynlib: dynlibcontext.}
proc sass_find_include*(path: cstring; opt: ptr Sass_Options): cstring {.stdcall,
    importc: "sass_find_include", dynlib: dynlibcontext.}
proc sass_compiler_find_file*(path: cstring; compiler: ptr Sass_Compiler): cstring {.
    stdcall, importc: "sass_compiler_find_file", dynlib: dynlibcontext.}
proc sass_compiler_find_include*(path: cstring; compiler: ptr Sass_Compiler): cstring {.
    stdcall, importc: "sass_compiler_find_include", dynlib: dynlibcontext.}