(define (domain Domain1)

    (:requirements :strips)

    (:predicates
        (AGENT ?t) (LOCATION ?l)
        (AIRPLANE ?a)
        (CAR ?c)
        (ground_conn ?l1 ?l2)
        (sky_conn ?l1 ?l2)
        (agentat ?a ?l)
        (carat ?c ?l)
        (airplaneat ?a ?l)
        (notonairplane ?a ?air)
        (notoncar ?a ?c)
        (oncar ?a ?car)
        (onairplane ?a ?air)
    )

    (:action getonthecar
        :parameters (?agent ?car ?location ?airplane)
        :precondition (and 
            (AGENT ?agent) (CAR ?car)  (AIRPLANE ?airplane) (LOCATION ?location)
            (carat ?car ?location) 
            (agentat ?agent ?location)
            (notonairplane ?agent ?airplane) (notoncar ?agent ?car)
        )
        :effect (and
            (oncar ?agent ?car) (not(notoncar ?agent ?car))
            (not(agentat ?agent ?location))
        )
    )
    
    (:action ridingcar
        :parameters (?car ?from ?to ?agent)
        :precondition (and
            (AGENT ?agent) (CAR ?car) 
            (oncar ?agent ?car) 
            (carat ?car ?from) 
            (ground_conn ?from ?to)
        )
        :effect (and
            (carat ?car ?to)
            (not(carat ?car ?from))
        )
    )
    
    (:action getoffthecar
        :parameters (?agent ?car ?location)
        :precondition (and 
            (AGENT ?agent) (CAR ?car) (oncar ?agent ?car) (LOCATION ?location)
            (carat ?car ?location) (oncar ?agent ?car)
        )
        :effect (and
            (not(oncar ?agent ?car))
            (agentat ?agent ?location)
            (notoncar ?agent ?car)
        )
    )
    
    (:action getontheairplane
        :parameters (?airplane ?agent ?location ?car)
        :precondition (and
            (AGENT ?agent) (CAR ?car)  (AIRPLANE ?airplane)
            (airplaneat ?airplane ?location) (agentat ?agent ?location)
            (notonairplane ?agent ?airplane) (notoncar ?agent ?car)
        )
        :effect (and
            (onairplane ?agent ?airplane) 
            (not(notonairplane ?agent ?airplane))
            (not(agentat ?agent ?location))
        )
    )
    
    (:action flyingairplane
        :parameters (?agent ?airplane ?from ?to)
        :precondition (and
            (AGENT ?agent) (AIRPLANE ?airplane) (LOCATION ?from) (LOCATION ?to) 
            (onairplane ?agent ?airplane) 
            (airplaneat ?airplane ?from) 
            (sky_conn ?from ?to)
        )
        :effect (and
            (airplaneat ?airplane ?to) 
            (not(airplaneat ?agent ?from))
        )
    )
    
    (:action getofftheairplane
        :parameters (?agent ?airplane ?location)
        :precondition (and 
            (AGENT ?agent) (AIRPLANE ?airplane) (LOCATION ?location)
            (onairplane ?agent ?airplane) (airplaneat ?airplane ?location)
        )
        :effect (and
            (notonairplane ?agent ?airplane)
            (agentat ?agent ?location)
            (not(onairplane ?agent ?airplane))
        )
    )
    
)