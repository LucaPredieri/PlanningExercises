(define (problem Problem1)


    (:domain Domain1)
    
    (:objects   
        l1 l2 l3 l4 l5
        truck1 truck2
        box1 box2 box3 box4
    )
    
    (:init  
        (TRUCK truck1) (TRUCK truck2)
        
        (BOX box1) (BOX box2) 
        (BOX box3) (BOX box4)
            
        (LOCATION l1) (LOCATION l2) (LOCATION l3) 
        (LOCATION l4) (LOCATION l5)
            
        (boxat box1 l1) (boxat box2 l2)
        (boxat box3 l3) (boxat box4 l4)
        
        (boxdown box1) (boxdown box2)
        (boxdown box3) (boxdown box4)
        
        (truckat truck1 l1) (free truck1)
        (truckat truck2 l1) (free truck2)
        
        (conn l1 l2) (conn l2 l3) (conn l3 l4) (conn l4 l5)
        (conn l2 l1) (conn l3 l2) (conn l4 l3) (conn l5 l4)
    
    )
    
    (:goal (and 
        (boxat box1 l5) (boxat box2 l5)
        (boxat box3 l5) (boxat box4 l5)
        (boxdown box1) (boxdown box2)
        (boxdown box3) (boxdown box4))
    )
)