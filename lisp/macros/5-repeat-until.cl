; #5
; Implement a (repeat body until cond) macro

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


;; experiments

;; (print (macroexpand '(repeat)))

;; (setf counter 5)
;; (print (macroexpand '(repeat 
;;     (prog1
;;         (print counter)
;;         (setf counter (1- counter))
;;     ) 
;;     'until
;;     (> counter 0)
;;     )))

;; (labels ((my-f ()
;;     (if (> counter 0)
;;         (prog1
;;             (print counter)
;;             (setf counter (1- counter))
;;             (my-f)
;;         )
;;         nil    
;;     )
;; ))
;; (my-f)
;; )

;; (defun recursive-times (k n)
;;    (labels ((temp (n) 
;;               (if (zerop n) 0 (+ k (temp (1- n))))
;;               ))
;;      (temp n))) =>  RECURSIVE-TIMES
;;  (recursive-times 2 3) =>  6

;; (labels ((my-f () 
;;     (print 1)
;; ))
;; (my-f)
;; )

;; (defmacro repeat (body until cond) 
;;     (let ((uniq-func-name (gensym))
;;         `(labels ((,uniq-func-name ()
;;             (if ,cond 
;;                 (prog1
;;                     ,body
;;                     (,uniq-func-name)
;;                 )
;;                 nil
;;             )
;;         )))
;;     ))
;; )

;; (defmacro repeat () 
;;     (let ((uniq-func-name (gensym)))
;;         `(print ,uniq-func-name)
;;     )
;; )