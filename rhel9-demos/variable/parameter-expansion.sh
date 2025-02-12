#  Types of Parameter Expansion
#  Basic Expansion
#  ${var}: Expands to the value of var.
#  Default Value Expansion
#  ${var:-default}: If var is unset or null, expand to default; otherwise, expand to the value of var.
#  ${var:=default}: If var is unset or null, set it to default and then expand to default.
#  ${var:--default}: If var is unset, expand to -default; otherwise, expand to the value of var.
#  Alternative Value Expansion
#  ${var:+alternative}: If var is set and non-null, expand to alternative; otherwise, expand to nothing.
#  ${var:?error}: If var is unset or null, print error and exit the script; otherwise, expand to the value of var.
#  Substring Expansion
#  ${var:start:length}: Expands to a substring of var, starting from start and extending for length.
#  Length Expansion
#  ${#var}: Expands to the length of var.
#  Pattern Removal
#  ${var#pattern}: Removes the shortest matching prefix pattern from var.
#  ${var##pattern}: Removes the longest matching prefix pattern from var.
#  ${var%pattern}: Removes the shortest matching suffix pattern from var.
#  ${var%%pattern}: Removes the longest matching suffix pattern from var.
#  String Replacement
#  ${var/pattern/replacement}: Replaces the first occurrence of pattern in var with replacement.
#  ${var//pattern/replacement}: Replaces all occurrences of pattern in var with replacement.
#  ${var/#pattern/replacement}: Replaces pattern at the start of var with replacement.
#  ${var/%pattern/replacement}: Replaces pattern at the end of var with replacement.
#  Indirection
#  ${!var}: Expands to the value of the variable whose name is the value of var.
#  Examples
#  1. Basic Expansion
#  
var="Hello, World!"
echo "${var}"  # Output: Hello, World!

#  2. Default Value Expansion

unset myvar
echo "${myvar:-"default value"}"  # Output: default value

myvar="Hello!"
echo "${myvar:-"default value"}"  # Output: Hello!

#  3. Alternative Value Expansion

myvar="Hello!"
echo "${myvar:+ "Variable is set!"}"  # Output: Variable is set!

unset myvar
echo "${myvar:+ "Variable is set!"}"  # Output: (no output)

#  4. Substring Expansion

text="Hello, World!"
echo "${text:7:5}"  # Output: World

#  5. Length Expansion

text="Hello, World!"
echo "${#text}"  # Output: 13 (length of the string)

#  6. Pattern Removal

filename="my_document.txt"
echo "${filename#my_}"     # Output: document.txt
echo "${filename##*.}"      # Output: txt (removes up to the last dot)
echo "${filename%.txt}"     # Output: my_document (removes the .txt)
echo "${filename%%.*}"      # Output: my_document (removes everything after the first dot)


#  7. String Replacement

sentence="I love apples"
echo "${sentence/apples/oranges}"  # Output: I love oranges (replaces first occurrence)
echo "${sentence//apples/oranges}"  # Output: I love oranges (replaces all occurrences)

filename="apple_pie"
echo "${filename/#apple/fruit}"  # Output: fruit_pie (replaces 'apple' at the start)
echo "${filename/%_pie/cake}"     # Output: apple_cake (replaces '_pie' at the end)


#  8. Indirection

var_name="greeting"
greeting="Hello, World!"
echo "${!var_name}"  # Output: Hello, World! (expands to the value of the variable named 'greeting')


#  File Path manipulation

full_path="/home/user/documents/report.txt"

# Extract base directory
base_dir="${full_path%/*}"

# Extract filename
filename="${full_path##*/}"

# Output results
echo "Full Path: $full_path"
echo "Base Directory: $base_dir"
echo "Filename: $filename"

