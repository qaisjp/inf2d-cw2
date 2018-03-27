(define (domain bartending)
    (:requirements :adl )
    
    (:types
        bartender
        location
        customer
        glass
        broom
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
        (HoldingSomething ?a - bartender)
        (Adjacent ?a - location ?b - location)
        (ContainsBeer ?g - glass)
        (Served ?c - customer)
        (At ?o - object ?l - location)

        (ContainsBrokenGlass ?l - location)
        (HoldingObject ?a - bartender ?bg - object)
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
        :parameters (?a - bartender ?l - location ?bg - object)
        :precondition (and
            (not (HoldingSomething ?a))
            (At ?a ?l)
            (At ?bg ?l)
        )
        :effect (and
            (HoldingSomething ?a)
            (HoldingObject ?a ?bg)
        )
    )

    (:action PUT-DOWN
        :parameters (?a - bartender ?l - location ?bg - object)
        :precondition (and
            (HoldingObject ?a ?bg)
        )
        :effect (and
            (not (HoldingSomething ?a))
            (not (HoldingObject ?a ?bg))
        )
    )

    (:action SWEEP-UP
        :parameters (?a - bartender ?from - location ?target - location ?b - broom)
        :precondition (and
            (HoldingObject ?a ?b)
            (ContainsBrokenGlass ?target)
            (At ?a ?from)
            (Adjacent ?from ?target)
        )
        :effect (and
            (not (ContainsBrokenGlass ?target))
        )
    )
    
    (:action HAND-OVER
        :parameters (?a - bartender ?l - location ?g - glass ?c - customer)
        :precondition (and
            (HoldingObject ?a ?g)
            (At ?a ?l)
            (At ?c ?l)
            (ContainsBeer ?g)
        )
        :effect (and
            (not (HoldingObject ?a ?g))
            (not (HoldingSomething ?a))
            (Served ?c)
        )
    )
    
    (:action POUR
        :parameters (?a - bartender ?g - glass)
        :precondition (and
            (HoldingObject ?a ?g)
            (not (ContainsBeer ?g))
        )
        :effect (ContainsBeer ?g)
    )
    
    (:action MOVE
        :parameters (?a - bartender ?from - location ?to - location)
        :precondition (and
            (At ?a ?from)
            (not (= ?from ?to))
            (Adjacent ?from ?to)
            (not (ContainsBrokenGlass ?to))
        )
        :effect (and
            (not (At ?a ?from))
            (At ?a ?to)
        )
    )
)
























