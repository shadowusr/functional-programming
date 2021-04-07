; # 9
; Implement a generator of the Fibonacci sequence

(defun create-fib-gen () (let ((prev 0) (curr 1) (tmp nil))
    (lambda () 
        (setq tmp curr)
        (setq curr (+ prev curr))
        (setq prev tmp)
    )
))

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
