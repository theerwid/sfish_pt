
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(27501);
 script_version ("$Revision: 1.5 $");
 script_name(english: "SuSE Security Update:  xsp security update (xsp-1320)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch xsp-1320");
 script_set_attribute(attribute: "description", value: "Insufficient path checks allowed to access arbitrary files
via relative path names in the HTTP request. The affected
code is used by mod_mono.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Install the security patch xsp-1320");
script_end_attributes();

script_summary(english: "Check for the xsp-1320 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"xsp-1.1.13.7-4", release:"SUSE10.1") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");
