#lang sicp

(define (fast-prime? n)
  (define (dec x) (- x 1))
  (define (expmod base exp m)
    (define (even? x) (= (remainder x 2) 0))
    (define (square x) (* x x))
    (define (halve x) (/ x 2))
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base
                                                  (halve exp)
                                                  m))
                                  m))
          (else (remainder (* base (expmod base
                                           (dec exp)
                                           m))
                           m))))
  (define (try-it a)
    (= (expmod a n n) a))
  (define (fermat-test times)
    (if (= times 0) #t (and (try-it (+ 1 (random (- n 1))))
                            (fermat-test (dec times)))))
  (fermat-test 10))

(define (timed-prime-test n)
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  (define (start-prime-test start-time)
    (if (fast-prime? n)
        (report-prime (- (runtime) start-time))))
  (display n)
  (start-prime-test (runtime))
  (newline))

(define (search-for-primes start)
  (define (iter n count)
    (cond ((and (not (= count 0)) (fast-prime? n)) (timed-prime-test n)
                                                   (iter (+ n 1) (- count 1)))
          ((not (= count 0)) (iter (+ n 1) count))))
  (display start)
  (newline)
  (iter start 3)
  (display "*********")
  (newline))

#|

  Even with larger inputs, there's neglible difference as input increases by 10 fold with modern
  computers but I see difference of a constant value as expected of O(log n) rate of growth as
  log(10) is a constant.

|#


(search-for-primes 1000000) ; average 19
(search-for-primes 10000000) ; average 22
(search-for-primes 100000000) ; average 24
