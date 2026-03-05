#lang sicp
(#%require rackunit)

(define (square x) (* x x))

(define (sum-of-squares x y z)
  (+ (square x) (square y) (square z)))

(define (smallest-of-2 x y)
  (if (< x y) x y))

(define (smallest-of-3 x y z)
  (smallest-of-2 (smallest-of-2 x y) z))

(define (sum-of-squares-of-2-largest x y z)
  (- (sum-of-squares x y z)
     (square (smallest-of-3 x y z))))

; Tests

(test-case
 "Tests for sum of squares of 2 largest numbers"
 (check-equal? (sum-of-squares-of-2-largest 1 2 3) 13)
 (check-equal? (sum-of-squares-of-2-largest 1 3 2) 13)
 (check-equal? (sum-of-squares-of-2-largest 2 1 3) 13)
 (check-equal? (sum-of-squares-of-2-largest 2 3 1) 13)
 (check-equal? (sum-of-squares-of-2-largest 3 1 2) 13)
 (check-equal? (sum-of-squares-of-2-largest 3 2 1) 13)
 (check-equal? (sum-of-squares-of-2-largest 1 1 3) 10)
 (check-equal? (sum-of-squares-of-2-largest 1 3 1) 10)
 (check-equal? (sum-of-squares-of-2-largest 3 1 1) 10)
 (check-equal? (sum-of-squares-of-2-largest -1 -2 -3) 5)
 (check-equal? (sum-of-squares-of-2-largest -1 -3 -2) 5)
 (check-equal? (sum-of-squares-of-2-largest -2 -1 -3) 5)
 (check-equal? (sum-of-squares-of-2-largest -2 -3 -1) 5)
 (check-equal? (sum-of-squares-of-2-largest -3 -1 -2) 5)
 (check-equal? (sum-of-squares-of-2-largest -3 -2 -1) 5)
 ; Added by AI
 ; Zero values
 (check-equal? (sum-of-squares-of-2-largest 0 1 2) 5)
 (check-equal? (sum-of-squares-of-2-largest 0 0 5) 25)
 ; Mixed positive/negative
 (check-equal? (sum-of-squares-of-2-largest -1 2 3) 13)
 (check-equal? (sum-of-squares-of-2-largest -5 2 3) 13)
 ; All equal values
 (check-equal? (sum-of-squares-of-2-largest 2 2 2) 8)
 (check-equal? (sum-of-squares-of-2-largest -1 -1 -1) 2))