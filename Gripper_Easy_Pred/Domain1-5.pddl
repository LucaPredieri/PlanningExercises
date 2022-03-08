(define (domain Domain1)

    (:requirements :strips)

    (:predicates
        (ROBOT ?t) (LOCATION ?l) (BOX ?b)
        (conn ?l1 ?l2)
        (boxat ?b ?l) 
        (boxon ?b ?t)
        (robotat ?t ?l)
        (free ?t) 
        (boxdown ?b)
    )

    (:action move
        :parameters (?robot ?from ?to)
        :precondition (and 
            (ROBOT ?robot) (LOCATION ?from) (LOCATION ?to)
            (robotat ?robot ?from) (conn ?from ?to)
        )
        :effect (and(robotat ?robot ?to) (not(robotat?robot ?from))
        )
    )
    
    (:action load
        :parameters (?robot ?load ?location)
        :precondition (and
            (ROBOT ?robot) (LOCATION ?location) (BOX ?load)
            (robotat ?robot ?location) (boxat ?load ?location)
            (free ?robot) (boxdown ?load)
        )
        :effect (and
            (not(free ?robot)) (not(boxat ?load ?location))
            (boxon ?load ?robot) (not(boxdown ?load))
        )
    )
    
    (:action unload
        :parameters (?robot ?load ?location)
        :precondition (and
            (ROBOT ?robot) (LOCATION ?location) (BOX ?load)
            (robotat ?robot ?location) (boxon ?load ?robot)
        )
        :effect (and
            (not(boxon ?load ?robot)) 
            (free ?robot) (boxat ?load ?location) (boxdown ?load)
        )
    )

)