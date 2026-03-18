#lang sicp

(define (f-r n)
  (if (< n 3)
      n
      (+ (f-r (- n 1))
         (* 2 (f-r (- n 2)))
         (* 3 (f-r (- n 3))))))

(f-r 15)

(define (f-i n)
  (define (iter a b c count)
    (if (= count n)
        a
        (iter b
              c
              (+ c
                 (* 2 b)
                 (* 3 a))
              (+ count 1))))
  (iter 0 1 2 0))

(f-i 15)