(define (domain Domain1)

    (:requirements :strips)

    (:predicates
        (TRUCK ?t) (LOCATION ?l) (BOX ?b)
        (conn ?l1 ?l2)
        (boxat ?b ?l) (boxon ?b ?t)
        (truckat ?t ?l)
        (free ?t) (full ?t)
        (boxdown ?b)
    )

    (:action move
        :parameters (?truck ?from ?to)
        :precondition (and 
            (TRUCK ?truck) (LOCATION ?from) (LOCATION ?to)
            (truckat ?truck ?from) (conn ?from ?to)
        )
        :effect (and(truckat ?truck ?to) (not(truckat?truck ?from))
        )
    )
    
    (:action load
        :parameters (?truck ?load ?location)
        :precondition (and
            (TRUCK ?truck) (LOCATION ?location) (BOX ?load)
            (truckat ?truck ?location) (boxat ?load ?location)
            (free ?truck) (boxdown ?load)
        )
        :effect (and
            (not(free ?truck)) (not(boxat ?load ?location)) (full ?truck)
            (boxon ?load ?truck) (not(boxdown ?load))
        )
    )
    
    (:action unload
        :parameters (?truck ?load ?location)
        :precondition (and
            (TRUCK ?truck) (LOCATION ?location) (BOX ?load)
            (truckat ?truck ?location) (boxon ?load ?truck)
            (full ?truck)
        )
        :effect (and
            (not(full ?truck)) (not(boxon ?load ?truck)) 
            (free ?truck) (boxat ?load ?location) (boxdown ?load)
        )
    )

)