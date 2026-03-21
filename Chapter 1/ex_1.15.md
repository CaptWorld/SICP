## Exercise 1.15

### Part 1
$$\frac{12}{3^n} <= 0.1$$
$$120 <= 3^n$$
$$log_{3}120 <= n$$
$$4.35 <= n$$
$$n = 5$$

### Part 2
$$\frac{a}{3^n} <= 0.1$$
$$10*a <= 3^n$$
$$log_{3}(10 * a) <= n$$
$$log_3{10} + log_3(a) <= n$$
$$k_1 + k_2 * log(a) <= n$$
$$k_3 * log(a) <= n$$

**Order of growth:**
- Time and Space complexity: $\theta(\log{a})$