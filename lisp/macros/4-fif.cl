; # 4
; Implement a macro (fif test negative zero positive)

(defmacro _fif (_test _negative _zero _positive) (cond
    ((> 0 _test) _negative)
    ((= 0 _test) _zero)
    (t _positive)
))

(print (macroexpand '(_fif -2 (print "negative") (print "zero") (print "positive") )))
(print (macroexpand '(_fif 0 (print "negative") (print "zero") (print "positive") )))
(print (macroexpand '(_fif 12 (print "negative") (print "zero") (print "positive") )))
