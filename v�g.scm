(define väg% (class object%
               (init längd dc stad1 stad2 färg p-lista)
               
               
               (define denna-dc dc)
               (define denna-längd längd)
               (define länklista (list stad1 stad2))
               (define lista_punkter '())
               (define köpt #f)
               (define denna-ägare #f)
               (define lista-p p-lista)
               (define my-färg färg)
               (send (cdr stad1) add-väg! this)
               (send (cdr stad2) add-väg! this)
               (super-new)
               
               (define denna-poäng 
                 (cond
                   ((= denna-längd 1) 1)
                   ((= denna-längd 2) 2)
                   ((= denna-längd 3) 4)
                   ((= denna-längd 4) 7)
                   ((= denna-längd 5) 10)
                   ((= denna-längd 6) 13)
                   ((= denna-längd 9) 27)))
               
               (define/public (get-lista-p)
                 lista-p
                 )
               (define/public (kostnad) denna-längd)
               
               (define/public (add-p x y)
                 (set! lista-p (cons (cons x y) lista-p)))
               
               (define/public (set-punkter lista)
                 (set! lista_punkter lista))
               
               (define/public (köpt-av? spelare)
                 (eq? spelare denna-ägare))
               
               (define/public (köpt?) köpt)
               
               (define/public (set-köpt! spelare)
                 (if (not denna-ägare)
                 (begin (set! köpt #t)
                 (set! denna-ägare spelare)
                 (send denna-ägare add-poäng! denna-poäng)
                 (måla-dig!)
                 (send DM nästa-tur))))
               
               (define/public (ägare) denna-ägare)
               
               (define/public (ägare? spelare)
                 (eq? denna-ägare spelare))
               
               (define/public (get-länkar) länklista)
               
               (define/public (uppdatera-dig!)
                 (måla))
               
               (define/public (get-färg) my-färg)
               
               (define (måla-dig!)
                 (måla)
                 (set! uppdateringslista (cons this uppdateringslista)))
                 
                (define (måla)
                 ;;(printf "   ~a  " (cdar länklista))
                 
                 (send dc draw-line (send (cdar länklista) get-x) (send (cdar länklista) get-y) (send (cdadr länklista) get-x) (send (cdadr länklista) get-y))
                 
                 (define tmp-brush (send dc get-brush))
                 
                 (send dc set-brush (send denna-ägare get-färg) 'solid)
                 
                 (for-each (lambda (arg) (send dc draw-ellipse (- (car arg) 4) (- (cdr arg) 4) 8 8 )) lista-p )
                 
                 (send dc set-brush tmp-brush)
                 
                 )
               
               
               ))