p = 2^32+15
R = GF(p)[x]
a = x^16 + 2206327570*x^15 + 764008823*x^14 + 2624308288*x^13 + 584210452*x^12 + 2859245580*x^11 + 2161247258*x^10 + 2475621239*x^9 + 2679079*x^8 + 3262843933*x^7 + 3126742286*x^6 + 2840770970*x^5 + 2798946498*x^4 + 1178619281*x^3 + 124682568*x^2 + 150251198*x + 1469826103
S.<y> = R.quotient(a)
g = y
flag = "REDACTED"
assert len(FLAG)==32
for _ in range(int(flag.encode().hex(),16)):
    g = sum(c*(y^2+1)^n for n,c in enumerate(g))
print(f"{p = }")
print(f"{a = }")
print(f"{g = }")
print(f"FLAG = grey{{{flag}}}")

'''
p = 4294967311
a = x^16 + 2206327570*x^15 + 764008823*x^14 + 2624308288*x^13 + 584210452*x^12 + 2859245580*x^11 + 2161247258*x^10 + 2475621239*x^9 + 2679079*x^8 + 3262843933*x^7 + 3126742286*x^6 + 2840770970*x^5 + 2798946498*x^4 + 1178619281*x^3 + 124682568*x^2 + 150251198*x + 1469826103
g = 4213081404*y^15 + 3296429821*y^14 + 4211675621*y^13 + 1980847685*y^12 + 1112259653*y^11 + 330484598*y^10 + 23881381*y^9 + 2112413024*y^8 + 2815876074*y^7 + 4197415602*y^6 + 3078141258*y^5 + 4163495398*y^4 + 4121679949*y^3 + 2775737979*y^2 + 1590517927*y + 1223073206
FLAG = grey{REDACTED}
'''
