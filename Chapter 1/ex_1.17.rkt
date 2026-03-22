#lang sicp
(#%require rackunit)

(define (halve x) (/ x 2))
(define (double x) (* x 2))
(define (even? x) (= (remainder x 2) 0))

(define (fast-* a b)
  (cond ((= b 0) 0)
        ((even? b)
          (fast-* (double a) (halve b)))
        (else
          (+ a (fast-* a (- b 1))))))

(test-case
 "Test cases for Fast Multiplication"
 (check-equal? (fast-* 0 5) 0)
 (check-equal? (fast-* 5 0) 0)
 (check-equal? (fast-* 1 7) 7)
 (check-equal? (fast-* 7 1) 7)
 (check-equal? (fast-* 2 3) 6)
 (check-equal? (fast-* 3 2) 6)
 (check-equal? (fast-* 4 5) 20)
 (check-equal? (fast-* 5 4) 20)
 (check-equal? (fast-* 6 7) 42)
 (check-equal? (fast-* 10 10) 100)
 (check-equal? (fast-* 2 10) 20)
 (check-equal? (fast-* 3 9) 27))