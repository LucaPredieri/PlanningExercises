(define (domain Domain1)

    (:requirements
        :strips
    )

    (:predicates
        (TRUCK ?t) (LOCATION ?l) (BOX ?b)
        
        (conn ?l1 ?l2)
        (box_at ?b ?l) (truck_at ?t ?l)
        
        (light ?b) (heavy ?b)
        (box_on_truck ?b ?t)
        
        (free_1 ?t) (free_2 ?t)
        (full_1 ?t) (full_2 ?t)
    )

    (:action move
        :parameters (?t ?l1 ?l2)
        
        :precondition   (and    (TRUCK ?t) (LOCATION ?l1) (LOCATION ?l2)
                                (conn ?l1 ?l2)
                                (truck_at ?t ?l1)
                        )
                        
        :effect (and    (not (truck_at ?t ?l1)) 
                        (truck_at ?t ?l2)
                )
    )
    
    (:action load_heavy
        :parameters (?t ?b ?l)
        
        :precondition   (and    (TRUCK ?t) (BOX ?b) (LOCATION ?l)
                                (truck_at ?t ?l) (box_at ?b ?l)
                                (heavy ?b)
                                (free_1 ?t) (free_2 ?t)
                        )
                        
        :effect (and    (not (free_1 ?t)) (not (free_2 ?t))
                        (full_1 ?t) (full_2 ?t)
                        (not (box_at ?b ?l))
                        (box_on_truck ?b ?t)
                )
    )
    
    (:action unload_heavy
        :parameters (?t ?b ?l)
        
        :precondition   (and    (TRUCK ?t) (BOX ?b) (LOCATION ?l)
                                (truck_at ?t ?l) 
                                (full_1 ?t) (full_2 ?t)
                                (heavy ?b)
                                (box_on_truck ?b ?t)
                        )
                        
        :effect (and    (free_1 ?t) (free_2 ?t)
                        (not(full_1 ?t)) (not(full_2 ?t))
                        (box_at ?b ?l)
                        (not (box_on_truck ?b ?t))
                )
    )
    
    
    (:action load_light_1
        :parameters (?t ?b ?l)
        
        :precondition   (and    (TRUCK ?t) (BOX ?b) (LOCATION ?l)
                                (truck_at ?t ?l) (box_at ?b ?l)
                                (light ?b)
                                (free_1 ?t) (free_2 ?t)
                        )
                        
        :effect (and    (not (free_1 ?t)) (full_1 ?t)
                        (not (box_at ?b ?l))
                        (box_on_truck ?b ?t)
                )
    )
    
    (:action unload_light_1
        :parameters (?t ?b ?l)
        
        :precondition   (and    (TRUCK ?t) (BOX ?b) (LOCATION ?l)
                                (truck_at ?t ?l) 
                                (free_2 ?t) (full_1 ?t)
                                (light ?b)
                                (box_on_truck ?b ?t)
                        )
                        
        :effect (and    (free_1 ?t) (not(full_1 ?t))
                        (box_at ?b ?l)
                        (not (box_on_truck ?b ?t))
                )
    )
    
    (:action load_light_2
        :parameters (?t ?b ?l)
        
        :precondition   (and    (TRUCK ?t) (BOX ?b) (LOCATION ?l)
                                (truck_at ?t ?l) (box_at ?b ?l)
                                (light ?b)
                                (free_2 ?t) (full_1 ?t)
                                (box_on_truck ?b ?t)
                        )
                        
        :effect (and    (not (free_2 ?t)) (full_2 ?t)
                        (not (box_at ?b ?l))
                        (box_on_truck ?b ?t)
                )
    )
    
    (:action unload_light_2
        :parameters (?t ?b1 ?b2 ?l)
        
        :precondition   (and    (TRUCK ?t) (BOX ?b1) (BOX ?b2) (LOCATION ?l)
                                (truck_at ?t ?l) (full_1 ?t) (full_2 ?t)
                                (light ?b1)
                                (light ?b2)
                                (box_on_truck ?b1 ?t)
                                (box_on_truck ?b2 ?t)
                        )
                        
        :effect (and    (free_1 ?t) (free_2 ?t) 
                        (not(full_1 ?t)) (not(full_2 ?t)) 
                        (box_at ?b1 ?l) 
                        (box_at ?b2 ?l) 
                        (not (box_on_truck ?b1 ?t))
                        (not (box_on_truck ?b2 ?t))
                )
    )
)