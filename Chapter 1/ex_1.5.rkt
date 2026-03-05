#lang sicp

; If the p function is called, 
;   the interpreter hangs as it calls itself infinitely
(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

; If applicative-order, 
;   the interpreter hangs as all the args gets evaluated
; If normative-order,
;   The interpreter returns 0
(test 0 (p))