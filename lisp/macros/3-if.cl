; #3
; Implement the form `if` using macros

(defmacro _if (_cond _then _else) 
    (or 
        (and (eval _cond) _then)
        (and (not (eval _cond)) _else)
    )
)

(print (macroexpand '(_if (> 3 4) (print 1) (print 2))))
