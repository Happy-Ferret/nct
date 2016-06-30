=============
 nct
=============

---------------------------------------------------------
Menu driven tool to configure build settings of a project
---------------------------------------------------------

:Date:   30 Jun 2016
:Version: 0.2.1
:Manual section: 1
:Manual group: nCrux Configuration Tool


SYNOPSIS
========

nct [nomenu] [-m|--mode {update|alldef|allno|allyes|random}] [-c|--config config_file] [-i|--input config_input_file] [-p|--prefix prefix_str]

nct {menu|menu-n|menu-g|menu-q} [-c|--config config_file] [-i|--input config_input_file] [-p|--prefix prefix_str]

nct gen [-c|--config config_file] [-o|--output output_file] [-p|--prefix prefix_str]

nct merge [-c|--config config_file] [-f|--fragment fragment_config_file] [-p|--prefix prefix_str]

nct help


DESCRIPTION
===========
This tool is based on kconfig tool available as part of standard Linux kernel sources. This project makes kconfig standalone and usable in any project leveraging intuitive menu based configuration. In addition to that, this tool can generate source code in various high level languages like C, Go, Python, PHP, Perl, JavaScript etc to make the configuration parameters readily usable in terms of key/value pairs. The configuration file can be directly included in a Makefile to achieve conditional compilation. The configuration file can also be included in bash shell script as is. This tool also supports "merge" command to merge partial configuration file into a base configuration file. The nCrux Make Tool (nmt) tool is a great companion with this tool to make the build system ridiculously simple.

OPTIONS
=======
nomenu	Display no interactive menu and generate or update configuration file based on mode specified.

menu    Start terminal based menu (classic)

menu-n  Start terminal based menu (new)

menu-g  Start gtk based menu

menu-q  Start Qt based menu

gen     Generate source code

merge   Merge given configuration fragment into base configuration file.

help	Display command usage information.

-m mode_str, --mode mode_str
 This option is valid only for "nomenu" sub-command. Following are the modes supported. The mode "alldef" is assumed if this option is not given.

  **update**	Keep the existing configuration intact and select defaults for new configuration elements.

  **alldef**	Disregard existing configuration and select all default values for each configuration element.

  **allno**	Disregard existing configuration and deselect all boolean and tristate configuration elements.

  **allyes**	Disregard existing configuration and select all boolean and tristate configuration elements.

  **random**	Disregard existing configuration and randomly select boolean and tristate configuration elements.

-c config_file, --config config_file
 File containing current selection of configuration settings. The file ".conf" is assumed if this option is not given. In case if user saves the modified settings, this file gets overwritten with new settings.

-i config_input_file, --input config_input_file
 Top level configuration input file used for menu interface. The file "input.nct" is assumed if this option is not given.

-f fragment_config_file, --fragment fragment_config_file
 File containing partial configuration settings that need to be merged into main configuration file provided with option "-c".

-p prefix_str, --prefix prefix_str
 Prefix to be used for each configuration variable. Default is "NCT_".

-o output_file, --output output_file
 File to which generated output needs to be written. File extension of output_file is recognized and appropriate code is generated. Recognized file extensions are:

  **h**		C source header file

  **xml**	XML file

  **pl**	Perl source file

  **py**	Python source file

  **go**	Golang source file

  **php**	PHP source file

  **rb**	Ruby source file

  **js**	JavaScript source file

-h, --help
  Display this command usage.

EXAMPLES
========
Update existing configuration file ".conf", if available, by retaining existing configuration
 settings and selecting defaults for any new settings:

	nct
	(or)
	nct -m update

Overwrite existing configuration file ".conf" with all default values selected for all configuration
elements::

	nct -m alldef

Retain existing configuration of file ".conf" and select default values for all new configuration element::

	nct
	(or)
	nct -m update

Overwrite existing configuration file ".conf" with all random values selected for all configuration
elements::

	nct -m random

Load configuration settings from .conf file if present and display ncurses-based
menu based on default configuration input file "input.nct" and write the
changes back to .conf file::

	nct menu

Display ncurses based newer menu, read and write configuration changes to simple.conf::

	nct menu-n -c simple.conf

Display Gtk based menu using configuration input file "simple.nct", read and write configuration changes to ".conf"::

	nct menu-g -i simple.nct

Display Qt based menu using input file "simple.nct", read and write configuration changes to simple.conf::

	nct menu-q -c simple.conf -i simple.nct

Generate C header file based on configuration settings read from ".conf"::

	nct gen -o simple.h

Generate XML file based on configuration settings read from simple.conf::

	nct gen -c simple.conf -o simple.xml

Generate Perl source file based on configuration settings read from ".conf"::

	nct gen -o simple.pl

Generate Python source file based on configuration settings read from ".conf"::

	nct gen -o simple.py

Generate Golang source file based on configuration settings read from ".conf"::

	nct gen -o simple.go

Generate PHP source file based on configuration settings read from simple.conf::

	nct gen -c simple.conf -o simple.php

Generate Ruby source file based on configuration settings read from ".conf"::

	nct gen -o simple.rb

Generate JavaScript source file based on configuration settings read from ".conf"::

	nct gen -o simple.js

Merge configuration fragments present in other-feature.conf into ".conf"::

	nct merge -f other-feature.conf

Merge configuration fragments present in other-feature.conf into "simple.conf"::

	nct merge -c simple.conf -f other-feature.conf

SEE ALSO
========

nmt(1)

HOMEPAGE
========
More information about nct project can be found at <http://www.ncrux.com/project/nct/>

AUTHORS
=======
nct package is developed by nCrux <http://www.ncrux.com/>.

This documentation is done by Aditi <aditi@ncrux.com>.

REPORTING BUGS
==============
You can report bugs at <https://github.com/ncrux/nct/issues>

COPYRIGHT
=========
Copyright © 2016 nCrux. 
License: GNU GPL version 2.
This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.


