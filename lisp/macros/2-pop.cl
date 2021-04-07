; #2
; Implement a macro which reads and returns stack's top element
; and removes it from stack

(defmacro _pop (stack) `(prog1
    (car ,stack)
    (setf ,stack (cdr ,stack))
))

(setf _my-stack '(1 2 3 4 5))

(setf _head (_pop _my-stack))

(print _head)
(print _my-stack)
