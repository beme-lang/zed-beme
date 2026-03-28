; Delimiters
"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"#{" @punctuation.bracket
"#(" @punctuation.bracket

; Symbols (general fallback — must come before more specific symbol captures)
(symbol) @variable

; Strings
(string) @string
(regex) @string.regex
(character) @string.special

; Numbers
(number) @number

; Booleans and nil
(boolean) @boolean
(nil) @constant.builtin

; Comments
(comment) @comment

; Clojure keywords (:foo, ::bar)
(keyword) @constant

; Reader macro operators
(deref "@" @punctuation.special)
(metadata "^" @punctuation.special)
(quote "'" @punctuation.special)
(var_quote "#'" @punctuation.special)
(discard "#_" @punctuation.special)
(unquote "~" @punctuation.special)
(unquote_splicing "~@" @punctuation.special)
(syntax_quote "`" @punctuation.special)
(tagged_literal "#" @punctuation.special)
(tagged_literal tag: (tag) @type)

; begin/end delimiters — distinct from brackets
"begin" @keyword
"end" @keyword

; Call heads — functions (less specific, comes before special forms)
(call head: (symbol) @function)
(begin_end_call head: (symbol) @function)

; Call heads — keyword as function (:key map)
(call head: (keyword) @function)

; Definition forms — the name being defined
(call
  head: (symbol) @keyword
  .
  (symbol) @function.definition
  (#any-of? @keyword "def" "defn" "defn-" "defmacro" "defonce"
    "defprotocol" "defrecord" "deftype" "defmulti" "defmethod"
    "definterface" "declare" "intern"))

(begin_end_call
  head: (symbol) @keyword
  .
  (symbol) @function.definition
  (#any-of? @keyword "def" "defn" "defn-" "defmacro" "defonce"
    "defprotocol" "defrecord" "deftype" "defmulti" "defmethod"
    "definterface" "declare" "intern"))

; Special forms as call heads (most specific — must come last to override @function)
(call head: (symbol) @keyword
  (#any-of? @keyword
    "def" "defn" "defn-" "defmacro" "defonce" "defprotocol" "defrecord"
    "deftype" "defmulti" "defmethod" "definterface"
    "fn" "fn*" "let" "loop" "recur" "do"
    "if" "if-let" "if-some" "if-not"
    "when" "when-let" "when-some" "when-not" "when-first"
    "cond" "condp" "cond->" "cond->>"
    "case" "try" "catch" "finally" "throw"
    "for" "doseq" "dotimes" "while"
    "ns" "require" "import" "use" "refer"
    "quote" "var" "set!" "new"
    "reify" "proxy" "extend-type" "extend-protocol"
    "->" "->>" "as->" "some->" "some->>"
    "binding" "with-open" "with-local-vars"
    "declare" "intern"))

(begin_end_call head: (symbol) @keyword
  (#any-of? @keyword
    "def" "defn" "defn-" "defmacro" "defonce" "defprotocol" "defrecord"
    "deftype" "defmulti" "defmethod" "definterface"
    "fn" "fn*" "let" "loop" "recur" "do"
    "if" "if-let" "if-some" "if-not"
    "when" "when-let" "when-some" "when-not" "when-first"
    "cond" "condp" "cond->" "cond->>"
    "case" "try" "catch" "finally" "throw"
    "for" "doseq" "dotimes" "while"
    "ns" "require" "import" "use" "refer"
    "quote" "var" "set!" "new"
    "reify" "proxy" "extend-type" "extend-protocol"
    "->" "->>" "as->" "some->" "some->>"
    "binding" "with-open" "with-local-vars"
    "declare" "intern"))
