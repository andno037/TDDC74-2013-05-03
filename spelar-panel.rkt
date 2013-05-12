(define spelar-panel% (class object%
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
                       
                       (begin 
                         
                         (let* ((panel-main (new vertical-panel% [parent parentin]))
                                
                                
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
                           (new button% [parent horizontal1]
                                [label (read-bitmap "purple.png" )]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'purple )  (send (send DM get-spelare) get-antal-kort 'purple))
                                                (send kassa betala 'purple)
                                                (printf "du har för få kort: ~a" (send kassa get-antal-kort 'purple ) )))])
                           (new button% [parent horizontal1]
                                [label (read-bitmap "rainbow.png" )]
                                [min-height 50]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'rainbow )  (send (send DM get-spelare) get-antal-kort 'rainbow))
                                                (send kassa betala 'rainbow)))])
                           (new button% [parent horizontal1]
                                [label (read-bitmap "red.png" )]
                                 [callback (lambda (button event) 
                                             (if (< (send kassa get-antal-kort 'red )  (send (send DM get-spelare) get-antal-kort 'red))
                                                (send kassa betala 'red)))])
                           (new button% [parent horizontal2]
                                [label (read-bitmap "white.png" )]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'white )  (send (send DM get-spelare) get-antal-kort 'white))
                                                (send kassa betala 'white)))])
                           (new button% [parent horizontal2]
                                [label (read-bitmap "yellow.png" )]
                                [min-height 50]
                                 [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'yellow )  (send (send DM get-spelare) get-antal-kort 'yellow))
                                                (send kassa betala 'yellow)))])
                           (new button% [parent horizontal2]
                                [label (read-bitmap "green.png" )]
                                 [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'green )  (send (send DM get-spelare) get-antal-kort 'green))
                                                (send kassa betala 'green)))])
                           (new button% [parent horizontal3]
                                [label (read-bitmap "brown.png" )]
                                [min-width 50]
                                 [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'brown )  (send (send DM get-spelare) get-antal-kort 'brown))
                                                (send kassa betala 'brown)))])
                           (new button% [parent horizontal3]
                                [label (read-bitmap "blue.png" )]
                                [min-height 50]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'blue )  (send (send DM get-spelare) get-antal-kort 'blue))
                                                (send kassa betala 'blue)))])
                           (new button% [parent horizontal3]
                                [label (read-bitmap "black.png" )]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'black )  (send (send DM get-spelare) get-antal-kort 'black))
                                                (send kassa betala 'black)))])
                           
                           
                           
                           
                           
                           )
                       (super-new)
                       (define/public (installera)
                         (set! installerad #t)
                         (define my-font (make-object font% 20 'default) )
                         (define bredd 150)
                         ;;visa namn
                           (set! namn (new message% [min-width bredd] [font my-font][parent panel] [label (send (send dm get-spelare) get-namn)]) )
                           ;;medelanden
                           
                           (set! purple (new message% [min-width bredd][font my-font][parent horizontal1.2u] [label (number->string(send (send dm get-spelare) get-antal-kort 'purple))]))
                           (set! rainbow (new message% [min-width bredd][font my-font][parent horizontal1.2u] [label (number->string(send (send dm get-spelare) get-antal-kort 'rainbow))]))
                           (set! red (new message% [min-width bredd][font my-font][parent horizontal1.2u] [label (number->string(send (send dm get-spelare) get-antal-kort 'red))]))
                           ;;---nästa tre
                           (set! white (new message% [min-width bredd][font my-font][parent horizontal2.2u] [label (number->string(send (send dm get-spelare) get-antal-kort 'white))]))
                           (set! yellow(new message% [min-width bredd][font my-font][parent horizontal2.2u] [label (number->string(send (send dm get-spelare) get-antal-kort 'yellow))]))
                           (set! green(new message% [min-width bredd][font my-font][parent horizontal2.2u] [label (number->string(send (send dm get-spelare) get-antal-kort 'green))]))
                           ;;---
                           (set! brown(new message% [min-width bredd][font my-font][parent horizontal3.2u] [label (number->string(send (send dm get-spelare) get-antal-kort 'brown))]))
                           (set! blue(new message% [min-width bredd][font my-font][parent horizontal3.2u] [label (number->string(send (send dm get-spelare) get-antal-kort 'blue))]))
                           (set! black(new message% [min-width bredd][font my-font][parent horizontal3.2u] [label (number->string(send (send dm get-spelare) get-antal-kort 'black))])))
                       ;;kör instalera
                       
                       ;; 
                       (define/public (uppdatera)
                         (if (not installerad) (installera))
                         (send namn set-label  (send (send dm get-spelare) get-namn))
                         (send purple set-label (number->string(send (send dm get-spelare) get-antal-kort 'purple)))
                         (send rainbow set-label (number->string(send (send dm get-spelare) get-antal-kort 'rainbow)))
                         (send yellow set-label (number->string(send (send dm get-spelare) get-antal-kort 'yellow)))
                         (send white set-label (number->string(send (send dm get-spelare) get-antal-kort 'white)))
                         (send blue set-label (number->string(send (send dm get-spelare) get-antal-kort 'blue)))
                         (send black set-label (number->string(send (send dm get-spelare) get-antal-kort 'black)))
                         (send red set-label (number->string(send (send dm get-spelare) get-antal-kort 'red)))
                         (send brown set-label (number->string(send (send dm get-spelare) get-antal-kort 'brown)))
                         (send green set-label (number->string(send (send dm get-spelare) get-antal-kort 'green))))
                       
                       
                       
                       )))