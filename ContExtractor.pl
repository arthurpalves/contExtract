#!/usr/bin/perl -w

#######################################################################################
#
#								ContExtractor.pl
#
#######################################################################################
#
#	PERL script to extract contacts from email accounts (Hotmail, Gmail, Yahoo,
#	AOL, etc), checking valids and invalids logins.
#
#======================================================================================
#
#	CREATED IN
#	==========
#
#	Jun 25, 2012
#	Arthur Alves < arthuralves.p@gmail.com >
#
#-------------------------------------------
#
#	LAST MODIFIED
#	=============
#
#	Jun 25, 2012
#	Arthur Alves < arthuralves.p@gmail.com >
#
#######################################################################################



use strict;
use WWW::Contact;
use Data::Dumper;

my $inputFile = $ARGV[0];
die "Missing argument: Input File\n" unless $inputFile;
die "$inputFile does not exists\n" unless -e $inputFile;

my $contactHandle = WWW::Contact->new;

mkdir "Contacts", 0755 or die "Unable to create folder in the current directory\n" unless -e "Contacts";
open VALIDS, "> Contacts/valids.txt" or die "Unable to create and open valids.txt in the directory /Contacts\n";
open INVALIDS, "> Contacts/invalids.txt" or die "Unable to create and open invalids.txt in the directory /Contacts\n";
open IN_FILE, "< $inputFile" or die "Unable to open and read from $inputFile\n";
while(<IN_FILE>) {
  chomp;
  my ($email, $password) = split /;/;
  print "Processing $email\n";

  my @contacts = $contactHandle->get_contacts($email, $password);
  my $err = $contactHandle->errstr;
  if($err) {
    # invalid eMail or Password
    print INVALIDS "$email\n";
    next;
  }
  print VALIDS "$email\n";

  open ACC_FILE, "> Contacts/$email.txt";
  print ACC_FILE $_->{name} .";" .$_->{email} ."\n" for (@contacts);
  close ACC_FILE;
}

print "\n | Extraction completed!\n | valids.txt, invalids.txt and\n | .txt files for each valid login were created in ./Contacts\n";
close VALIDS;
close INVALIDS;
close IN_FILE;
