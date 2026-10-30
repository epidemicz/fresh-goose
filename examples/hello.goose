// hello.goose - the Fresh Goose pack's smoke-test example.
//
// Run it: goose run examples/hello.goose

/* A block comment, also exercised by the grammar. */

import std;

fn main() {
    let answer: i32 = 42;
    var count: u8 = 0;
    let mask = 0xFF;
    let banner = """
        hello, goose
        """;
    print(banner);
    print("answer=", answer, " mask=", mask);
    if answer == 42 {
        print("the answer");
    }
    for i in 3 {
        count += 1;
        print("for ", i, " count=", count);
    }
    let bang = '!';
    if bang == '!' {
        print("bang");
    }
    loop {
        count -= 1;
        if count == 0 {
            break;
        }
    }
    print("done");
}
