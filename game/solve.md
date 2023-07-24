# Misc 2 - Game

> Gambling is not good ;D
> 
> - mechfrog88
>
> Files: [main.py](main.py)

I don't think there's much to writeup on this, given that all 15 teams solved it. This was a gambling game where you're given the payoff matrix and have 10000 rounds to win a certain amount. There was no source code provided or anything, so it's not clear how the opponent played, other than saying it wouldn't use your current input.

But my approach was to find the Nash equilibrium, so it didn't matter what the opponent played. This turns out to have a positive expected payoff.

I found a [random script](https://code.activestate.com/recipes/496825-game-theory-payoff-matrix-solver/) to calculate an approximation of this. It was written in python 2, but after converting it to python 3 it just worked on the first go.

The only other real consideration was batching up the sends into groups of 100 to minimise latency.

Anyway, here's the script in full:

```py
import numpy as np
from operator import add, neg

def solve(payoff_matrix, iterations=100000):
    'Return the oddments (mixed strategy ratios) for a given payoff matrix'
    transpose = list(zip(*payoff_matrix))
    numrows = len(payoff_matrix)
    numcols = len(transpose)
    row_cum_payoff = [0] * numrows
    col_cum_payoff = [0] * numcols
    colpos = range(numcols)
    rowpos = list(map(neg, range(numrows)))
    colcnt = [0] * numcols
    rowcnt = [0] * numrows
    active = 0
    for i in range(iterations):
        rowcnt[active] += 1        
        col_cum_payoff = list(map(add, payoff_matrix[active], col_cum_payoff))
        active = min(zip(col_cum_payoff, colpos))[1]
        colcnt[active] += 1       
        row_cum_payoff = list(map(add, transpose[active], row_cum_payoff))
        #print(len(row_cum_payoff), len(rowpos))
        active = -max(zip(row_cum_payoff, rowpos))[1]
    value_of_game = (max(row_cum_payoff) + min(col_cum_payoff)) / 2.0 / iterations
    return rowcnt, colcnt, value_of_game

from pwn import *
sh = remote('34.124.157.94', 19500)
sh.readuntil(b'payoff = ')
payoff = np.array(eval(sh.readline()))

sh.readuntil(b'?')

a,b,c = solve(payoff)
sampler = [y for i,x in enumerate(a) for y in [i]*x]


for _ in range(100):
    for _ in range(100):
        t = random.sample(sampler,1)[0]
        sh.sendline(str(t).encode())

    for _ in range(100):
        moo = sh.readuntil((b'grey{', b'?')).decode()
        print(moo)
        if 'grey{' in moo:
            print(sh.readline())
```