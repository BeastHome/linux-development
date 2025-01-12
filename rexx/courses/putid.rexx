/* Rexx edit macro PUTID (lab 16) */
Address ISREDIT                       /* switch to ISPF Edit HCE     */
'MACRO'                               /* this is an ISPF Edit MACRO  */
'(mem) = member'                      /* get member name             */
line = '/* Rexx exec' mem '*/'        /* build comment line          */
'LINE_AFTER 0 = "'line'"'             /* add comment line to member  */
Exit 0