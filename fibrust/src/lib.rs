#![no_std]
extern crate libc;
use libc::c_int;

#[no_mangle]
pub extern fn add(lhs: c_int, rhs: c_int) -> c_int {
    lhs + rhs
}

#[no_mangle]
pub extern fn fib(n: c_int) -> c_int {
    match n {
        0 => 0,
        1 => 1,
        _ => fib(n - 1) + fib(n - 2),
    }
}
