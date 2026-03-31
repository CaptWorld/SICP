## Exercise 1.26

Partial call tree for `(expmod 4 8 8)`:

```mermaid
graph TD
    A["expmod 4 8 8"] --> B["expmod 4 4 8"]
    A --> C["expmod 4 4 8"]
    B --> D["expmod 4 2 8"]
    B --> E["expmod 4 2 8"]
    C --> F["expmod 4 2 8"]
    C --> G["expmod 4 2 8"]
    D --> H["expmod 4 1 8"]
    D --> I["expmod 4 1 8"]
    E --> J["expmod 4 1 8"]
    E --> K["expmod 4 1 8"]
    F --> L["expmod 4 1 8"]
    F --> M["expmod 4 1 8"]
    G --> N["expmod 4 1 8"]
    G --> O["expmod 4 1 8"]
    H --> P["expmod 4 0 8"]
    I --> Q["expmod 4 0 8"]
    J --> R["expmod 4 0 8"]
    K --> S["expmod 4 0 8"]
    L --> T["expmod 4 0 8"]
    M --> U["expmod 4 0 8"]
    N --> V["expmod 4 0 8"]
    O --> W["expmod 4 0 8"]
```

For `(expmod base exp m)`, total number of nodes is,
$1 + 2 + 4 + 8 + ... + 2 ^ n = 2 ^ {n+1} - 1$, where n is the total number of levels.

Total number of levels is when the nth level's exp becomes 1, i.e.
$$exp / (2 ^ n) = 1$$
$$n = log_2{exp}$$

So, total number of nodes is,
$$2 ^ {log_2(exp) + 1} - 1$$
$$2 * exp - 1$$

**Order of growth:**
- Space: $\theta(log(exp))$ — maximum depth of the tree is $log(exp)$
- Time: $\theta(exp)$ — each node spawn 2 more nodes
