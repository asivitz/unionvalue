= unionvalue

Allows easy creation of immutable union values, a.k.a. sum-types.
 
Example:

APICallResult = UnionValue.new(:success, :failure, :timeout)
APICallResult.failure.is_failure? #=> true
APICallResult.timeout.is_success? #=> false
APICallResult.success(12345).data #=> 12345

Read more about sum-types here: https://en.wikipedia.org/wiki/Sum_type

== Copyright

Copyright (c) 2015 Axis Sivitz. See LICENSE.txt for
further details.

