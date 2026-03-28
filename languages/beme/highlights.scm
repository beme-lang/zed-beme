; === Fallbacks ===

(symbol) @variable

; === Literals ===

(string) @string
(regex) @string.regex
(character) @string.escape
(number) @number
(boolean) @boolean
(nil) @constant.builtin
(comment) @comment

; === Clojure keywords — :foo, ::bar ===

(keyword) @constant

; === Delimiters ===

"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"#{" @punctuation.bracket
"#(" @punctuation.bracket
"begin" @punctuation.delimiter
"end" @punctuation.delimiter

; === Reader macro sigils ===

(deref "@" @punctuation.special)
(metadata "^" @punctuation.special)
(quote "'" @punctuation.special)
(var_quote "#'" @punctuation.special)
(discard "#_" @punctuation.special)
(unquote "~" @punctuation.special)
(unquote_splicing "~@" @punctuation.special)
(syntax_quote "`" @punctuation.special)
(tagged_literal "#" @punctuation.special)
(tagged_literal tag: (tag) @property)

; === Call heads ===

(call head: (symbol) @function)
(begin_end_call head: (symbol) @function)
(call head: (keyword) @function)

; === Definition names ===

(call
  head: (symbol) @function
  .
  (symbol) @type
  (#any-of? @function "def" "defn" "defn-" "defmacro" "defonce"
    "defprotocol" "defrecord" "deftype" "defmulti" "defmethod"
    "definterface" "declare" "intern"))

(begin_end_call
  head: (symbol) @function
  .
  (symbol) @type
  (#any-of? @function "def" "defn" "defn-" "defmacro" "defonce"
    "defprotocol" "defrecord" "deftype" "defmulti" "defmethod"
    "definterface" "declare" "intern"))
