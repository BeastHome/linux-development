/*REXX*/
signal on syntax








Syntax:                                                                 
Say "An error was encountered trying to perform"                        
Say "arithmetic with the following values:"                             
Say ""                                                                  
Say value1 value2                                                           
Say ""                                                                  
Say "It is likely that one or both of"                                  
Say "these values are not decimal numbers."                             
Say "The error occurred on line number" sigl                            
Say "The source code at that line is:"                                  
Say ""                                                                  
Say Sourceline(sigl)                                                    
Say ""                                                                  
Say "This exec will exit with return code 99."                          
Exit 99    