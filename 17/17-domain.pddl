(define (domain airport)

    (:requirements :strips)

    (:predicates
        (AGENT ?a)
        (LOCATION ?l)
        (at ?a ?l)
        (bridge-conn ?l1 ?l2)
        (road-conn ?l1 ?l2)
        (notvisited ?l)
        (visited ?l)
        (roaded ?a)
        (bridged ?a)
    )
    
    (:action move-bridge
        :parameters (?a ?from ?to)
        :precondition (and 
            (AGENT ?a) (LOCATION ?from) (LOCATION ?to)
            (at ?a ?from) (bridge-conn ?from ?to) (notvisited ?to)
            (roaded ?a))
        :effect (and 
            (at ?a ?to) (not(at ?a ?from)) (not(notvisited ?to)) (not(roaded ?a))
            (bridged ?a) (visited ?to))
    )
    
    (:action move-road
        :parameters (?a ?from ?to)
        :precondition (and 
            (AGENT ?a) (LOCATION ?from) (LOCATION ?to)
            (at ?a ?from) (notvisited ?to) (road-conn ?from ?to))
        :effect (and 
            (at ?a ?to) (not(at ?a ?from)) (not(notvisited ?to)) 
            (not(bridged ?a)) (roaded ?a) (visited ?to))
    )
)