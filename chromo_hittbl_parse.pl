#!/usr/bin/perl

#unitig_1        8       Brachypodium    5
#unitig_1        25      Oryza   1
#PacienteXXX           GO:99999999            8
#PacienteYYY           GO:99999999           35


while(<>){
    chomp;
    @_=split /\t/;
    @{$index{$_[0]}{$_[1]}} = $_[2];
    undef $gos{$_[1]};
}

print "Paciente\t";
print join("\t",sort(keys(%gos)));
print "\n";
foreach $paciente (sort keys %index){
    print "$paciente";
    foreach $go (sort(keys(%gos))){
	if($index{$paciente}{$go}[0]){
	    print "\t$index{$paciente}{$go}[0]";
	}
	else{
	    print "\t0";
	}
    }
    print "\n";
}
