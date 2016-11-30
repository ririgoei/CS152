#lang racket

(define (max-num lst)
(cond[(= 0 (length lst)) 0]
       [(= 1 (length lst)) lst]
       [(< (car lst) (car(cdr lst))) (max-num(cdr lst))]
       [else (max-num(cons(car lst) (cdr(cdr lst))))])
)

;; The function counts from 1 to the specified number, returning a string with the result.
;; The rules are:
;;    If a number is divisible by 3 and by 5, instead say "fizzbuzz"
;;    Else if a number is divisible by 3, instead say "fizz"
;;    Else if a number is divisible by 5, instead say "buzz"
;;    Otherwise say the number
(define (fizzbuzz n)
  (print (fizzbuzz1 1 n)))

;; Helper function for fizzbuzz
(define (fizzbuzz1 i n)
  (cond[(<= i n)
     (cond [(and(= 0 (modulo i 3)) (= 0(modulo i 5))) (printf "fizzbuzz")]
       [(= 0 (modulo i 3)) (printf "fizz")]
       [(= 0 (modulo i 5)) (printf "buzz")]
       [else (print i)])
     (printf "\n")
    (fizzbuzz1 (+ i 1) n)])
  )

(max-num '(1 2 3 4 5))
(max-num '(-5 -3 -2 -13))
(fizzbuzz 21)