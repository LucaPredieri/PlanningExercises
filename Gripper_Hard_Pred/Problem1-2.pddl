(define (problem Problem1)


    (:domain Domain1)
    
    (:objects   
        r1 r2 r3 r4
        robot
        boxlight1 boxlight2 boxheavy1 boxheavy2
    )
    
    (:init  
        (ROBOT robot)
        
        (BOXHEAVY boxheavy1) (BOXLIGHT boxlight1) 
        (BOXHEAVY boxheavy2) (BOXLIGHT boxlight2)
            
        (LOCATION r1) (LOCATION r2)
        (LOCATION r3) (LOCATION r4)
            
        (boxat boxheavy1 r2) (boxat boxlight1 r2)
        (boxat boxheavy2 r3) (boxat boxlight2 r3)
        
        (boxdown boxheavy1) (boxdown boxheavy2)
        (boxdown boxlight1) (boxdown boxlight2)
        
        (robotat robot r1) (free1 robot) (free2 robot)
        
        (conn r1 r2) (conn r2 r3) (conn r3 r4)
        (conn r2 r1) (conn r3 r2) (conn r4 r3)
    
    )
    
    (:goal (and 
        (boxat boxheavy1 r4) (boxat boxlight1 r4)
        (boxat boxheavy2 r4) (boxat boxlight2 r4)
        (boxdown boxheavy1) (boxdown boxlight1)
        (boxdown boxheavy2) (boxdown boxlight2))
    )
)