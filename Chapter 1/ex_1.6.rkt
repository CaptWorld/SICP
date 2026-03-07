#lang sicp

(define (new-if predicate 
                then-clause
                else-clause)
        (cond (predicate then-clause)
              (else else-clause)))

; The issue is same as ex_1.5 where
; if 'if' isn't a special form but applicative-order,
; It hangs as sqrt-iter is called infinitely
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))