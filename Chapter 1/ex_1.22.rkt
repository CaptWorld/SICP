#lang sicp

(define (prime? n)
  (define (square x) (* x x))
  (define (divides? d) (= (remainder n d) 0))
  (define (find-divisor d)
    (cond ((> (square d) n) n)
          ((divides? d) d)
          (else (find-divisor (+ d 1)))))
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

  With small values like 1000, the algo is so fast that there's negligible difference between the
  runtime with 10x inputs. But if I used large values like 1000000, I see a ratio of around 3 between the
  runtime as we increase the input by 10 as expected as SQRT(10) ~= 3.1

|#


(search-for-primes 1000000) ; average 21
(search-for-primes 10000000) ; average 63
(search-for-primes 100000000) ; average 196
