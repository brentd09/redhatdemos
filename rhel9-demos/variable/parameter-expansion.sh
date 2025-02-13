# Types of Parameter Expansion
# ============================
#   Basic Expansion
#     ${var}:              Expands to the value of var.
#   Default Value Expansion
#     ${var:-default}:     If var is unset or null, expand to default; otherwise, expand to the value of var.
#     ${var:=default}:     If var is unset or null, set it to default and then expand to default.
#     ${var:--default}:    If var is unset, expand to -default; otherwise, expand to the value of var.
#   Alternative Value Expansion
#     ${var:+alternative}: If var is set and non-null, expand to alternative; otherwise, expand to nothing.
#     ${var:?error}:       If var is unset or null, print error and exit the script; otherwise, expand to the value of var.
#   Substring Expansion
#     ${var:start:length}: Expands to a substring of var, starting from start and extending for length.
#   Length Expansion
#     ${#var}:             Expands to the length of var.
#   # !!! Patterns in the pattern examples are wildard patterns and (NOT regex patterns)
#   Pattern Removal 
#     ${var#pattern}:      Removes the shortest matching prefix pattern from var.
#     ${var##pattern}:     Removes the longest matching prefix pattern from var.
#     ${var%pattern}:      Removes the shortest matching suffix pattern from var.
#     ${var%%pattern}:     Removes the longest matching suffix pattern from var.
#   String Replacement
#     ${var/pattern/replacement}:  Replaces the first occurrence of pattern in var with replacement.
#     ${var//pattern/replacement}: Replaces all occurrences of pattern in var with replacement.
#     ${var/#pattern/replacement}: Replaces pattern at the start of var with replacement.
#     ${var/%pattern/replacement}: Replaces pattern at the end of var with replacement.
#   Indirection
#     ${!var}:             Expands to the value of the variable whose name is the value of var.


# Examples

var="Hello, World!"
original_value=${var}

unset myvar
default_value_if_null=${myvar:-"default value"} 

myvar="Hello!"
default_value_if_not_null=${myvar:+"Variable is set!"}

text="Hello, World!"
substring_text=${text:7:5}

text="Hello, World!"
length_text=${#text}

filename="my_document.txt"
remove_my_remove_prefix=${filename#my_}
ext_only_remove_prefix=${filename##*.}
filename_only_remove_suffix=${filename%.txt}
before_first_dot_remove_suffix=${filename%%.*}

sentence="I love apples, yes I lots of apples"
replace_first_apples=${sentence/apples/oranges}
replace_all_apples=${sentence//apples/oranges}

filename="apple_pie is apples in a pie"
replace_at_start=${filename/#apple/fruit}
replace_at_end=${filename/%pie/cake}

var_name="greeting"
greeting="Hello, World!"
inception=${!var_name}

full_path="/home/user/documents/report.txt"
base_dir="${full_path%/*}"
filename="${full_path##*/}"
# Output results
echo "Full Path: $full_path"
echo "Base Directory: $base_dir"
echo "Filename: $filename"
