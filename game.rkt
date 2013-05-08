(define game% (class object%
                
                (init-field dc spelare-lista-med-namn)
                (define vägtext-x 100)
                (define vägtext-y 100)
                
                (define current-spelare 0)
                
                (super-new)  
                
                (define (skapa-spelare spelare-lista)
                  (if(eq? spelare-lista '())
                     null
                     (begin
                       (cons (new spelare% (färg (cdar spelare-lista )) (namn (caar spelare-lista )) (dc dc) (x-led 17.5) (y-led 19)) (skapa-spelare (cdr spelare-lista))))))
                
                (define spelarlista (skapa-spelare spelare-lista-med-namn))
                
                (define/public (get-spelare)
                  (list-ref spelarlista current-spelare))
                
                (define/public (nästa-tur)
                  (set! current-spelare (remainder (+ 1 current-spelare) (length spelarlista)))
                  (send kassa reset))
                
                (define/public (rita-currentväg)
                  (send dc set-text-foreground "lime")
                  (if (eq? *current-väg* #f)
                      (send dc draw-text currentvägnamn vägtext-x vägtext-y)
                      (send dc draw-text "Ingen väg vald" vägtext-x vägtext-y)))))