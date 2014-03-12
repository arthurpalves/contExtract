perl-contExtract
================

  Perl-Contacts-Extractor


WHAT IT DOES?
=====================================================

1. Get logins and passwords in a .txt file, check valid and invalid accounts.
2. For each valid account, extract their contacts and put them in a .txt list created for each valid account.


USAGE
=====================================================

		---------------------------------------------------
		Windows -
		C:\Example\of\Path> perl ContExtractor.pl list.txt
		  <SCRIPTS PATH>  [PERL]   [SCRIPT]      <LIST>

			[THE SAME] | <CAN CHANGE>

		--------------------------------------------------
		Linux -
		~/ContExtractor$ ./ContExtractor.pl list.txt
		<SCRIPTS PATH>      [SCRIPT]       <LIST>

			[THE SAME] | <CAN CHANGE>

		---------------------------------------------------

NOTE: Perl is a native language in Linux, thus its not required to type "perl" before "./ContExtractor"


INPUT FILE CONTENT'S SAMPLE
=====================================================

    you@domain.com;passwd789
    hey@try.me;anotherpassword213
    eletronic@mail.com;abc123
  

AUTHOR
=====================================================

Arthur Alves < arthuralves.p@gmail.com >

Alves Development

DATE
=====================================================

June 25, 2012

Alagoas, Brazil
		
LICENSE
=====================================================

MIT License

