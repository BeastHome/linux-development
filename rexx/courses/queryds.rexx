/* Rexx exec QUERYDS (lab 17) */
Signal On Novalue                              /* set novalue trap   */
Signal On Error                                /* set error trap     */
Parse Upper Arg dsname                         /* get cmdline arg    */
Do While dsname = ''                           /* no cmdline arg?    */
   Say "Please enter a data set name:"         /* prompt user        */
   Parse Upper Pull dsname                     /* get dsname         */
End /* While */
listdsi_fc = Listdsi(dsname "SMSINFO DIRECTORY")    /* get the info  */
If listdsi_fc <= 4 Then                        /* function code <=4  */
   Do
      If listdsi_fc=4 Then                    /* listdsi func code=4 */
         Say "Some dataset information is unavailable" /* disclaimer */
      Say Left("Data set name",30,".") sysdsname       /* say info   */
      Say Left("Record format",30,".") sysrecfm        /*       |    */
      Say Left("Logical record length",30,".") syslrecl  /*     V    */
      Say Left("Last reference date",30,".") sysrefdate
      Say Left("Space units",30,".") sysunits
      Say Left("Allocated space",30,".") sysalloc sysunits
      Say Left("Allocation used",30,".") sysused sysunits
      Say Left("Primary allocation",30,".") sysprimary sysunits
      Say Left("Secondary allocation",30,".") sysseconds sysunits
      Say Left("Type of dataset (SMS)",30,".") sysdssms
      Say Left("Data set organization",30,".") sysdsorg
      Say Left("Data Class",30,".") sysdataclass
      Say Left("Management Class",30,".") sysmgmtclass
      Say Left("Storage Class",30,".") sysstorclass
      If sysdsorg = "PS" Then                 /* sequential data set? */
         Do                                   /* allocate dsn to ddn  */
            "ALLOC DD(QUERYDS) DSN('"sysdsname"') SHR REUSE"
            "EXECIO 10 DISKR QUERYDS (STEM line. FINIS"  /* read recs */
            Say "Listing first 10 lines of:" sysdsname
            Say ""
            Do i = 1 To line.0               /* list 1st ten lines    */
               Say Left(line.i,72)
            End i
            "FREE DD(QUERYDS)"               /* release allocation    */
         End /* Then Do sysdsorg = PS */
   End /* Then Do listdsi_fc <= 4 */
Else
   Do                                        /* listdsi failed,code>4 */
      Say "Function LISTDSI found a problem."
      Say "Function code:" listdsi_fc
      Say "Reason code:" sysreason           /* tell'em why           */
      Say "You entered:" dsname
      If sysreason=5 Then
         Say "Dataset not catalogued"
      If sysreason=1 Then
         Say "Error parsing function parameters."
      Say "LISTDSI Level 1 Message:"
      Say sysmsglvl1
      Say "LISTDSI Level 2 Message:"
      Say sysmsglvl2
   End /* of listdsi failed part */
Exit 0
Novalue:
Say "An uninitialized variable was encountered at line:" sigl
Say "The variable name is:" Condition('D')
Say "The source code statement at line" sigl "is:"
Say Sourceline(sigl)
Say "This exec will exit with return code 99."
Exit 99
Error:
Say "A non-zero return code was encountered at line:" sigl
Say "The return code value is:" rc
Say "The source code at line" sigl "is:"
Say Sourceline(sigl)
Exit rc