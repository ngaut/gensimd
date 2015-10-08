// +build !simd

//go:generate gensimd

package main

import "github.com/bjwbell/gensimd/simd"

func simd_loop2(v4 []int, idx int) {
	var tmp int
	var ret int
	var tmp2 simd.Int4
	var tmp3 simd.Int4
	tmp = 4
	x := v4[idx]
	y := v4[idx+1]
	for i := 0; i < 10; i++ {
		if i == 5 {
			break
		}
		tmp = x*3 + 6*y
	}
	if tmp == 4 {
		ret = 1
	}
	if tmp2[0] == 0 {
		ret = 0
	}
	v4[0] = ret
	tmp3 = [4]int{1, 1, 2, 3}
	tmp2 = tmp3
	return //ret
}
