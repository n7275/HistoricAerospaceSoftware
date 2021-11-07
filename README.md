# HistoricAerospaceSoftware
A collection of NASA (and others) public domain software, much of which is for early mainframes like the IBM360 and 7090/7074

The MIT license covers any of my own IBJOB or JCL demos of historic functions. All origional software is public domain, except where specified.

## Useful Tools

Richard Cornwell's BCD tape (IBM 7-track format) and punched card manipulation software.
https://github.com/rcornwell/I7000tools

Richard Cornwell's IBM 700/7000 series, and S/360 emulators, forked from the SIMH project.
https://github.com/rcornwell/sims

## Running Example Jobs on the IBM 7094

The included example jobs for the IBM 7094 must be loaded onto an input tape in order to run.
This is done with the above mentioned mkbcdtape which emulates the IBM 1401 software used to write card jobs onto tape.

mkbcdtape -o sysin.tp exampleJobOfYourChoice.job cards.job

This will produce the input tape. You can put multiple jobs on one tape by adding them in order as arguments to mkbcdtape, just make sure cards.job is the last one.

You can then run the simulator with ./I7090 runjobs.ini

When the first pause message displays, enter 'c' or "continue" into the console, and press ENTER. The system will run the jobs, and after it has finished it will return to IBSYS.
Enter 'c' and press ENTER again to finish, and when the system prompts again, enter 'q', and press ENTER to quit.

You can then see your output using:

listtape -l sysou1.tp > yourOutputFile.txt


Useful documentation: https://bitsavers.computerhistory.org/pdf/ibm/7094/

## Complete List of Software
|Program	|Language	|Source							|Year	|
|:---		|:---		|:---							|:----:	|	
|ALAIES   |FORTRAN IV	|MSC INTERNAL NOTE NO. 68-FM-40       |1968	|
|ALEFEM   |FORTRAN IV	|MSC INTERNAL NOTE NO. 68-FM-40       |1968	|
|ALCSBT   |FORTRAN IV	|MSC INTERNAL NOTE NO. 68-FM-40       |1968	|
|HANGLE		|FORTRAN IV	|MSC INTERNAL NOTE NO. 68-FM-53				|1968	|
