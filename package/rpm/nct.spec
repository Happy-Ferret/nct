Name:		nct
Version:	dummy
Release:	1
Summary:	Menu driven tool to configure build settings of a project

License:	GPLv2
URL:		http://www.ncrux.com/project/%{name}/
Group:		Development/Tools
#BuildRequires:	ncurses-devel
Source0:	%{name}-%{version}.tgz	
Packager:	Aditi <aditi@ncrux.com>

%define _rpmdir RPMS

%description
A tool to configure build settings of a project using menu driven interface and to generate corresponding source code to be used in languages like C, Go, Python, PHP, Perl etc. This tool is based on kconfig found in Linux kernel sources.

%prep:

%build:
make

%install:
#[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT
#make install DESTDIR=$RPM_BUILD_ROOT

%files
%defattr(-,root,root)
/*

%changelog

* Fri Jun 3 2016 Aditi
 - Avoid NCONFIG_ prefix in generated code
 - Initial support for fragment merging, misc changes
 - Minor changes related to default menu title
 - Added python code generator and test.py script
 - php, golang code generation, test programs included
 - Implemented top-level command, debianisation.
 - compiled conf, mconf, nconf. compile gconf only if glade.h is present.
 - import original sources of kconfig (kerel 4.5.4) into src directory
 - Initial commit
