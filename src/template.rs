extern mod std;

mod module;
mod nested_module {
    mod submodule;
}

use io::println;
use module::greeter;
use nested_module::submodule::world;

use expound = io::println;
use doorman = module::greeter;
use le_monde = nested_module::submodule::world;

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
    // Explict paths
    io::println(module::greeter(nested_module::submodule::world()));

    // Implict paths -- made possible by use statements
    println(greeter(world()));

    // Renamed -- made possible by use .. = statements
    expound(doorman(le_monde()));
}
