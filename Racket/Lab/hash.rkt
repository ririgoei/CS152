#lang racket

(define (pos-nums-only lst)
  (cond [(empty? lst) '()]
        [(> (car lst) 0)
         (cons (car lst) (pos-nums-only (cdr lst)))]
        [else (pos-nums-only (cdr lst))]))

(define (get-matching-elems matches? lst)
  (cond [(empty? lst) '()]
        [(matches? (car lst)) (cons (car lst) (get-matching-elems matches? (cdr lst)))]
        [else (get-matching-elems matches? (cdr lst))]))

(define (pos-nums-only lst)
  (get-matching-elems (lambda (y) (> x 0) lst)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(struct employee (fname lname salary dept))
(struct manager (fname lname salary dept bonus))

(define (calc-wages emp)
  (match emp [(struct employee (first last sal dp)) sal]
             ;;[(struct employee (_ _ sal _)) sal]
             [(struct manager (f l sal dp extra)) (+ sal extra)]
             ;;[(struct manager (_ _ sal _ _))(+ sal extra)]
    ))

(let ([dilbert (employee "Dilbert" "Adams" 8000 "Eng")]
      [phb (manager "Boss" "Pointy-Haired" 10500 "Eng" (20000))])
      (displayln (calc-wages dilbert)))

(define ht (hash 'a 1 'b 2)
  (hash-ref ht 'a)
  (hash-ref ht 'c 0)    ;;0 is default value; if 'c is not found, don't crash, just return me a dummy value
  (define ht2 (hash-set ht 'c 42))
  (hash-ref ht2 'c 0)
  (hash-ref ht 'c 0))

