#lang sicp
(#%require rackunit)

; Proof is in ex_1.19.md

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (square x) (* x x))

(define (fib-iter a b p q count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q)) ;compute p'
                   (+ (square q) (* 2 p q)) ;compute q'
                   (/ count 2)))
        (else
         (fib-iter (+ (* b q)
                      (* a q)
                      (* a p))
                   (+ (* b p)
                      (* a q))
                   p
                   q
                   (- count 1)))))

(test-case
 "Tests for Fibonacci number function"
 (check-equal? (fib 0) 0)
 (check-equal? (fib 1) 1)
 (check-equal? (fib 2) 1)
 (check-equal? (fib 3) 2)
 (check-equal? (fib 4) 3)
 (check-equal? (fib 5) 5)
 (check-equal? (fib 6) 8)
 (check-equal? (fib 7) 13)
 (check-equal? (fib 8) 21)
 (check-equal? (fib 9) 34)
 (check-equal? (fib 10) 55)
 (check-equal? (fib 15) 610)
 (check-equal? (fib 20) 6765)
 (check-equal? (fib 30) 832040)
 (check-equal? (fib 40) 102334155))