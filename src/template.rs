extern mod std;

mod module;
mod nested_module {
    mod submodule;
}

#[test]
fn test_testing() {
    assert( 1 == 1 );
}

#[test]
#[should_fail]
fn test_failing() {
    assert( 1 == 2 );
}

fn main() {
    io::println(module::greeter(nested_module::submodule::world()));
}
