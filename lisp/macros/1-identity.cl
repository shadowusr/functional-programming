; #1
; Implement a macro which returns its call

(defmacro self (&rest args) (list 'quote (cons 'self args)))

(print (macroexpand '(self (print 2) (print 1) T)))