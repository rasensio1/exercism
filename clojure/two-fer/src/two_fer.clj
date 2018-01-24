(ns two-fer)

(defn two-fer 
  ([] (two-fer "you"))
  ([nom] (str "One for " nom ", one for me.")))
