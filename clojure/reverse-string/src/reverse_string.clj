(ns reverse-string)

;; just for fun
(defmacro reverse-string [inp]
  `(str ~@(reverse inp)))

(defn reverse-string2 [inp]
  (apply str (reverse inp)))

