#lang sicp

(define (smallest-divisor n)
  (define (square x) (* x x))
  (define (divides? d) (= (remainder n d) 0))
  (define (find-divisor d)
    (cond ((> (square d) n) n)
          ((divides? d) d)
          (else (find-divisor (+ d 1)))))
  (find-divisor 2))

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)