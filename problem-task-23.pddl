(define (problem bar-23) ;; Replace XX with task number
    (:domain bartending)
    (:objects
        UF - location
        UB - location
        MB - location
        LB - location
        LF - location
        MF - location
        
        G1 - glass
        G2 - glass
        
        C1 - customer
        C2 - customer
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
        
        ;; Agent starts at MF
        (At Agent MF)
        
        ;; Empty glass at MB
        (At G1 MB)
        (not (ContainsBeer G1)) ;; Not necessary, but good to be explicit
        
        ;; Empty glass at LB
        (At G2 LB)
        (not (ContainsBeer G2)) ;; Not necessary, but good to be explicit
        
        ;; Two customers, one at UB, one at LF
        (At C1 UB)
        (At C2 LF)
    )
    
    (:goal (and
    
        ;; goal is that both customers are served,
        (Served C1)
        (Served C2)
        
        ;; and the agent is at the BAR
        (At Agent BAR)
    ))
)