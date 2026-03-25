#lang sicp

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

#|

  Normal-Order Evaluation 
  
    Note:- Comments will show the # of remainder operations performed in that step

    (gcd 206 40)
    (gcd 40 (remainder 206 40))
    (if (= 6 0) ; 1
        206
        (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
    (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
    (if (= 4 0); 2
        (remainder 206 40)
        (gcd (remainder 40 (remainder 206 40))
            (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
    (gcd (remainder 40 (remainder 206 40))
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
    (if (= 2 0) ; 4
        (remainder 40 (remainder 206 40))
        (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
            (remainder (remainder 40 (remainder 206 40))
                        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
        (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
    (if (= 0 0) ; 7
        (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
        (gcd (remainder (remainder 40 (remainder 206 40))
                        (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
            (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
                        (remainder (remainder 40 (remainder 206 40))
                                  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    2 ; 4

    So total of 1 + 2 + 4 + 7 = 14 remainder operations in normal-order evaluation

|#

#|

  Applicative-Order Evaluation 
  
    Note:- Comments will show the # of remainder operations performed in that step

    (gcd 206 40)
    (gcd 40 6) ; 1
    (if (= 6 0)
        206
        (gcd 6 (remainder 40 6)))
    (gcd 6 4) ; 1
    (if (= 4 0)
        6
        (gcd 4 (remainder 6 4)))
    (gcd 4 2) ; 1
    (if (= 2 0)
        4
        (gcd 2 (remainder 4 2)))
    (gcd 2 0) ; 1
    2

    So total of 1 + 1 + 1 + 1 = 4 remainder operations in applicative-order evaluation

|#

(gcd 206 40)