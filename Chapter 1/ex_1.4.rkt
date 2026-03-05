#lang sicp
(#%require rackunit)

; if b is positive, it's just addition
; else, it's substraction
; effectively, it evaluates to a + |b|
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))