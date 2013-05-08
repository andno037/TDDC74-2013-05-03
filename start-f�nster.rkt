
(define start-fönster (new frame% [width 500] [height 500] [label "start fönster"] ))
(define knapp1 #f)
(define knapp2 #f)
(define knapp3 #f)
(define text1 #f)
(define text2 #f)
(define text3 #f)
(define DM #f)

(define färger (list (cons "Röd" "Red") (cons "Blå" "Blue") (cons "Grön" "Green") (cons "Gul" "Yellow") (cons "Rosa" "Pink")))

(define färgad-knapp% (class button%
                        (super-new)
                        (define färg #f)
                        (define index 0)
                        (define/public (set-index! int)
                          (set! index int)
                          )
                        (define/public (get-index)
                          index
                          )
                        (define/public (klickad)
                          (send this set-index! (remainder (+ 1 (send this get-index)) 5 ) ) (send this set-label (car (list-ref färger (send this get-index)))) (set! färg (cdr (list-ref färger (send this get-index)))))
                        
                        (define/public (get-färg) färg) 
                        
                        ))

(begin 
  
 
  
  (let* (
        (övre-halvan (new vertical-pane% 
                         [alignment '(center center)]
                         [parent start-fönster]))
        
        (två (new horizontal-pane% 
                         [alignment '(center center)]
                         [parent övre-halvan]))
        (två.2 (new horizontal-pane% 
                         [alignment '(center center)]
                         [parent övre-halvan]))
        (två.3 (new horizontal-pane% 
                         [alignment '(center center)]
                         [parent övre-halvan]))
        
        (tre (new horizontal-pane% 
                         [alignment '(center center)]
                         [parent start-fönster])))
  
    

    (set! text1(new text-field%	 
   	 	[label "Spelare 1 : "]	 
   	 	[parent två]))
    (set! knapp1 (new färgad-knapp% [parent två]
         [label "Färg"]
         [callback (lambda (button event) (send knapp1 klickad))]))
    
    (set! text2 (new text-field%	 
   	 	[label "Spelare 2 : "]	 
   	 	[parent två.2]))
    (set! knapp2 (new färgad-knapp% [parent två.2]
         [label "Färg"]
         [callback (lambda (button event) (send knapp2 klickad))]))
    
    (set! text3 (new text-field%	 
   	 	[label "Spelare 3 : "]	 
   	 	[parent två.3]))
    (set! knapp3 (new färgad-knapp% [parent två.3]
         [label "Färg"]
         [callback (lambda (button event) (send knapp3 klickad))]))
;; procedur för att skapa en lista med alla namn och färger
(define (get-spelare-lista-med-namn)
  (filter (lambda (arg) (not(void? arg))) (list (if (send knapp1 get-färg)(cons (send text1 get-value) (send knapp1 get-färg)))
        (if (send knapp2 get-färg)(cons (send text2 get-value) (send knapp2 get-färg)))
        (if (send knapp3 get-färg)(cons (send text3 get-value) (send knapp3 get-färg))))))    
    
    
    
    ;;------ start kanpp    
   (new button% [parent tre]
       [label "Start"]
       [callback (lambda (button event) (display "Hej")
                   (load "fönster.scm") 
                   (set! DM (new game% (dc (send *my-canvas* get-dc)) (spelare-lista-med-namn (get-spelare-lista-med-namn)) ))
                   
                   (send start-fönster show #f))])))



(send start-fönster show #t)


