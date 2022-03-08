(define (problem Problem1)


    (:domain Domain1)
    
    (:objects   loc1 loc2 loc3 loc4 loc5
                truck1 truck2
                box1 box2 box3 box4 box5 box6
    )
    
    (:init  (TRUCK truck1) (TRUCK truck2)
    
            (BOX box1) (BOX box2) (BOX box3) 
            (BOX box4) (BOX box5) (BOX box6)
            
            (LOCATION loc1) (LOCATION loc2) (LOCATION loc3) 
            (LOCATION loc4) (LOCATION loc5)
            
            (box_at box1 loc1) (heavy box1)
            (box_at box2 loc1) (heavy box2)
            (box_at box3 loc1) (light box3)
            (box_at box4 loc2) (light box4)
            (box_at box5 loc3) (light box5)
            (box_at box6 loc4) (light box6)
            
            (truck_at truck1 loc4) (free_1 truck1) (free_2 truck1)
            (truck_at truck2 loc4) (free_1 truck2) (free_2 truck2)
            
            (conn loc1 loc2) (conn loc2 loc3) (conn loc3 loc4) (conn loc4 loc5)
            (conn loc2 loc1) (conn loc3 loc2) (conn loc4 loc3) (conn loc5 loc4)
    
    )
    
    (:goal  (and    (box_at box1 loc5)
                    (box_at box2 loc5)
                    (box_at box3 loc5)
                    (box_at box4 loc5)
                    (box_at box5 loc5)
                    (box_at box6 loc5)
            )
    )
)