all:
	#INFO: Cleaning up	 
	rm -rf erl_cra* rebar3_crashreport;
	rm -rf *~ */*~ */*/*~ */*/*/*~;
	#INFO: Deleting eunit test
	rm -rf logs;
	rm -rf test_ebin;
	rm -rf test.rebar;
	#INFO: Deleting tilde files and beams
	rm -rf apps/*/src/*.beam;
	rm -rf test/*.beam test/*/*.beam;
	rm -rf *.beam;
	#INFO: Deleting files and dirs created during builds
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock;
	#INFO: Compile application
	rm -rf common_include
	cp -r ~/erlang/simple_system/common_include .
	cp config/rebar.config .;
	rm -rf release;
	rebar3 compile;
	rm -rf _build*;
	rm -rf rebar.lock
	git status
	echo Ok there you go!
	#INFO: no_ebin_commit ENDED SUCCESSFUL
clean:
	#INFO: clean STARTED
	#INFO: Cleaning up	 
	rm -rf erl_cra* rebar3_crashreport;
	rm -rf *~ */*~ */*/*~ */*/*/*~;
	#INFO: Deleting eunit test
	rm -rf test_ebin;
	rm -rf rebar.config;
	#INFO: Deleting tilde files and beams
	rm -rf apps/*/src/*.beam;
	rm -rf test/*.beam test/*/*.beam;
	rm -rf *.beam;
	#INFO: Deleting files and dirs created during builds
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock
	#INFO: Compile application
	rm -rf common_include;
	rm -rf _build*;
	#INFO: clean ENDED SUCCESSFUL
eunit: 
	#INFO: eunit STARTED
	#INFO: Cleaning up	 
	rm -rf erl_cra* rebar3_crashreport;
	rm -rf *~ */*~ */*/*~ */*/*/*~;
	#INFO: Deleting eunit test
	rm -rf test_ebin;
	rm -rf rebar.config;
	#INFO: Deleting tilde files and beams
	rm -rf apps/*/src/*.beam;
	rm -rf test/*.beam test/*/*.beam;
	rm -rf *.beam;
	#INFO: Deleting files and dirs created during builds
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock
	#INFO: Creating eunit test code using test_ebin dir;
	mkdir test_ebin;
	cp test/test.rebar.config rebar.config;
	#rm test/dependent_apps.erl;
	#cp /home/joq62/erlang/dev_support/dependent_apps.erl test;
	erlc -I include -I /home/joq62/erlang/include -o test_ebin test/*.erl;
	#INFO: Creating Common applications needed for testing
	#INFO: Compile application
	rm -rf common_include;
	cp -r ~/erlang/simple_system/common_include .
	rebar3 compile;
	rebar3 release;
	#INFO: Starts the eunit testing .................
	erl -pa test_ebin\
	 -sname file_test\
	 -run $(m) start\
	 -setcookie a
