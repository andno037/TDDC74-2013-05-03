(define my-button% (class object
                     (init-feild x-led y-led dc bild callback)
                     
                     (super-new)
                     
                     
                     (define (träfad? x y) 
                       (and (and (< 0 (- x x-led)) (> (send bild get-width) (- x x-led)) ) (and (< 0 (- y y-led)) (> (send bild get-height) (- y y-led)) ))
                       )
                     
                     (define/public (klick x y)
                       (if (träfad? x y)
                           (callback)
                           )
                       
                       )
                     
                     
                     
                     
                     
                     ;;Denna klass är inte färdig för tillfället!
                     
                     
                     ))