(define spelar-panel% (class object%
                       (init-field parentin)
                       (define panel #f )
                       (define horizontal1.2u #f )
                       (define horizontal2.2u #f )
                       (define horizontal3.2u #f )
                       (define namn #f)
                       (define antal-tåg #f) 
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
                       ;;knappar
                       (define button-purple #f)
                       (define button-rainbow #f)
                       (define button-yellow #f)
                       (define button-white #f)
                       (define button-blue #f)
                       (define button-black #f)
                       (define button-red #f)
                       (define button-brown #f)
                       (define button-green #f)
                       ;;  
                        
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
                           (set! button-purple (new button% [parent horizontal1]
                                [label (read-bitmap "purple.png" )]
                                [enabled #f]
                                [min-width 50]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'purple )  (send (send DM get-spelare) get-antal-kort 'purple))
                                                (send kassa betala 'purple)
                                                (printf "du har för få kort: ~a" (send kassa get-antal-kort 'purple ) )))]))
                           (set! button-rainbow (new button% [parent horizontal1]
                                [label (read-bitmap "rainbow.png" )]
                                [min-height 50]
                                [enabled #f]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'rainbow )  (send (send DM get-spelare) get-antal-kort 'rainbow))
                                                (send kassa betala 'rainbow)))]))
                           (set! button-red (new button% [parent horizontal1]
                                [label (read-bitmap "red.png" )]
                                [enabled #f]
                                 [callback (lambda (button event) 
                                             (if (< (send kassa get-antal-kort 'red )  (send (send DM get-spelare) get-antal-kort 'red))
                                                (send kassa betala 'red)))]))
                           (set! button-white (new button% [parent horizontal2]
                                [label (read-bitmap "white.png" )]
                                [min-width 50]
                                [enabled #f]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'white )  (send (send DM get-spelare) get-antal-kort 'white))
                                                (send kassa betala 'white)))]))
                           (set! button-yellow (new button% [parent horizontal2]
                                [label (read-bitmap "yellow.png" )]
                                [min-height 50]
                                [enabled #f]
                                 [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'yellow )  (send (send DM get-spelare) get-antal-kort 'yellow))
                                                (send kassa betala 'yellow)))]))
                           (set! button-green (new button% [parent horizontal2]
                                [label (read-bitmap "green.png" )]
                                [enabled #f]
                                 [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'green )  (send (send DM get-spelare) get-antal-kort 'green))
                                                (send kassa betala 'green)))]))
                           (set! button-brown (new button% [parent horizontal3]
                                [label (read-bitmap "brown.png" )]
                                [min-width 50]
                                [enabled #f]
                                 [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'brown )  (send (send DM get-spelare) get-antal-kort 'brown))
                                                (send kassa betala 'brown)))]))
                           (set! button-blue (new button% [parent horizontal3]
                                [label (read-bitmap "blue.png" )]
                                [min-height 50]
                                [enabled #f]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'blue )  (send (send DM get-spelare) get-antal-kort 'blue))
                                                (send kassa betala 'blue)))]))
                           (set! button-black (new button% [parent horizontal3]
                                [label (read-bitmap "black.png" )]
                                [enabled #f]
                                [callback (lambda (button event) 
                                            (if (< (send kassa get-antal-kort 'black )  (send (send DM get-spelare) get-antal-kort 'black))
                                                (send kassa betala 'black)))]))
                           
                           
                           
                           
                           
                           )
                       (super-new)
                       (define/public (installera)
                         (set! installerad #t)
                         (define my-font (make-object font% 20 'default) )
                         (define bredd 150)
                         ;;visa namn
                           (set! namn (new message% [min-width bredd] [font my-font][parent panel] [label (string-append "Spelare : " (send (send dm get-spelare) get-namn))]) )
                         ;;visa tåg kvar  
                         (set! antal-tåg (new message% [min-width bredd] [font my-font][parent panel] [label (string-append "Antal tåg : " (number->string (send (send dm get-spelare) get-antal-tåg)) )]))
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
                         (send namn set-label  (string-append "Spelare : " (send (send dm get-spelare) get-namn)))
                         (send antal-tåg set-label  (string-append "Antal tåg : " (number->string (send (send dm get-spelare) get-antal-tåg)) ))
                         (send purple set-label (number->string(send (send dm get-spelare) get-antal-kort 'purple)))
                         (send rainbow set-label (number->string(send (send dm get-spelare) get-antal-kort 'rainbow)))
                         (send yellow set-label (number->string(send (send dm get-spelare) get-antal-kort 'yellow)))
                         (send white set-label (number->string(send (send dm get-spelare) get-antal-kort 'white)))
                         (send blue set-label (number->string(send (send dm get-spelare) get-antal-kort 'blue)))
                         (send black set-label (number->string(send (send dm get-spelare) get-antal-kort 'black)))
                         (send red set-label (number->string(send (send dm get-spelare) get-antal-kort 'red)))
                         (send brown set-label (number->string(send (send dm get-spelare) get-antal-kort 'brown)))
                         (send green set-label (number->string(send (send dm get-spelare) get-antal-kort 'green))))
                       
                       (define/public (set-buttons-falsk)
                         (send button-purple enable  #f)
                         (send button-rainbow enable #f)
                         (send button-yellow enable #f)
                         (send button-white enable #f)
                         (send button-blue enable #f)
                         (send button-black enable #f)
                         (send button-red  enable #f)
                         (send button-brown enable #f)
                         (send button-green enable #f)
                         
                         )
                       (define/public (set-buttons-sant)
                         (send button-purple enable  #t)
                         (send button-rainbow enable #t)
                         (send button-yellow enable #t)
                         (send button-white enable #t)
                         (send button-blue enable #t)
                         (send button-black enable #t)
                         (send button-red  enable #t)
                         (send button-brown enable #t)
                         (send button-green enable #t)
                         )
                       
                       )))