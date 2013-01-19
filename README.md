#Basic project template for Rust 0.5

##To customize the template:

1. Change the product name in the Makefile
2. Rename src/template.rs to the new name
3. Change at least the name in the license file

##Makefile targets:

- all: makes and runs the tests, then makes and runs the app
- clean: Deletes the whole bin directory
- run: makes and runs just the app, skipping the tests
- test: makes and runs just the tests

(These targets were taken from Steve Klabnik's Rust for Rubyists ebook: http://www.rustforrubyists.com)

##Notes:

- The warning about copying non-implicitly copyable types has been disabled in the Makefile. 
Owned pointers to strings (~str) aren't currently implicitly copyable, but are the most well supported string
type. (https://github.com/mozilla/rust/issues/2770)


##Possible TODOS:

- Research crates and replace template.rs with template.rc
- Add a library template 
