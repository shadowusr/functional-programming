; # 1
; Implement funcall using apply.

(defun negative (x) (- x))

(defun myfuncall (fn &rest args) (apply fn args))
(print "============== TASK 1 ==============")
(print (myfuncall #'negative 1))
; => -1

; #3
; Implement a function apl-apply which applies every function fi from list f to every elemnt xi from list x. It should return a list of results.

(defun negative (x) (- x))
(defun twice (x) (* 2 x))
(defun thrice (x) (* 3 x))

(defun apl-apply (f x) (if (not (null f)) (cons (funcall (car f) (car x)) (apl-apply (cdr f) (cdr x)))))

(print "============== TASK 3 ==============")
(print (apl-apply (list #'negative #'twice #'thrice) '(1 1 1)))
; => (-1 2 3)

; # 5
; Implement a predicate `some` which returns `T` if for some element in `list`, `pred` returns `T` and `NIL` otherwise.

(defun _some (pred list) (not (null (mapcan (lambda (item) (
    if (funcall pred item) (list t) nil
    )) list))))

(defun _even (x) (= 0 (mod x 2)))
(defun _odd (x) (= 1 (mod x 2)))

(print "============== TASK 5 ==============")
(print (_some #'_even '(2 1 1 1 4 3)))
(print (_some #'_even '(1 1 1 1 1 3)))
(print (_some #'_odd nil))

; #7
; Define predicate `filter` which filters out all elements from `list` for
; which `pred` is falsy.

(defun _filter (pred list) (mapcan (lambda (item) (
    if (funcall pred item) (list item) nil
    )) list))

(defun _even (x) (= 0 (mod x 2)))
(defun _odd (x) (= 1 (mod x 2)))

(print "============== TASK 7 ==============")
(print (_filter #'_even '(1 1 1 1 4 3)))
(print (_filter #'_odd '(1 1 1 1 4 3)))
(print (_filter #'_odd nil))    (and nil 1)   (or nil 0)   (or (and nil 1) (or nil 0))

; # 9
; Implement a generator of the Fibonacci sequence

(defun create-fib-gen () (let ((prev 0) (curr 1) (tmp nil))
    (lambda () 
        (setq tmp curr)
        (setq curr (+ prev curr))
        (setq prev tmp)
    )
))

(print "============== TASK 9 ==============")
(setq gen-1 (create-fib-gen))

(format T "gen-1: ~d~&" (funcall gen-1))
(format T "gen-1: ~d~&" (funcall gen-1))
(format T "gen-1: ~d~&" (funcall gen-1))

(setq gen-2 (create-fib-gen))

(format T "gen-1: ~d~&" (funcall gen-1))
(format T "gen-1: ~d~&" (funcall gen-1))
(format T "gen-2: ~d~&" (funcall gen-2))
(format T "gen-1: ~d~&" (funcall gen-1))
(format T "gen-2: ~d~&" (funcall gen-2))
(format T "gen-2: ~d~&" (funcall gen-2))
(format T "gen-1: ~d~&" (funcall gen-1))

; # 11
; Define a function which works as follows: `(func '(f g ... h) x) => (list (f x) (g x) ... (h x))`.

(defun hyper-fun (flist x) 
    (mapcar (lambda (f) (funcall f x)) flist)
)

(defun negative (x) (- x))
(defun twice (x) (* 2 x))
(defun thrice (x) (* 3 x))

(print "============== TASK 11 ==============")
(print (hyper-fun (list #'negative #'twice #'thrice) 1))
; => (-1 2 3)

; # 13
; Implement a function which returns itself

(print "============== TASK 13 ==============")
(print (
    (lambda (fun) 
        (list fun (list 'quote fun))
    )
    '(lambda (fun) 
        (list fun (list 'quote fun))
    )
))
