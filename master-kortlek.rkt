(define master-kortlek% (class kortlek%
                          
                   (super-new )
                   
                          
                   (define lista-kort (list (cons 'red (new kortlek%)) (cons 'blue (new kortlek%))(cons 'yellow (new kortlek%))(cons 'green (new kortlek%))
                   (cons 'white (new kortlek%))(cons 'purple (new kortlek%))(cons 'brown (new kortlek%))(cons 'black (new kortlek%))(cons 'rainbow (new kortlek%))))
                   
                   
                     
                          
                   (define/public (master-ta-kort! tag)
                    (send (cdr (assq tag lista-kort)) ta-kort!))
  
                   (define/public (master-ta-random!)
                     (if (=(get-antal-master)0)
                         (begin (set! *deck* *discard*) (set! *discard* (new master-kortlek%)) (send *deck* master-ta-random!))
                     (let ((tmp-kort (send (cdr (list-ref lista-kort (random 9))) ta-kort!)))
                       (if (begin  tmp-kort)
                           tmp-kort (master-ta-random!)
                           ))))
                          
                   (define/public (get-antal-master) (get-antal-master-r lista-kort))
                          
                          
                   (define (get-antal-master-r lista)
                     (cond
                       ((null? lista)0)
                       (else (+ (send (cdar lista) get-antal-kort) (get-antal-master-r (cdr lista))))
                       ))
                 
                  (define/public  master-add-kort! (lambda arg (if (null?(cdr arg)) (master-add-kort-intärn! (car arg)) (master-add-flera-kort-intärn! arg)) ))
                  (define/public (master-add-flera-kort! lista) (master-add-flera-kort-intärn! lista))        
                  (define (master-add-flera-kort-intärn! lista)
                    
                    (for-each (lambda (arg) (master-add-kort-intärn! arg))  lista))
                    
                    
                          
                          
                 (define (master-add-kort-intärn! kort-in)
                   (send (cdr (assq (send kort-in get-färg) lista-kort) ) add-kort! kort-in))         
                          
                   ;;(define (get-add-kort) master-add-kort!)       
                          
                          
                          
                     
                     
                     
                   ;;fungerar ej 
                   ;;temporär för att visa i command föster
                   (define/public (visa-master)
                     
                     (for-each (lambda (arg) (printf "~a ~n" (make-object image-snip% (send (cdr arg) visa)) ))  lista-kort)
                     )))