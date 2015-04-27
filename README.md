# unionvalue

Allows easy creation of immutable union values, a.k.a. sum-types.

You can think of them as enums (enumerated types) that can also contain other data.
 
Example:

```
APICallResult = UnionValue.new(:success, :failure, :timeout)
APICallResult.failure.is_failure? #=> true
APICallResult.timeout.is_success? #=> false
APICallResult.success(12345).data #=> 12345
```

Normal classes with attributes act as 'product' types. In other words, their number of possible values are the product of the number of possible values of all their attributes. Sum-types are instead just the sum of their attributes values. In other words, they can have this attributes OR this other attribute, but not both.

Read more about sum-types here: https://en.wikipedia.org/wiki/Sum_type

## Copyright

Copyright (c) 2015 Axis Sivitz. See LICENSE.txt for
further details.

