use strict;
use ExtUtils::MakeMaker;
use FileHandle;

check_version();
check_cpan();

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'      => 'Sledge',
    'VERSION_FROM' => 'lib/Sledge.pm', # finds $VERSION
    'EXE_FILES'  => [ 'bin/sledge-setup' ],
);

sub check_cpan {
    my $handle  = FileHandle->new("eg/prereq-modules");
    my @modules = map { chomp; [ split / / ] } $handle->getlines;
    my @missing = _check_missing(@modules);
    if (@missing) {
	warn sprintf <<WARN, join("\n", map { my($mod, $version) = @$_; "  $mod $version" } @missing);

You may need following CPAN modules to make Sledge work.

%s

Try executing eg/cpan_install.pl as root, before installation.

WARN
	;
	sleep 3;
    }
}

sub _check_missing {
    my @modules = @_;
    return grep {
	my($module, $required) = ref $_ ? @$_ : ($_, '');
	printf STDERR "checking %-30s ... ", "$module $required";
	eval "require $module";
	no strict 'refs';
	printf STDERR "%5s\n",
	    $@ ? "[no]" : ${"$module\::VERSION"};
	$@ or ($required && ${"$module\::VERSION"} < $required);
    } @modules;
}

sub check_version {
    my $current_version;
    eval {
	require Sledge;
	$current_version = Sledge->VERSION;
    };

    require "lib/Sledge.pm";
    if ($current_version && $current_version < $Sledge::VERSION) {
	warn <<WARN;

NOTE: This server already has Sledge $current_version installed.

Are you sure upgrading it to $Sledge::VERSION?
See Changes for details of what has been changed since $current_version.

WARN
    ;
	sleep 1;
    }
}
