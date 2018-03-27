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
        B - broom
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

        ;; Unserved customer at LB
        ;; Customer C is not served
        (not (Served C)) ;; Not necessary, but good to be explicit
        ;; Customer C is at LB
        (At C LB)

        ;; Empty glass at BAR
        (At G BAR)
        (not (ContainsBeer G)) ;; Not necessary, but good to be explicit
    
        ;; Broom at BAR
        (At B BAR)

        ;; Broken glass MF, MB
        (ContainsBrokenGlass MF)
        (ContainsBrokenGlass MB)
    )
    
    (:goal (and
        (Served C)
        (At Agent BAR)

        (not (ContainsBrokenGlass UF))
        (not (ContainsBrokenGlass UB))
        (not (ContainsBrokenGlass MB))
        (not (ContainsBrokenGlass LB))
        (not (ContainsBrokenGlass LF))
        (not (ContainsBrokenGlass MF))
    ))
)