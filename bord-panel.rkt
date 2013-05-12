(define bord-panel% (class object%
                       (init-field parentin)
                       (define panel #f )
                       (define horizontal1.2u #f )
                       (define horizontal2.2u #f )
                       (define horizontal3.2u #f )
                       (define namn #f)
                       (define purple #f)
                       (define rainbow #f)
                       (define yellow #f)
                       (define white #f)
                       (define blue #f)
                       (define black #f)
                       (define red #f)
                       (define brown #f)
                       (define green #f)
                       (define installerad #f)
                       (define bord (new spelare% (färg "red") (namn "bord") (dc #f) (x-led -100) (y-led -100)))
                       
                       (begin 
                         
                         (let* ((panel-main (new vertical-panel% [parent parentin]))
                                
                                (horizontal (new horizontal-pane% 
                                                ;[alignment '(center center)]
                                                [parent panel-main]))
                                (horizontal1 (new horizontal-pane% 
                                                ;[alignment '(center center)]
                                                [parent panel-main]))
                                (horizontal1.2 (new horizontal-pane% 
                                                [alignment '(center center)]
                                                [parent panel-main]))
                                
                                (horizontal2 (new horizontal-pane% 
                                                ;[alignment '(center center)]
                                                [parent panel-main]))
                                (horizontal2.2 (new horizontal-pane% 
                                                [alignment '(center center)]
                                                [parent panel-main]))
                                (horizontal3 (new horizontal-pane% 
                                                ;[alignment '(center center)]
                                                [parent panel-main]))
                                (horizontal3.2 (new horizontal-pane% 
                                                [alignment '(center center)]
                                                [parent panel-main])))
                           
                           
                           
                           ;; set!
                           (set! panel panel-main  )
                           (set! horizontal1.2u  horizontal1.2  )
                           (set! horizontal2.2u  horizontal2.2  )
                           (set! horizontal3.2u  horizontal3.2  )
                           
                           
                           
                           ;;knappar
                           (new button% [parent horizontal]
                                [label "Deck"]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (if (> (send *deck* get-antal-master  )  0)
                                                (begin (send (send DM get-spelare) add-kort! (send *deck* master-ta-random!)) 
                                                       (send *spelar-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'purple ) )))])
                           (new button% [parent horizontal]
                                [label "uppdrag"]
                                [min-width 50]
                                [callback (lambda a (printf "hej"))])
                           
                           
                           
                           (new button% [parent horizontal1]
                                [label (read-bitmap "purple.png" )]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (if (> (send bord get-antal-kort 'purple )  0)
                                                (begin (send (send DM get-spelare) add-kort! (send bord ta-kort! 'purple))  (send bord dra-kort!)
                                                       (send *spelar-panel* uppdatera)(send *bord-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'purple ) )))])
                           (new button% [parent horizontal1]
                                [label (read-bitmap "rainbow.png" )]
                                [min-height 50]
                                [callback (lambda (button event) 
                                            (if (> (send bord get-antal-kort 'rainbow )  0)
                                                (begin (send (send DM get-spelare) add-kort! (send bord ta-kort! 'rainbow))  (send bord dra-kort!)
                                                       (send *spelar-panel* uppdatera)(send *bord-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'rainbow) )))])
                           (new button% [parent horizontal1]
                                [label (read-bitmap "red.png" )]
                                [callback (lambda (button event) 
                                            (if (> (send bord get-antal-kort 'red )  0)
                                                (begin (send (send DM get-spelare) add-kort! (send bord ta-kort! 'red))  (send bord dra-kort!)
                                                       (send *spelar-panel* uppdatera)(send *bord-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'red) )))])
                           (new button% [parent horizontal2]
                                [label (read-bitmap "white.png" )]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (if (> (send bord get-antal-kort 'white)  0)
                                                (begin (send (send DM get-spelare) add-kort! (send bord ta-kort! 'white))  (send bord dra-kort!)
                                                       (send *spelar-panel* uppdatera)(send *bord-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'white) )))])
                           (new button% [parent horizontal2]
                                [label (read-bitmap "yellow.png" )]
                                [min-height 50]
                                [callback (lambda (button event) 
                                            (if (> (send bord get-antal-kort 'yellow )  0)
                                                (begin (send (send DM get-spelare) add-kort! (send bord ta-kort! 'yellow))  (send bord dra-kort!)
                                                       (send *spelar-panel* uppdatera)(send *bord-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'yellow) )))])
                           (new button% [parent horizontal2]
                                [label (read-bitmap "green.png" )]
                                [callback (lambda (button event) 
                                            (if (> (send bord get-antal-kort 'green)  0)
                                                (begin (send (send DM get-spelare) add-kort! (send bord ta-kort! 'green))  (send bord dra-kort!)
                                                       (send *spelar-panel* uppdatera)(send *bord-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'green))))])
                           (new button% [parent horizontal3]
                                [label (read-bitmap "brown.png" )]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (if (> (send bord get-antal-kort 'brown )  0)
                                                (begin (send (send DM get-spelare) add-kort! (send bord ta-kort! 'brown))  (send bord dra-kort!)
                                                       (send *spelar-panel* uppdatera)(send *bord-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'brown) )))])
                           (new button% [parent horizontal3]
                                [label (read-bitmap "blue.png" )]
                                [min-height 50]
                                [callback (lambda (button event) 
                                            (if (> (send bord get-antal-kort 'blue)  0)
                                                (begin (send (send DM get-spelare) add-kort! (send bord ta-kort! 'blue))  (send bord dra-kort!)
                                                       (send *spelar-panel* uppdatera)(send *bord-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'blue) )))])
                           (new button% [parent horizontal3]
                                [label (read-bitmap "black.png" )]
                                [callback (lambda (button event) 
                                            (if (> (send bord get-antal-kort 'black )  0)
                                                (begin (send (send DM get-spelare) add-kort! (send bord ta-kort! 'black))  (send bord dra-kort!)
                                                       (send *spelar-panel* uppdatera)(send *bord-panel* uppdatera)(send dm tog-kort))
                                                (printf "du det finns för få kort: ~a" (send bord get-antal-kort 'black) )))]))
                       (super-new)
                       (define/public (installera)
                         (set! installerad #t)
                         (define my-font (make-object font% 20 'default) )
                         (define bredd 150)
                         ;;visa namn
                           (set! namn (new message% [font my-font][parent panel] [label (send bord get-namn)]) )
                           ;;medelanden
                           
                           (set! purple (new message% [min-width bredd][font my-font][parent horizontal1.2u] [label (number->string(send bord get-antal-kort 'purple))]))
                           (set! rainbow (new message% [min-width bredd][font my-font][parent horizontal1.2u] [label (number->string(send bord get-antal-kort 'rainbow))]))
                           (set! red (new message% [min-width bredd][font my-font][parent horizontal1.2u] [label (number->string(send bord get-antal-kort 'red))]))
                           ;;---nästa tre
                           (set! white (new message% [min-width bredd][font my-font][parent horizontal2.2u] [label (number->string(send bord get-antal-kort 'white))]))
                           (set! yellow(new message% [min-width bredd][font my-font][parent horizontal2.2u] [label (number->string(send bord get-antal-kort 'yellow))]))
                           (set! green(new message% [min-width bredd][font my-font][parent horizontal2.2u] [label (number->string(send bord get-antal-kort 'green))]))
                           ;;---
                           (set! brown(new message% [min-width bredd][font my-font][parent horizontal3.2u] [label (number->string(send bord get-antal-kort 'brown))]))
                           (set! blue(new message% [min-width bredd][font my-font][parent horizontal3.2u] [label (number->string(send bord get-antal-kort 'blue))]))
                           (set! black(new message% [min-width bredd][font my-font][parent horizontal3.2u] [label (number->string(send bord get-antal-kort 'black))])))
                       ;;kör instalera
                       
                       ;; 
                       (define/public (uppdatera)
                         (if (not installerad) (installera))
                         (send namn set-label  (send bord get-namn))
                         (send purple set-label (number->string(send bord get-antal-kort 'purple)))
                         (send rainbow set-label (number->string(send bord get-antal-kort 'rainbow)))
                         (send yellow set-label (number->string(send bord get-antal-kort 'yellow)))
                         (send white set-label (number->string(send bord get-antal-kort 'white)))
                         (send blue set-label (number->string(send bord get-antal-kort 'blue)))
                         (send black set-label (number->string(send bord get-antal-kort 'black)))
                         (send red set-label (number->string(send bord get-antal-kort 'red)))
                         (send brown set-label (number->string(send bord get-antal-kort 'brown)))
                         (send green set-label (number->string(send bord get-antal-kort 'green))))
                       
                       
                       
                       )))