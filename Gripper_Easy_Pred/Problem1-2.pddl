(define (problem Problem1)

    (:domain Domain1)
    
    (:objects   
        r1 r2 r3 r4
        robot
        box1 box2 box3 box4
    )
    
    (:init  
        (ROBOT robot)
        
        (BOX box1) (BOX box2)
        (BOX box3) (BOX box4)
        
        (LOCATION r1) (LOCATION r2)
        (LOCATION r3) (LOCATION r4)
            
        (boxat box1 r2) (boxat box2 r2)
        (boxat box3 r3) (boxat box4 r3)
        
        (boxdown box1) (boxdown box2)
        (boxdown box3) (boxdown box4)
    
        (robotat robot r1) (free robot)
        
        (conn r1 r2) (conn r2 r3) (conn r3 r4)
        (conn r2 r1) (conn r3 r2) (conn r4 r3)
    
    )
    
    (:goal (and 
        (boxat box1 r4) (boxat box2 r4)
        (boxat box3 r4) (boxat box4 r4)
        (boxdown box1) (boxdown box2)
        (boxdown box3) (boxdown box4))
    )
)