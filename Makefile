all:
	bundle exec ruby -I"lib:test" test/monad_test.rb test/maybe_test.rb
