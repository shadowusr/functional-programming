; #7
; Define predicate `filter` which filters out all elements from `list` for
; which `pred` is falsy.

(defun _filter (pred list) (mapcan (lambda (item) (
    if (funcall pred item) (list item) nil
    )) list))

(defun _even (x) (= 0 (mod x 2)))
(defun _odd (x) (= 1 (mod x 2)))

(print (_filter #'_even '(1 1 1 1 4 3)))
(print (_filter #'_odd '(1 1 1 1 4 3)))
(print (_filter #'_odd nil))    (and nil 1)   (or nil 0)   (or (and nil 1) (or nil 0))
