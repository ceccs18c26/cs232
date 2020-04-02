#!/usr/bin/perl
#use strict nd use warings are used to prevent from implicitly creating global variables
use strict;
use warnings;

print "~~~~~Simple Calculator~~~~~\n";
print "Enter the two numbers and the operator to get the result:\n";
print "<Ctrl>-D to Terminate \n\n"; 

#my keyword defines the variable as a local variable 
my @val = <STDIN>;

#chomp keyword removes new line from the input 
chomp(@val);
 
my $result;
if ($val[-1] eq "+") { $result = $val[0] + $val[1]; }
if ($val[-1] eq "-") { $result = $val[0] - $val[1]; }
if ($val[-1] eq "*") { $result = $val[0] * $val[1]; }
if ($val[-1] eq "/") {
    if ($val[1] == 0) {
        print "\nCannot divide by 0\n";
        $result = "ERROR";
    } else {
        $result = $val[0] / $val[1];
    }
}
 
print "\nResult of $val[0] $val[-1] $val[1] = $result\n";

