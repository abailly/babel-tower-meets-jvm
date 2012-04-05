(use-package :lisp-unit)

(defun list-of-chars (num)
  (let ((string (prin1-to-string num)))
    (loop for char across string collect char)))

(defun foobarqix (num) 
  (let ((as-string (list-of-chars num)))
    (cond ((= 0 (mod num 3)) "Foo")
          ((member #\3 as-string) "Foo")
          (t (concatenate 'string as-string)))))

(define-test foo-bar-qix
  (assert-equal "1" (foobarqix 1))
  (assert-equal "2" (foobarqix 2))
  (assert-equal "Foo" (foobarqix 6))
  (assert-equal "Foo" (foobarqix 13))
  (assert-equal "FooFoo" (foobarqix 3))
  )
