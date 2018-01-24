(ns bob
  (:require [clojure.string :as st]))

(defn response-for [statement]
  (letfn [(shout? [s] (and (re-find #"[A-Z]+" s) (= s (st/upper-case s))))
          (question? [s] (st/ends-with? s "?"))
          (silence? [s] (st/blank? s))]
    (cond
      (silence? statement) "Fine. Be that way!"
      (shout? statement) "Whoa, chill out!"
      (question? statement) "Sure."
      :else "Whatever.")))

