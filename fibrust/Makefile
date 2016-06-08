fibrust.o_shipped: src/lib.rs Makefile Cargo.toml
	RUSTFLAGS="--emit=llvm-ir" cargo build --release --verbose
	llc-3.9 target/release/fibrust.ll -o fibrust.o_shipped -filetype=obj -code-model=kernel

#old
#fibrust.o_shipped: src/lib.rs Makefile Cargo.toml
#	RUSTFLAGS="--emit=obj,llvm-ir -C code-model=kernel -C relocation-model=pic" cargo build --release --verbose
#	cp target/release/fibrust.o ./fibrust.o_shipped

