## Exercise 1.15

Partial call tree for `(count-change 11)`:

```mermaid
graph TD
    A["cc 11 5"] --> B["cc 11 4"]
    A --> C["cc -39 5"]
    B --> D["cc 11 3"]
    B --> E["cc -14 4"]
    D --> F["cc 11 2"]
    D --> G["cc 1 3"]
    F --> H["cc 11 1"]
    F --> I["cc 6 2"]
    G --> J["cc 1 2"]
    G --> K["cc -9 3"]
    H --> L["cc 11 0"]
    H --> M["cc 10 1"]
    I --> N["cc 6 1"]
    I --> O["cc 1 2"]
    J --> P["cc 1 1"]
    J --> Q["cc -4 2"]
    M --> R["cc 10 0"]
    M --> S["cc 9 1"]
    N --> T["cc 6 0"]
    N --> U["cc 5 1"]
    O --> V["cc 1 1"]
    O --> W["cc -4 2"]

    C --> Z1[0]
    E --> Z2[0]
    L --> Z3[0]
    K --> Z4[0]
    Q --> Z5[0]
    R --> Z6[0]
    T --> Z7[0]
```

Full tree omitted — `cc amount 1` branches expand linearly to ~amount leaves.

**Order of growth:**
- Space: $\theta(n)$ — maximum depth of the tree is $n$ (reducing amount by 1 each step)
- Time: $\theta(n^k)$ — $k$ coin denominations each spawn a subtree of order $O(n^{k-1})$
