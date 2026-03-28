; === Fallbacks (least specific — at top, overridden by everything below) ===

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

; === Data structure delimiters ===

"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"#{" @punctuation.bracket
"#(" @punctuation.bracket

; === Reader macro sigils ===

(deref "@" @operator)
(metadata "^" @operator)
(quote "'" @operator)
(var_quote "#'" @operator)
(discard "#_" @operator)
(unquote "~" @operator)
(unquote_splicing "~@" @operator)
(syntax_quote "`" @operator)
(tagged_literal "#" @operator)
(tagged_literal tag: (tag) @type)

; === begin/end — structural delimiters, visually distinct from both brackets and keywords ===

"begin" @type
"end" @type

; === Call heads — functions ===

(call head: (symbol) @function)
(begin_end_call head: (symbol) @function)
(call head: (keyword) @function)

; === Definition names — the thing being defined ===

(call
  head: (symbol) @keyword
  .
  (symbol) @variable.special
  (#any-of? @keyword "def" "defn" "defn-" "defmacro" "defonce"
    "defprotocol" "defrecord" "deftype" "defmulti" "defmethod"
    "definterface" "declare" "intern"))

(begin_end_call
  head: (symbol) @keyword
  .
  (symbol) @variable.special
  (#any-of? @keyword "def" "defn" "defn-" "defmacro" "defonce"
    "defprotocol" "defrecord" "deftype" "defmulti" "defmethod"
    "definterface" "declare" "intern"))

; === Special forms — must be last to override @function on call heads ===

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
