; #1
; Implement a macro which returns its call

(defmacro self (&rest args) (list 'quote (cons 'self args)))

(print "============== TASK 1 ==============")
(print (macroexpand '(self (print 2) (print 1) T)))

; #2
; Implement a macro which reads and returns stack's top element
; and removes it from stack

(defmacro _pop (stack) `(prog1
    (car ,stack)
    (setf ,stack (cdr ,stack))
))

(setf _my-stack '(1 2 3 4 5))

(setf _head (_pop _my-stack))
(print "============== TASK 2 ==============")
(print _head)
(print _my-stack)


; #3
; Implement the form `if` using macros

(defmacro _if (_cond _then _else) 
    (or 
        (and (eval _cond) _then)
        (and (not (eval _cond)) _else)
    )
)

(print "============== TASK 3 ==============")
(print (macroexpand '(_if (> 3 4) (print 1) (print 2))))

; # 4
; Implement a macro (fif test negative zero positive)

(defmacro _fif (_test _negative _zero _positive) (cond
    ((> 0 _test) _negative)
    ((= 0 _test) _zero)
    (t _positive)
))

(print "============== TASK 4 ==============")
(print (macroexpand '(_fif -2 (print "negative") (print "zero") (print "positive") )))
(print (macroexpand '(_fif 0 (print "negative") (print "zero") (print "positive") )))
(print (macroexpand '(_fif 12 (print "negative") (print "zero") (print "positive") )))


; #5
; Implement a (repeat body until cond) macro

(print "============== TASK 5 ==============")
(defmacro repeat (body until cond) 
    (let ((uniq-func-name (gensym)))
        `(labels ((,uniq-func-name ()
            (if ,cond 
                (prog1
                    ,body
                    (,uniq-func-name)
                )
                nil
            )
        )) (,uniq-func-name))
    )
)

(setf counter 5)
(repeat 
    (prog1
        (print counter)
        (setf counter (1- counter))
    ) 
    'until
    (> counter 0)
)