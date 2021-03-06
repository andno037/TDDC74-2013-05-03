(require racket/mpair)
(define *image* (read-bitmap "nordic_map.jpg" ))
(define *image2* (read-bitmap "grön_knapp.png" ))
(define *image3* (read-bitmap "gul_knapp.png" ))
(define lista-städer '())
(load "Game.rkt")
(define lista-vägar '())
(define väg #f)
(load "stad.scm")
(load "väg.scm")
(load "spelare.rkt")
(load "kort.rkt")
(load "tåg-kort.rkt")
(load "kassa.rkt")
(load "kortlek.scm")
(load "master-kortlek.rkt")


(define (install dc)


(define (add-stad tag en-stad)
  (set! lista-städer (cons (cons tag en-stad) lista-städer))
  )

 
  (my-load "städer2.scm")
  (my-load2 "vägar_nyp.rkt" )
  (for-each  (lambda (arg) (add-stad (car arg) (new stad% [namn (car arg)] [dc dc] [x-led (- (cadr arg) 272.5)] [y-led (caddr arg)] [bild1 *image2*] [bild2 *image3*] [ scale (cdddr arg)])) ) *plungt_lista*)
  (for-each (lambda (arg) (add-väg (new väg% [längd (cddar arg)] [dc dc] [stad1 (assq (caaar arg) lista-städer)] [stad2 (assq (cadar arg)lista-städer)]  [färg (cdaar arg)] [p-lista (cdr arg)]))) lista_att_spara)
  
  (display "ok")
  )
;;install global

(define current #f)
(define current2 #f)
(define *current-väg* #f)
(define *plungt_lista* '())
(define stad_tmp #f)
(define stad_tmp2  #f)
(define lista_väg_punkter '())
(define lista_att_spara '())
(define currentvägnamn "Ingen väg vald.")



(define *discard* (new master-kortlek%))
(define *deck* (new master-kortlek%))




(define kassa (new kassa%))


;;

(define (make-cards tfärg antal)
  (cond
    ((= antal 0) '())
    (else (cons (new tåg-kort% (bild (read-bitmap (get-file-name tfärg))) (ägare #f) (färg tfärg))(make-cards tfärg (- antal 1))))))

(define (get-file-name färg)
  (let ((return (string-append (symbol->string färg) ".png")))
    return))

(let ((lista (append
                  (make-cards 'green 12)
                  (make-cards 'red 12)
                  (make-cards 'rainbow 14)
                  (make-cards 'blue 12)
                  (make-cards 'purple 12)
                  (make-cards 'black 12)
                  (make-cards 'white 12)
                  (make-cards 'brown 12)
                  (make-cards 'yellow 12))))
  (for-each (lambda (arg) (send *deck* master-add-kort! arg) ) lista)
  
  )
  



(define (add-väg tmp-v)
  
  ;;(printf "  ~a     ~a  ~n" (caar(send tmp-v get-länkar))  (caadr(send tmp-v get-länkar)))
  
  
  (set! lista-vägar (cons (cons  (string-append (symbol->string (caar(send tmp-v get-länkar))) "->" (symbol->string (caadr(send tmp-v get-länkar)))) tmp-v) lista-vägar)))
  
  
(define (my-load filename)
      (let ((in-put (open-input-file filename)) )
        (set! *plungt_lista* (read in-put))
        (close-input-port in-put)
        ))
(define (my-load2 filename )
      (let ((in-put (open-input-file filename)) )
        (set! lista_att_spara (read in-put))
        (close-input-port in-put)
        ))