# Crypto 2 - OTP

> Wait this service is not complete yet
> 
> - mechfrog88
>
> Files: [main.py](main.py)

Ok, not the most interesting challenge, but you basically have an OTP otp[] which consists of six randomly-generated 16-bit values. You are able to submit a six-token vector tokens[], and you will be given the dot product of otp and tokens. As long as each token is between 32 bits and 1023 bits long or something. So we'll take powers of 10 to make the OTP appear directly, delimited by 0s.

```
p: ...
pub: ...

Welcome stranger, please insert your token to generate otp (6 integers separated by comma):
10000000000000000000000000000000000000000,10000000000000000000000000000000000,10000000000000000000000000000,10000000000000000000000,10000000000000000,10000000000
Generating OTP....
Token Hash: ...
OTP Hash: ...
Sending OTP....
538090323810118480148040501470089200000000000
Now insert your otp (6 integers separated by comma):
53809,32381,11848,14804,50147,08920
Welcome Admin! grey{Inner_Product_Funct1onal_3ncrypti0n_pNt8yBfwhz5ZNJzP}
```

The flag is `grey{Inner_Product_Funct1onal_3ncrypti0n_pNt8yBfwhz5ZNJzP}`.