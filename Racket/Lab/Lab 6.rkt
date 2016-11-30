#lang racket

(define-syntax switch
  (syntax-rules ()
    [(switch x ('def exp)) exp]
    [(switch x (y exp)) (if (= x y) exp)]
    [(switch x (v1 exp1) rest ...)
     (if (= x v1)
         exp1
         (switch x rest ...))]
))

(define x 60)
(switch x
    [3 (displayln "x is 3")]
    [4 (displayln "x is 4")]
    [5 (displayln "x is 5")]
    ['def (displayln "none of the above")])