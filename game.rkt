(define game% (class object%
                
                (init-field dc antal-spelare)
                (define vägtext-x 100)
                (define vägtext-y 100)
                
                (define current-spelare 0)
                
                (super-new)  
                
                (define (skapa-spelare antal-spelare)
                  (if(= antal-spelare 0)
                     null
                     (begin
                       (printf "Ge färg och namn.")
                       (cons (new spelare% (färg "Blue") (namn "Tomat") (dc dc) (x-led 17.5) (y-led 19)) (skapa-spelare (- antal-spelare 1))))))
                
                (define spelarlista (skapa-spelare antal-spelare))
                
                (define/public (get-spelare)
                  (list-ref spelarlista current-spelare))
                
                (define/public (nästa-tur)
                  (set! current-spelare (remainder (+ 1 current-spelare) antal-spelare))
                  (send kassa reset))
                
                (define/public (rita-currentväg)
                  (send dc set-text-foreground "lime")
                  (if (eq? *current-väg* #f)
                      (send dc draw-text currentvägnamn vägtext-x vägtext-y)
                      (send dc draw-text "Ingen väg vald" vägtext-x vägtext-y)))))