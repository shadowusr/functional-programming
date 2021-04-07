; # 5
; Implement a predicate `some` which returns `T` if for some element in `list`, `pred` returns `T` and `NIL` otherwise.

(defun _some (pred list) (not (null (mapcan (lambda (item) (
    if (funcall pred item) (list t) nil
    )) list))))

(defun _even (x) (= 0 (mod x 2)))
(defun _odd (x) (= 1 (mod x 2)))

(print (_some #'_even '(2 1 1 1 4 3)))
(print (_some #'_even '(1 1 1 1 1 3)))
(print (_some #'_odd nil))
