#lang racket

;; Expressions in the language
(struct b-val (val))
(struct b-if (c thn els))
(struct b-n (n))
(struct succ (n))
(struct pred (n))

;; Main evaluate method
(define (evaluate prog)
  (match prog
    [(struct b-val (v)) v]
    [(struct b-if (c thn els))
     (if (evaluate c)
         (evaluate thn)
         (evaluate els))]
    [(struct b-n (n)) n]
    [(struct succ (n)) (+ (evaluate n) 1)]
    [(struct pred (n)) (- (evaluate n) 1)]
    [_ prog]))

(evaluate (b-val #t))
(evaluate (b-val #f))
(evaluate (b-if (b-val #t)
                (b-if (b-val #f) (b-val #t) (b-val #f))
                (b-val #f)))

(evaluate (succ (succ 2)))
(evaluate (succ 2))
(evaluate (pred (pred 6)))
(evaluate (pred 6))
(evaluate (succ (b-if true 42 0)))
;; Consider the following sample programs for extending the interpreter
; succ 1  =>  returns 2
; succ (succ 7) => returns 9
; pred 5 => returns 6
; succ (if true then 42 else 0) => 43