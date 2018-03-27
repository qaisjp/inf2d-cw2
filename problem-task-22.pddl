(define (problem bar-22) ;; Replace XX with task number
    (:domain bartending)
    (:objects
    	UF - location
    	UB - location
    	MB - location
    	LB - location
    	LF - location
    	MF - location
    	
    	G - glass
    	C - customer
    )
    
    (:init
    	(Adjacent BAR UF)
		(Adjacent UF UB)
		(Adjacent UB MB)
		(Adjacent MB LB)
		(Adjacent LB LF)
		(Adjacent LF MF)
		(Adjacent MF UF)
		
		(Adjacent UF BAR)
		(Adjacent UB UF)
		(Adjacent MB UB)
		(Adjacent LB MB)
		(Adjacent LF LB)
		(Adjacent MF LF)
		(Adjacent UF MF)
		
		;; Agent starts at BAR
		(At Agent BAR)

		;; Empty glass at BAR
		(At G BAR)
		(not (ContainsBeer G)) ;; Not necessary, but good to be explicit

		;; Customer C is not served
		(not (Served C)) ;; Not necessary, but good to be explicit

		;; Customer C is at LB
		(At C LB)
    )
    
    (:goal (
        Served C
    ))
)