n = 6;

share[n] preshare(private k) {
	share[n] x;
	x[n - 1] = k;
    for (i = 0; i <= n - 2; i = i + 1){
        random r;
        x[i] = r;
        x[n - 1] = x[n - 1] ^ r;
    }
    return x;
}

internal[n] XOR(internal[n] a, internal[n] b) {
	internal[n] res;
	int i;
  	for (i = 0; i <= n - 1; i = i + 1) {
  		res[i] = a[i] ^ b[i];
  	}
  	return res;
}

internal[6] compression(internal[6] a, internal[6] b) {
    random r05;
    random r03;
    random r01;
    #i = 1; j = 0 - 3
    random r15;
    random r13;
    #i = 2; j = 0 - 2
    random r25;
    random r23;
    #i = 3; j = 0 - 1
    random r35;
    #i = 4; j = 0 - 0
    random r45;

    #j = 4, 2
    random r4;
    random r2;

    #i = 0, 1, 2, 3, 4, 5
    #i = 0;
    internal c0 = a[0] * b[0];
    #j = 5, 3;
    #j = 5;
    internal t05 = r05 ^ a[0] * b[5] ^ a[5] * b[0] ^ r4 ^ a[0] * b[4] ^ a[4] * b[0];
    #j = 3;
    internal t03 = r03 ^ a[0] * b[3] ^ a[3] * b[0] ^ r2 ^ a[0] * b[2] ^ a[2] * b[0];
    internal t01 = r01 ^ a[0] * b[1] ^ a[1] * b[0];

    #i = 1;
    internal c1 = a[1] * b[1];
    #j = 5, 3;
    #j = 5;
    internal t15 = r15 ^ a[1] * b[5] ^ a[5] * b[1] ^ r4 ^ a[1] * b[4] ^ a[4] * b[1];
    #j = 3;
    internal t13 = r13 ^ a[1] * b[3] ^ a[3] * b[1] ^ r2 ^ a[1] * b[2] ^ a[2] * b[1];
    c1 = c1 ^ r01;

    #i = 2;
    internal c2 = a[2] * b[2];
    #j = 5
    internal t25 = r25 ^ a[2] * b[5] ^ a[5] * b[2] ^ r4 ^ a[2] * b[4] ^ a[4] * b[2];
    internal t23 = r23 ^ a[2] * b[3] ^ a[3] * b[2];

    #i = 3;
    internal c3 = a[3] * b[3];
    #j = 5;
    internal t35 = r35 ^ a[3] * b[5] ^ a[5] * b[3] ^ r4 ^ a[3] * b[4] ^ a[4] * b[3];
    c3 = c3 ^ r23;
    c3 = c3 ^ r13;
    c3 = c3 ^ r03;

    #i = 4;
    internal c4 = a[4] * b[4];
    internal t45 = r45 ^ a[4] * b[5] ^ a[5] * b[4];

    #i = 5;
    internal c5 = a[5] * b[5];
    #j = 4 - 0
    c5 = c5 ^ r45;
    c5 = c5 ^ r35;
    c5 = c5 ^ r25;
    c5 = c5 ^ r15;
    c5 = c5 ^ r05;

    internal[6] res;
    res[0] = c0;
    res[1] = c1;
    res[2] = c2;
    res[3] = c3;
    res[4] = c4;
    res[5] = c5;

    return res;
}

internal[n] example(share[n] a, share[n] b) {
    internal[n] z;
    z = XOR(a, b);
    internal[n] c;
    #c = SecMult(z, a);
    c = compression(z, a);
    return c;
}



internal[n] main(private k1, private k2) {
    internal[n] x;
    x = preshare(k1);
    internal[n] y;
    y = preshare(k2);
    internal[n] z;
    z = example(x, y);
    return z;
}