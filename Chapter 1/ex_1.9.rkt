#lang sicp

(define (inc x) (+ x 1))

(define (dec x) (- x 1))

#|
  This process is recursive as there are deffered operations and the solution can't be calculated
  without keeping track of the deferred operations on top of state of the variables.
  The number of deferred operations and time taken also grows proportional to a
|#
(define (add a b)
  (if (= a 0)
      b
      (inc (add (dec a) b))))

#|
  (add 4 5)
  (inc (add 3 5))
  (inc (inc (add 2 5)))
  (inc (inc (inc (add 1 5))))
  (inc (inc (inc (inc (add 0 5)))))
  (inc (inc (inc (inc 5))))
  (inc (inc (inc 6)))
  (inc (inc 7))
  (inc 8)
  9
|#
(add 4 5)

#|
  The process is iterative as the solution can be calculated by just storing the state of variables.
  No deferred operations and the time taken is proportional to a
|#
(define (add a b)
  (if (= a 0)
      b
      (add (dec a) (inc b))))

#|
  (add 4 5)
  (add 3 6)
  (add 2 7)
  (add 1 8)
  (add 0 9)
  9
|#
(add 4 5)