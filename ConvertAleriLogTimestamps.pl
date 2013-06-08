#! /usr/bin/perl -w

use strict;
use warnings;

use DateTime;

open(my $logFile, "<", "AleriLogExample.log") 
	or die "cannot open < AleriLogExample.log: $!";
	
my $count = 0;
my $startTime;
my $logTimeStamp;
while (<$logFile>) 
{
    chomp;
    my @array = split(/ /);
    if ($count eq 0)
    {
    	#2013-05-15 21:04:03
    	$startTime = $array[10] . " " . $array[11];
    	print "Log started at = $startTime\n";
    	
    	$logTimeStamp = DateTime->new(
    									year => substr ($startTime, 0, 4),
    									month => substr ($startTime, 5, 2),
    									day => substr ($startTime, 8, 2),
    									hour => substr ($startTime, 11, 2),
    									minute => substr ($startTime, 14, 2),
    									second => substr ($startTime, 17, 2)
    								);
    	#print "log timestamp = $logTimeStamp\n";
    	
    }
    elsif ($count > 15) #The first 16 lines are details regarding license etc, nothing useful..
    {
    	if ($array[1])
    	{
    		my $timeStamp = $array[1];
    		chop $timeStamp;
    		$timeStamp = substr $timeStamp, 1;
    		
    		#need to copy the values, not the reference. 
    		#print "About to clone $logTimeStamp";
    		my $tempTimeStamp = $logTimeStamp->clone();
    		
    		
    		my $duration = DateTime::Duration->new( seconds => $timeStamp );
    		$tempTimeStamp->add($duration);
    		
    		print "$logTimeStamp + $timeStamp = $tempTimeStamp\n";
    	}

    }
    $count++;
    #print "$_";
}	
	