#lang sicp
(#%require rackunit)

(define (fast-prime? n)
  (define (dec x) (- x 1))
  (define (square x) (* x x))
  (define (halve x) (/ x 2))
  (define (even? x) (= (remainder x 2) 0))
  (define (check-and-square val)
    (define remainder-val (remainder (square val) n))
    (if (and (not (= val 1))
             (not (= val (dec n)))
             (= remainder-val 1))
        0
        remainder-val))
  (define (exp-mod base exp n)
    (cond ((= exp 0) 1)
          ((even? exp) (check-and-square (exp-mod base (halve exp) n)))
          (else (remainder (* base (exp-mod base (dec exp) n)) n))))
  (define (miller-rabin-test)
    (define (try-it a)
      (= (exp-mod a (dec n) n) 1))
    (try-it (+ 1 (random (- n 1)))))
  (define (iter times)
    (cond ((= times 0) #t)
          ((miller-rabin-test) (iter (dec times)))
          (else #f)))
  (iter 3))

(test-case
 "Tests for Miller-Rabin fast-prime function"
 ; Non-prime numbers
 (check-false (fast-prime? 4))
 (check-false (fast-prime? 9))
 (check-false (fast-prime? 15))
 (check-false (fast-prime? 21))
 (check-false (fast-prime? 25))
 (check-false (fast-prime? 27))
 (check-false (fast-prime? 91))
 (check-false (fast-prime? 99))
 (check-false (fast-prime? 9040))
 (check-false (fast-prime? 1000000))

 ; Prime numbers
 (check-true (fast-prime? 2))
 (check-true (fast-prime? 3))
 (check-true (fast-prime? 853))
 (check-true (fast-prime? 7919))
 (check-true (fast-prime? 9041))
 (check-true (fast-prime? 1000003))

 ; Carmichael numbers
 (check-false (fast-prime? 1105))
 (check-false (fast-prime? 561))
 (check-false (fast-prime? 1729))
 (check-false (fast-prime? 2465))
 (check-false (fast-prime? 2821))
 (check-false (fast-prime? 6601)))