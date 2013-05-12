;; i Denna  fill definerars classen stad.
;; en stad har som uppgift att lagra viss information så som sin position en bild av sig själv. men också en skalla på hur stor den är
;; stad har också en lista med alla sina vägar som går i från den.
;; för att stad skall kunna rita ut sig själv på skärmen tar stadin dc.



(define stad% (class object% 
                (init namn dc x-led y-led bild1 bild2 scale)                ; initialization argument
                
                (define my-namn namn)
                (define my-dc dc)
                (define my-x-led x-led)
                (define my-y-led y-led) 
                (define my-bild1 bild1)
                (define my-bild2 bild2) 
                (define my-scale scale)
                (define *lista-vägar* '())
                (define vald #f)
                ; field
                
                (super-new)                ; superclass initialization
                (set! uppdateringslista (cons this uppdateringslista))
                ;;ger ut namn som en string
                (define/public (get-namn)
                  my-namn)
                ;; x-kordinat
                (define/public (get-x)
                  my-x-led)
                ;; y-kordinat
                (define/public (get-y)
                  my-y-led)
                ;; skalla
                (define/public (get-scale)
                  my-scale)
                ;;den funktion adderar en väg till stadens lista
                (define/public (add-väg!  väg)
                  (set! *lista-vägar* (cons  väg *lista-vägar*)))
                ;;retonerar det assq paret som har tagen namn
                ;; namn --> (namn . object-väg)
                (define/public (get-väg namn)
                  (assq namn *lista-vägar*))
                
                ;;ger ut hella listan med alla assq paren
                ;; ' ' --> lista med (tag . object-väg)
                
                (define/public (vägar)
                  *lista-vägar*)
                ;;för att kunna se om en stad har blivit klickad på.
                (define/public (träffad m-x m-y)
                  (if (träffad-in? m-x m-y) 
                      (begin(set-vald! #t) this)
                      (begin (set-vald! #f) #f)))
                
                (define (träffad-in? m-x m-y)
                  
                  (>= (*(* 175 my-scale )(* 175 my-scale )) (+ (* (- m-x my-x-led ) (- m-x my-x-led )) (* (- m-y my-y-led ) (- m-y my-y-led ))))
                 ;;det tar kanske lite tid med det här är pytagoras för att få avståndet av dit klik till stadens mitt ;) 
                 )
                ;; om staden har blivit vad kommer litte sker att hända
                (define/public (set-vald! in)
                  (set! vald in)
                  )
                (define/public (uppdatera-dig!)
                  (if vald
                      (måla-dig! my-bild1)
                      (måla-dig! my-bild2)
                      )
                  )
                ;; staden tar hand om sin egna ut målning till skärmen
                (define (måla-dig! bild-tmp)
                  (rita_med_scale bild-tmp my-scale my-scale x-led y-led my-dc))
                
                (define (rita_med_scale image scale-x scale-y x y dc)
                  (send dc scale scale-x scale-y)
                  (send dc draw-bitmap image (-(* x (/ 1 scale-x))(* 12 (/ 1 scale-x))) (- (* (/ 1 scale-y) y )(* 12 (/ 1 scale-x))))
                  (send dc scale (/ 1 scale-x) (/ 1 scale-y))
                  )
                
                ))