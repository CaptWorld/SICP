## Exercise 1.19

Let $(a', b')$ and $(a'', b'')$ be the pairs after applying the transformation $T_{pq}$ once and twice respectively on pair $(a, b)$, So,

$$a' = bq + (q + p)a \tag{1}$$
$$b' = bp + aq \tag{2}$$
$$a'' = b'q + (q + p)a' \tag{3}$$
$$b'' = b'p + a'q \tag{4}$$

We need to find appropriate $(p', q')$ after applying the transformation just once on $(a, b)$ pair so that it's equivalent to applying the transformation twice with $(p, q)$ and $(a, b)$ pair,

First, let's look at equation (4),

$$
\begin{align*}
b'' &= (bp + aq)p + (bq + (q + p)a)q && \text{(using (1) and (2))} \\
&= b(p^2 + q^2) + a(pq + q^2 + pq) && \text{(factoring)} \\
&= b(p^2 + q^2) + a(2pq + q^2) && \text{(using arithmetic)} \\
&= bp' + aq'
\end{align*}
$$

where,
$$\boxed{p' = p^2 + q^2}$$
$$\boxed{q' = 2pq + q^2}$$

Let's see if this deduction holds by checking equation (3),
$$
\begin{align*}
a'' &= (bp + aq)q + (q + p)(bq + (q + p)a) && \text{(using (1) and (2))} \\
&= b(pq + q^2 + pq) + a(q^2 + (p + q)^2) && \text{(factoring)} \\
&= b(2pq + q^2) + a((q^2 + 2pq) + (p^2 + q^2)) && \text{(using arithmetic)} \\
&= bq' + (q' + p')a
\end{align*}
$$

where,
$$\boxed{q' = 2pq + q^2}$$
$$\boxed{p' = p^2 + q^2}$$

This confirms that $p'$ and $q'$ holds.