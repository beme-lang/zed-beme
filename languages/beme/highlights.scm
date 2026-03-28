; Keywords
(keyword) @property

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

; Special forms as call heads
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

; Calls — highlight the head as function
(call head: (symbol) @function)
(begin_end_call head: (symbol) @function)

; begin/end delimiters
"begin" @keyword
"end" @keyword

; Symbols (general)
(symbol) @variable

; Reader macros
(deref "@" @operator)
(metadata "^" @operator)
(var_quote "#'" @operator)
(discard "#_" @operator)
(unquote "~" @operator)
(unquote_splicing "~@" @operator)
(syntax_quote "`" @operator)

; Tagged literals
(tagged_literal "#" @operator)
(tagged_literal tag: (tag) @type)

; Delimiters
"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"#{" @punctuation.bracket
"#(" @punctuation.bracket
