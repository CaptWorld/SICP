# Exercise 1.13

**Claim:** $\text{Fib}(n) = \dfrac{\phi^n - \psi^n}{\sqrt{5}}$, where $\phi = \dfrac{1+\sqrt{5}}{2}$, $\psi = \dfrac{1-\sqrt{5}}{2}$

## Proof by strong induction

**Base cases:**

- $\text{Fib}(0) = 0 = \dfrac{\phi^0 - \psi^0}{\sqrt{5}}$ ✓

- $\text{Fib}(1) = 1$, verify: $\dfrac{\phi^1 - \psi^1}{\sqrt{5}} = \dfrac{\dfrac{1+\sqrt{5}}{2} - \dfrac{1-\sqrt{5}}{2}}{\sqrt{5}} = \dfrac{\sqrt{5}}{\sqrt{5}} = 1$ ✓

**Inductive step:** Assume true for $n-1$ and $n-2$:

$$
\begin{align*}
\text{Fib}(n) &= \text{Fib}(n-1) + \text{Fib}(n-2) && \text{(by definition)} \\
&= \frac{\phi^{n-1} - \psi^{n-1}}{\sqrt{5}} + \frac{\phi^{n-2} - \psi^{n-2}}{\sqrt{5}} && \text{(inductive hypothesis)} \\
&= \frac{\phi^{n-2}(\phi+1) - \psi^{n-2}(\psi+1)}{\sqrt{5}} && \text{(factoring)} \\
&= \frac{\phi^{n-2} \cdot \phi^2 - \psi^{n-2} \cdot \psi^2}{\sqrt{5}} && \because\ \phi+1=\phi^2,\ \psi+1=\psi^2 \\
&= \frac{\phi^n - \psi^n}{\sqrt{5}} && \square
\end{align*}
$$