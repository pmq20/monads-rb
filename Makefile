all:
	ruby -I"lib" -I"/usr/local/lib/ruby/2.2.0" "/usr/local/lib/ruby/2.2.0/rake/rake_test_loader.rb" "test/*_test.rb"
