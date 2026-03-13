#lang sicp

(define (square x) (* x x))

(define (abs x)
  (if (< x 0) (- x) x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

#|
  For very small numbers, say 5 digits after decimal point,the provided good-enough? procedure
  is inadequare as it checks for tolerance upto just 3 digits after decimal point,
  which is large for the given small number yielding prematurely with wrong solution
  as the actual solution might have more digits after decimal point
  (sqrt 0.00000016)

  The limited precision indicates that for decimal numbers,
  the total digits that're supported are fixed (say 17).
  For large numbers, a small change in guess, will yield a sizable change in its square
  (x * 10^6 + y * 10^-6)^2 -> x^2 * 10^12 + y^2 * 10^-12  + 2 * x * y
  so, the guess needs to improved in very small fractions to make good-enough? return true
  But since there's limited precision, guess won't improve at all causing the good-enough? to always
  return false and so the interpreter hangs due to infinite sqrt-iter calls
  Remark:- If we had infinite precision, then guess would be improved in very minute quantities so
  that good-enough? will eventually be true
  (sqrt 1111111111111111111)
|#
(define (new-good-enough? guess x)
  (< (abs (- guess (improve guess x)))
     (* 0.0000001 guess)))

(define (new-sqrt-iter guess x)
  (if (new-good-enough? guess x)
      guess
      (new-sqrt-iter (improve guess x) x)))

(define (new-sqrt x) (new-sqrt-iter 1.0 x))

(square (new-sqrt 0.00000016))
(square (new-sqrt 1111111111111111111))