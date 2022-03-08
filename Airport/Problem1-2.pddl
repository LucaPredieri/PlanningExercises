(define (problem Problem1)

    (:domain Domain1)
    
    (:objects
        agent
        house airport1 airport2
        car airplane
    )
    
    (:init  
        (AGENT agent)
        
        (LOCATION house) (LOCATION airport1) (LOCATION airport2)
        (AIRPLANE airplane) (CAR car)
        
        (ground_conn house airport1)
        (sky_conn airport1 airport2)
        
        (notonairplane agent airplane)
        (notoncar agent car)
        
        (agentat agent house)
        (carat car house)
        (airplaneat airplane airport1)
    )
    
    (:goal (and 
        (agentat agent airport2)
    ))
    
)