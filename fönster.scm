(require 2htdp/image)



(define *my-bitmap* (make-bitmap  671 1000  #t))
(define *bitmap-dc* (make-object bitmap-dc% *my-bitmap* ) )


(define current #f)
(define current2 #f)
(define *current-väg* #f)
(define *plungt_lista* '())
(define stad_tmp #f)
(define stad_tmp2  #f)
(define lista_väg_punkter '())
(define lista_att_spara '())


(define *my-window* (new frame%
                         [width 1200] [height 1000] [label "En ram"] ))
(define *main-panel* (new horizontal-panel% [parent *my-window*] ))
(load "spelar-panel.rkt")
(load "kassa-panel.rkt")
(load "bord-panel.rkt")
(define *vänster-sida* (new vertical-panel% [parent *main-panel*]))
(define *panel* (new panel% [parent *main-panel*] ))
(define *höger-sida* (new vertical-panel% [parent *main-panel*]))
(define *spelar-panel* (new spelar-panel% [parentin *höger-sida*]))
(define *bord-panel* (new bord-panel% [parentin *vänster-sida*]))
(define *kassa-panel* (new kassa-panel% [parentin *höger-sida*]))

;;(define *msg* (new message% [parent *panel*] [label *my-bitmap*] ))

;;--------- in för målning
(define (render-fn canvas dc)
  (let-values ([(w h) (send canvas get-virtual-size)])
    (install dc)
    
    ;;(send dc draw-rectangle 200 150 (- w 200) (- h 200))
    ;;(tmp dc 199 (+ (send *image* get-width) 150))
    
    (send dc draw-bitmap *image* 0 0)
    ;;(rita_med_scale *image2* 0.05 0.05 586.5 726 dc)
    ;;(send *bitmap-dc* draw-bitmap *image* 0 0)
    ;;(send *msg* set-label *my-bitmap*)
    )
    )

(define (rita_med_scale image scale-x scale-y x y dc)
  (send dc scale scale-x scale-y)
    (send dc draw-bitmap image (* x (/ 1 scale-x)) (* (/ 1 scale-y) y ))
    (send dc scale (/ 1 scale-x) (/ 1 scale-y))
  )

;;-------- canvas


;;--------- games canavs


(define game-canvas%
  (class canvas%
    
    (inherit get-width 
             get-height
             refresh)
    
    (init [keyboard-handler display]
          [mouse-handler mouse-fn])
   
    
    (define on-key-handle keyboard-handler)
    
    (define on-mouse-handle mouse-handler)
    
    (define/override (on-char ke)
      (on-key-handle ke))
    
    (define/override (on-event me)
      (on-mouse-handle me))
    
    (super-new)))
;;game slut


(define (mouse-fn event)
  ;;(printf "hej")
  (if (send event button-down? 'left)
      
      
      (begin
        (uppdatera)
        (printf "punkt < x: ~a , y: ~a  >      ~n" (send event get-x)(send event get-y)) 
            (send *spelar-panel* uppdatera)
            (send *bord-panel* uppdatera)
            (if (and(nand current current2)*current-väg*)
                (begin (printf "current: ~a  current2: ~a  väg: ~a ~n" current current2 *current-väg*)(for-each (lambda (arg) (send arg set-vald-tillf)) *current-väg*)
                                                                 (send *kassa-panel* set-köp-f) (set! *current-väg* #f)))
            (for-each (lambda (arg) 
                        (if(send (cdr arg) träffad (send event get-x) (send event get-y))
                           (if (and current(not current2)) (begin (set! current2 (cdr arg))(set-current-väg)(send *kassa-panel* set-köp-t) (for-each (lambda (arg) (send arg set-vald)) *current-väg*)) 
                               (begin (if *current-väg* (for-each (lambda (arg) (send arg set-vald-tillf)) *current-väg*)) 
                                      (set! *current-väg* #f)  (set! current (cdr arg)) ))))lista-städer)
            
            
            (uppdatera)
            ;;(add-till-p (read) (send event get-x) (send event get-y))
            ;;(if current (set-tmp-stad! current) (add_väg_punkter (send event get-x) (send event get-y)))
            ;;(set! current #f)
            (if current (printf "stad : ~a  stad1 : ~a stad2: ~a  ~n"  (send current get-namn) current current2))
            (printf "hej current väg är ~a" *current-väg*)
            )
      
      )
  (if (send event button-down? 'right)
      
      (display "klar")))

;;-------- canvas får game canvas
(send *panel* set-alignment 'center 'center)

(define *my-canvas* (new game-canvas%
                         [parent *panel*]
                         ;;[keyboard-handler key-fn]
                         [mouse-handler mouse-fn]
                         [paint-callback render-fn]
                         [min-width 671]
                         [min-height 1000]
                         ))
(send *my-canvas* set-canvas-background (make-object color%  50 50 0 ) )

;; gör fönstret synlig och så att det inte går att ändra storlek
(send *my-window* show #t)
(send *my-window* min-width 1200 )
(send *my-window* min-height 1000 )


(send *my-window* stretchable-width #f)
(send *my-window* stretchable-height #f)


;;test

;(send dc translate 500 500)
;    (send dc rotate (/ pi 2))
;    (send dc set-pen "blue" 5 'solid)
;    (send dc draw-line 1 1 500 1 )
;    (send dc set-pen "black" 5 'solid)
;    (send dc draw-line 1 1 1 500)
;    (send dc set-pen "black" 1 'solid)
;    (send dc draw-rectangle 200 100 50 50)


;;test för att lägga in en roterad bild
;(define (tmp dc x y)
;  (send dc translate x y)
;  (send dc rotate (/ pi 2))
;  (send dc draw-bitmap *image* 0 0)
;  (send dc rotate (- (/ pi 2)))
;  (send dc translate (- x) (- y))
;  )

(define (add-till-p tag x-led y-led)
  (set! *plungt_lista* (cons (cons tag (cons x-led y-led))  *plungt_lista*)))

(define (add_väg_punkter x y)
  (set! lista_väg_punkter (cons (cons x y) lista_väg_punkter)))

(define (set-tmp-stad! stad)
  (if stad_tmp
      (begin (set! stad_tmp2 stad) (add_till_s (cons (cons stad_tmp stad_tmp2) lista_väg_punkter)) (set! stad_tmp #f) (set! stad_tmp2 #f) (set! lista_väg_punkter '()))
      (set! stad_tmp stad)
      ))

(define (add_till_s arg)
  (set! lista_att_spara (cons arg lista_att_spara))
  )

(define (save filename lista)
  (let ((out-put (open-output-file filename ) ))
        (write lista out-put)
        (close-output-port out-put)
        )
  
  )


(define (add-scale lista scale)
  (cond
    ((null? lista) '())
    (else (cons (cons (caar lista) (cons (cadar lista) (cons (cddar lista) scale ))) (add-scale(cdr lista) scale) ))
    ))

(define (my-assq tag lista)
  (cond
    ((null? lista) #f)
    ((equal? tag (caar lista)) (car lista))
    (else (my-assq tag (cdr lista)))))

(define (set-current-väg)
 (let ((lista-vägar (send current vägar)))
    
    (set! *current-väg* (filter (lambda (arg)  (or (equal? (send current2 get-namn)  (caadr(send arg get-länkar))) (equal? (send current2 get-namn)  (caar(send arg get-länkar)))) ) lista-vägar)))
    (set! current #f)
    (set! current2 #f)
  )


