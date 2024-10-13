# Configuration file specification

## Example
```yaml
function:
  include_name:
    - !ruby/regexp /^rb_/i
    - !ruby/regexp /^rstring_/i

  exclude_name:
    # deprecated functions
    - !ruby/regexp /^rb_check_safe_str$/i
    - !ruby/regexp /^rb_clear_constant_cache$/i
    - !ruby/regexp /^rb_clone_setup$/i

  pointer_hint:
    RSTRING_PTR:
      self: raw
    rb_data_object_make:
      4: sref

struct:
  include_name:
    - !ruby/regexp /^rb_/i
    - re_registers

  exclude_name:
    - rb_data_type_struct

type:
  include_name:
    - !ruby/regexp /^rb_/i
    - !ruby/regexp /^st_/i
    - ID
    - VALUE

  exclude_name: []

enum:
  include_name:
    - ruby_value_type
    - rb_io_wait_readwrite

  exclude_name: []
```

## Full configuration file
[config/default.yml](config/default.yml) is used by https://github.com/sue445/go-gem-wrapper to generate bindings for Go.

## `function.include_name`, `struct.include_name`, `type.include_name`, `enum.include_name`
Return functions and structures that match the condition with a [RubyHeaderParser::Parser](lib/ruby_header_parser/parser.rb)

e.g.

```yaml
struct:
  include_name:
    - !ruby/regexp /^rb_/i
    - re_registers
```

Elements in the array accept the following

* `String`: Exact match
* `Regexp`(`!ruby/regexp`): Regular expression match

## `function.exclude_name`, `struct.exclude_name`, `type.exclude_name`, `enum.exclude_name`
Doesn't return functions and structures that match the condition with a [RubyHeaderParser::Parser](lib/ruby_header_parser/parser.rb)

e.g.

```yaml
function:
  exclude_name:
    - !ruby/regexp /^rb_check_safe_str$/i
    - rb_scan_args_bad_format
```

`exclude_name` is preferred over `include_name`

Other specifications are the same as `include_name`

## `function.pointer_hint`
Provide a hint if the function argument type is a pointer

e.g.

```yaml
function:
  pointer_hint:
    RSTRING_PTR: # function name (Exact match)
      self: raw
    rb_data_object_make:
      4: sref
```

### Function arguments (`1`, `2`, `3`, ...)
* `ref` (default)
    * normal pointer
    * e.g. 1st argument of `VALUE rb_const_list(void*)`
* `in_ref`
    * input only pointer
    * e.g. 2nd argument of `void rb_define_variable(const char *name, VALUE *var)`
* `sref`
    * special one for multiple pointer
    * e.g. 3rd argument of `rb_data_typed_object_make(VALUE klass, const rb_data_type_t *type, void **datap, size_t size)`
* `array`
    * array
    * e.g. 4th argument of `VALUE rb_funcallv(VALUE recv, ID mid, int argc, const VALUE *argv)`
* `ref_array`
    * array of pointer
    * e.g. 10th argument of `rb_scan_args_set(int kw_flag, int argc, const VALUE *argv, int n_lead, int n_opt, int n_trail, bool f_var, bool f_hash, bool f_block, VALUE *vars[], RB_UNUSED_VAR(const char *fmt), RB_UNUSED_VAR(int varc))`
* `str_array`
    * array of string
    * e.g. 2nd argument of `int rb_find_file_ext(VALUE *feature, const char *const *exts)`
* `function`
    * function pointer
    * e.g. 4th argument of `void rb_define_method(VALUE klass, const char *mid, VALUE (*func)(), int arity)`

### Function return value (`self`)
* `ref` (default)
    * normal pointer
    * e.g. Return value of `int *rb_errno_ptr(void)`
* `raw`
    * In many cases `char*` can be interpreted as a string. But if `raw` is specified, it suppresses interpretation as a string
    * e.g. Return value of `char* RSTRING_PTR(VALUE str)`
