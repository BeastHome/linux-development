/* REXX (Lab 11.4 'CONS') */
address TSO                              /* set TSO environment */
call OUTTRAP 'cons.'                     /* trap cmd output to cons */
'CONSPROF'                               /* current console profile */
call OUTTRAP 'OFF'                       /* stop trapping cmd output */
parse var cons.1 . cons.1                /* save CONSPROF settings */
'CONSPROF SOLDISPLAY(NO) SOLNUM(200)'    /* set new cons profile */
'CONSOLE ACTIVATE'                       /* become specified console */
address CONSOLE                          /* set CONSOLE environment */
'CART WTS01'                             /* set first CART */
'DISPLAY ASM'                            /* execute operator command */
'CART WTS02'                             /* set next CART */
'DISPLAY IPLINFO'                        /* execute operator command */
'CART WTS03'                             /* set third CART */
'DISPLAY TS,'Userid()                    /* execute operator command */
x = getmsg('reca.','SOL','WTS01',,60)    /* get msgs from 1st cmd */
x = getmsg('reci.','SOL','WTS02',,60)    /* get msgs from 2nd cmd */
x = getmsg('rect.','SOL','WTS03',,60)    /* get msgs from 3rd cmd */
address TSO                              /* switch back to TSO env */
'CONSOLE DEACTIVATE'                     /* turn off console mode */
time = subword(reca.1,2,1)               /* extract time of day */
say "The current time is" time           /* display time of day */
parse var reci.2 . . . ipltime . ipldate .  /* get IPL time & date */
say "The system was last IPLed at" ipltime "on" ipldate  /* IPL T/D */
parse var reca.3 . plpapct . . plpadsn .    /* get PLPA info */
say "The PLPA data set," plpadsn", is" plpapct "full."   /* PLPA */
parse var rect.4 userid .                   /* get userid */
parse var rect.4 '=' asid ' '               /* get address space id */
                                            /* get cpu + logon time */
parse var rect.5 'CT=' cputime 'S' 'ET=' hrs '.' min '.' sec .
if sec = '' then                            /* user logged on < 1h */
   parse var rect.5 'ET=' et 'S'            /*   get logon time */
say userid "is running in address Space ID" asid"," /* say it */
if sec \= '' then                           /* user logged on > 1 hr */
   do
      say "and has been logged on for" hrs "hours," min "minutes, and"
      say sec "seconds, using" cputime "CPU seconds."    /* say it   */
   end
else
   do
      say "and has been logged on for" et "seconds,"     /* < 1 hr   */
      say "using" cputime "CPU seconds."                 /* say it   */
   end
'CONSPROF' cons.1                           /* reset console profile */
exit 0