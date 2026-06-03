#include <atom.h>

#define ARG	8

/*
 * swap variants
 *
 *	long	aswapl(Along *, long);
 *	void*	aswapp(Aptr *,  void *);
 */
TEXT aswapl(SB), 1, $-4
	MOVW	new+XLEN(FP), R9
	FENCE_RW
	AMOW(Amoswap, AQ|RL, 9, ARG, ARG)
	FENCE_RW
	RET

TEXT aswapp(SB), 1, $-4
	MOV	new+XLEN(FP), R9
	FENCE_RW
	AMOD(Amoswap, AQ|RL, 9, ARG, ARG)
	FENCE_RW
	RET

