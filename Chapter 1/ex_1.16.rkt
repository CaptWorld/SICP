#lang sicp
(#%require rackunit)


(define (fast-expt b e)
  (define (even? x) (= 0 (remainder x 2)))
  (define (square x) (* x x))
  (define (iter x y counter) ; Invariant is x * (y ^ counter) == b ^ e
    (cond ((= counter 0) x)
          ((even? counter) 
            (iter x
                  (square y)
                  (/ counter 2)))
          (else
            (iter (* x y)
                  y
                  (- counter 1)))))
  (iter 1 b e))

(test-case
 "Test cases for Iterative Fast Exponential Process"
 (check-equal? (fast-expt 2 5) 32)
 (check-equal? (fast-expt 2 0) 1)
 (check-equal? (fast-expt 2 1) 2)
 (check-equal? (fast-expt 2 2) 4)
 (check-equal? (fast-expt 2 3) 8)
 (check-equal? (fast-expt 2 4) 16)
 (check-equal? (fast-expt 3 2) 9)
 (check-equal? (fast-expt 3 3) 27)
 (check-equal? (fast-expt 5 3) 125)
 (check-equal? (fast-expt 2 10) 1024)
 (check-equal? (fast-expt 2 20) 1048576))