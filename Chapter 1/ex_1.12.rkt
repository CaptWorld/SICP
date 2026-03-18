#lang sicp
(#%require rackunit)

(define (sum-upto-n n)
  (/ (* n (+ n 1)) 2))

(define (find-height n)
  (define (helper height)
    (define lo (sum-upto-n height))
    (define hi (+ (sum-upto-n height) height))
    (if (and (<= lo n) (<= n hi))
        height
        (helper (+ height 1))))
  (helper 0))

(define (pascal-triangle n)
  (define height (find-height n))
  (define (helper row col)
    (if (or (= row 0) (= col 0) (= row col))
        1
        (+ (helper (- row 1) col)
           (helper (- row 1) (- col 1)))))
  ; (display height)
  ; (newline)
  ; (display (- n (sum-upto-n height)))
  ; (newline)
  (helper height (- n (sum-upto-n height))))

(test-case
 "Tests for Pascal Triangle"
 (check-equal? (sum-upto-n 0) 0)
 (check-equal? (sum-upto-n 1) 1)
 (check-equal? (sum-upto-n 5) 15)

 (check-equal? (find-height 0) 0)
 (check-equal? (find-height 1) 1)
 (check-equal? (find-height 2) 1)
 (check-equal? (find-height 3) 2)
 (check-equal? (find-height 5) 2)
 (check-equal? (find-height 6) 3)

 (check-equal? (pascal-triangle 1) 1)
 (check-equal? (pascal-triangle 2) 1)
 (check-equal? (pascal-triangle 3) 1)
 (check-equal? (pascal-triangle 4) 2)
 (check-equal? (pascal-triangle 5) 1)
 (check-equal? (pascal-triangle 6) 1)
 (check-equal? (pascal-triangle 7) 3)
 (check-equal? (pascal-triangle 8) 3)
 (check-equal? (pascal-triangle 9) 1)
 (check-equal? (pascal-triangle 10) 1)
 (check-equal? (pascal-triangle 11) 4)
 (check-equal? (pascal-triangle 12) 6)
 (check-equal? (pascal-triangle 13) 4)
 (check-equal? (pascal-triangle 14) 1))
