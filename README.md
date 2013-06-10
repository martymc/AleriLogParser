AleriLogParser
==============

Usage: perl ConvertAleriLogTimestamps.pl inputFileName.log outputFileName.log

Description: Takes an Aleri log file and works out the correct dateTime stamp from the starttime + seconds since start and applies it to the new logfile. 

eg: 
[SP-06-114000] (0.036) sp(16692) Platform(ln7p4818apx)::Platform(): Created Platform.

becomes:
2013-05-15T21:04:03 [SP-06-114000] (0.036) sp(16692) Platform(ln7p4818apx)::Platform(): Created Platform.
