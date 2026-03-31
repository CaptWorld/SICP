#lang sicp

#|

  In ideal computers, there would be no issues on correctness side. But because of limited storage,
  We might see (fast-exp base exp) going out of supported range or takes longer to calculate as its
  value can blow up for large n

|#