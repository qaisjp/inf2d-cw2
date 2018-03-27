(define (domain bartending)
    (:requirements :adl )
    
    (:types
        bartender
        location
        customer
        glass
        ;; Fill in additional types here
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - bartender
        BAR - location
    )
    
    (:predicates
        ;; Example:
        ;; (Contains ?x - object ?c - container)
        (HoldingGlass ?a - bartender ?g - glass)
        (HoldingSomething ?a - bartender)
        (Adjacent ?a - location ?b - location)
        (ContainsBeer ?g - glass)
        (Served ?c - customer)
        (At ?o - object ?l - location)
    )
    
    ;;;; Action Template - Delete and fill in own actions ;;;;
    
    ;(:action dummy-action
    ;    :parameters (?obj - object)
    ;    :precondition (and
    ;        (dummy-pred-1 ?obj)
    ;        (dummy-pred-2 ?obj)
    ;    )
    ;    :effect (and
    ;        (not (dummy-pred-1 ?obj))
    ;        (dummy-pred-3 ?obj)
    ;    )
    ;)
    
    (:action PICK-UP
        :parameters (?a - bartender ?l - location ?g - glass)
        :precondition (and
            (not (HoldingSomething ?a))
            (At ?a ?l)
            (At ?g ?l)
        )
        :effect (and
            (HoldingSomething ?a)
            (HoldingGlass ?a ?g)
            (not (At ?g ?l))
        )
    )
    
    (:action HAND-OVER
        :parameters (?a - bartender ?l - location ?g - glass ?c - customer)
        :precondition (and
            (HoldingGlass ?a ?g)
            (At ?a ?l)
            (At ?c ?l)
            (ContainsBeer ?g)
        )
        :effect (and
            (not (HoldingGlass ?a ?g))
            (not (HoldingSomething ?a))
            (Served ?c)
        )
    )
    
    (:action POUR
        :parameters (?a - bartender ?g - glass)
        :precondition (and
            (HoldingGlass ?a ?g)
            (not (ContainsBeer ?g))
            (At ?a BAR)
        )
        :effect (ContainsBeer ?g)
    )
    
    (:action MOVE
        :parameters (?a - bartender ?from - location ?to - location)
        :precondition (and
            (At ?a ?from)
            (not (= ?from ?to))
            (Adjacent ?from ?to)
        )
        :effect (and
            (not (At ?a ?from))
            (At ?a ?to)
        )
    )
)
























