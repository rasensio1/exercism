(ns rna-transcription
  (:require [clojure.string :as st]))

(defn to-rna [lets]
  (if (re-find #"[^GCTA]" lets)
    (throw (AssertionError. "NOPE"))
   (st/replace lets #"G|C|T|A" {"G" "C", "C" "G", "T" "A", "A" "U"})))

