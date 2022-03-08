(define (domain Domain1)

    (:requirements :strips)

    (:predicates
        (ROBOT ?t) (LOCATION ?l) 
        (BOXHEAVY ?b) (BOXLIGHT ?b)
        (conn ?l1 ?l2)
        (boxat ?b ?l) (boxon ?b ?t)
        (robotat ?t ?l)
        (free1 ?t) (full1 ?t)
        (free2 ?t) (full2 ?t)
        (boxdown ?b)
    )

    (:action move
        :parameters (?robot ?from ?to)
        :precondition (and 
            (ROBOT ?robot) (LOCATION ?from) (LOCATION ?to)
            (robotat ?robot ?from) (conn ?from ?to)
        )
        :effect (and(robotat ?robot ?to) (not(robotat ?robot ?from))
        )
    )
    
    (:action load1
        :parameters (?robot ?load ?location)
        :precondition (and
            (ROBOT ?robot) (LOCATION ?location) (BOXLIGHT ?load)
            (robotat ?robot ?location) (boxat ?load ?location)
            (free1 ?robot) (boxdown ?load)
        )
        :effect (and
            (not(free1 ?robot)) (not(boxat ?load ?location)) (full1 ?robot)
            (boxon ?load ?robot) (not(boxdown ?load))
        )
    )
    
    (:action load2
        :parameters (?robot ?load ?location)
        :precondition (and
            (ROBOT ?robot) (LOCATION ?location) (BOXLIGHT ?load)
            (robotat ?robot ?location) (boxat ?load ?location)
            (free2 ?robot) (boxdown ?load)
        )
        :effect (and
            (not(free2 ?robot)) (not(boxat ?load ?location)) (full2 ?robot)
            (boxon ?load ?robot) (not(boxdown ?load))
        )
    )
    
    (:action loadheavy
        :parameters (?robot ?load ?location)
        :precondition (and
            (ROBOT ?robot) (LOCATION ?location) (BOXHEAVY ?load)
            (robotat ?robot ?location) (boxat ?load ?location)
            (free2 ?robot) (free1 ?robot) (boxdown ?load)
        )
        :effect (and
            (not(free2 ?robot)) (not(boxat ?load ?location)) (full2 ?robot)
            (not(free1 ?robot)) (boxon ?load ?robot) (not(boxdown ?load))
            (full1 ?robot)
        )
    )
    
    (:action unload1
        :parameters (?robot ?load ?location)
        :precondition (and
            (ROBOT ?robot) (LOCATION ?location) (BOXLIGHT ?load)
            (robotat ?robot ?location) (boxon ?load ?robot)
            (full1 ?robot)
        )
        :effect (and
            (not(full1 ?robot)) (not(boxon ?load ?robot)) 
            (free1 ?robot) (boxat ?load ?location) (boxdown ?load)
        )
    )
    
    (:action unload2
        :parameters (?robot ?load ?location)
        :precondition (and
            (ROBOT ?robot) (LOCATION ?location) (BOXLIGHT ?load)
            (robotat ?robot ?location) (boxon ?load ?robot)
            (full2 ?robot)
        )
        :effect (and
            (not(full2 ?robot)) (not(boxon ?load ?robot)) 
            (free2 ?robot) (boxat ?load ?location) (boxdown ?load)
        )
    )
    
    (:action unloadheavy
        :parameters (?robot ?load ?location)
        :precondition (and
            (ROBOT ?robot) (LOCATION ?location) (BOXHEAVY ?load)
            (robotat ?robot ?location) (boxon ?load ?robot)
            (full2 ?robot)
        )
        :effect (and
            (not(full2 ?robot)) (not(full1 ?robot)) (not(boxon ?load ?robot)) 
            (free1 ?robot) (free2 ?robot) (boxat ?load ?location) 
            (boxdown ?load)
        )
    )
    
)