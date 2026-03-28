; Function definitions
(call
  head: (symbol) @context
  .
  (symbol) @name
  (#any-of? @context "defn" "defn-" "defmacro" "defmulti" "defmethod")) @item

(begin_end_call
  head: (symbol) @context
  .
  (symbol) @name
  (#any-of? @context "defn" "defn-" "defmacro" "defmulti" "defmethod")) @item

; Variable definitions
(call
  head: (symbol) @context
  .
  (symbol) @name
  (#any-of? @context "def" "defonce")) @item

; Type definitions
(call
  head: (symbol) @context
  .
  (symbol) @name
  (#any-of? @context "defprotocol" "defrecord" "deftype" "definterface")) @item
