(ns armstrong-numbers
  (:require [clojure.string :as st]))

(defn armstrong? [n]
  (let [digs (map read-string (st/split (str n) #""))
        exp (count digs)
        res (reduce + (map #(Math/pow % exp) digs))]
    (= res (float n))))

