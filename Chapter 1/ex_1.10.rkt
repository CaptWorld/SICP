#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

#|
  (A 1 10)
  (A 0 (A 1 9))
  (A 0 (A 0 (A 1 8)))
  ...
  (A 0 (A 0 (A 0 (.... (A 0 (A 1 1))))))
  (A 0 (A 0 (A 0 (.... (A 0 2)))))
  (A 0 (A 0 (A 0 (.... 4))))
  (A 0 (A 0 (A 0 (... 8))))
  Seems like it calculates 2 ^ y if x = 1
|#
(A 1 10)

#|
  (A 2 4)
  (A 1 (A 2 3))
  (A 1 (A 1 (A 2 2)))
  (A 1 (A 1 (A 1 (A 2 1))))
  (A 1 (A 1 (A 1 2))) ; 2
  (A 1 (A 1 4)); 2 ^ 2
  (A 1 16); 2 ^ 2 ^ 2
  2 ^ 16; 2 ^ 2 ^ 2 ^ 2
  Seems like it calculates 2 ^ 2 ^ .. ^ 2 for y times when x = 2
|#
(A 2 4)


#|
  (A 3 3)
  (A 2 (A 3 2))
  (A 2 (A 2 (A 3 1)))
  (A 2 (A 2 2))
  (A 2 4)
  2 ^ 16
|#
(A 3 3)

; f(n) = 2 * n
(define (f n) (A 0 n))

(f 10)

; g(n) = 2 ^ n <- from above
(define (g n) (A 1 n))

(g 5)

; h(n) = 2 ^ (2 ^ (.. ^ 2)) n times <- from above
(define (h n) (A 2 n))

(h 3)

; k(n) = 5 * (n ^ 2)
(define (k n) (* 5 n n))

(k 2)