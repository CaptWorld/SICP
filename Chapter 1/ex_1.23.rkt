#lang sicp

(define (prime? n)
  (define (square x) (* x x))
  (define (divides? d) (= (remainder n d) 0))
  (define (next divisor) (if (= divisor 2)
                             3
                             (+ divisor 2)))
  (define (find-divisor d)
    (cond ((> (square d) n) n)
          ((divides? d) d)
          (else (find-divisor (next d)))))
  (define (smallest-divisor) (find-divisor 2))
  (= (smallest-divisor) n))

(define (timed-prime-test n)
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  (define (start-prime-test start-time)
    (if (prime? n)
      (report-prime (- (runtime) start-time))))
  (display n)
  (start-prime-test (runtime))
  (newline))

(define (search-for-primes start)
  (define (iter n count)
    (cond ((and (not (= count 0)) (prime? n)) (timed-prime-test n)
                                              (iter (+ n 1) (- count 1)))
          ((not (= count 0)) (iter (+ n 1) count))))
  (display start)
  (newline)
  (iter start 3)
  (display "*********")
  (newline))

#|

  As expected, the runtime has reduced to half as number of steps have been halved.

|#


(search-for-primes 1000000) ; average 21 -> 11
(search-for-primes 10000000) ; average 63 -> 33
(search-for-primes 100000000) ; average 196 -> 100
