#!/bin/sh
echo "Installing gensimd, gensimd/simd, gensimd/simd/sse2"
go install ./simd/sse2 ./simd
go generate
go install

echo "Running simd_example"
cd examples/simd_example
rm -f *.s
go generate
go build
./simd_example
rm -f *.s
go clean
cd ../..

echo "Running sse2_example"
cd examples/sse2_example
rm -f *.s
go generate
go build
./sse2_example
rm -f *.s
go clean
cd ../..

echo "Running distsq"
cd examples/distsq
rm -f *.s
go generate
go build
./distsq
rm -f *.s
rm -f distsq_simd_proto.go
go clean
cd ../../


echo "Running reg_spill1"
cd examples/reg_spill1
rm -f *.s
go generate
go build
./reg_spill1
rm -f *.s
rm -f reg_spill1_simd_proto.go
go clean
cd ../../

echo "Running reg_spill2"
cd examples/reg_spill2
rm -f *.s
go generate
go build
./reg_spill2
rm -f *.s
rm -f reg_spill2_simd_proto.go
go clean
cd ../../


echo "Running reg_spill3"
cd examples/reg_spill3
rm -f *.s
go generate
go build
./reg_spill3
rm -f *.s
rm -f reg_spill3_simd_proto.go
go clean
cd ../../
