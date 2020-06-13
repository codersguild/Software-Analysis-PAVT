
 - What are formal verification, formal method and formal modeling? What
is the difference/relation among them?

Formal Method is a set of techniques and methodology that helps us in
doing formal verification. Formal Verification is a way of defining a
concrete / abstract overview of a problem or model and then answering some
questions regarding the properties of that model. We try to prove certain
assertions and check for validity. Eg. Given a program does it ever happen
that some variables take negative values. Does a model access a particular
array element while execution. Some of the validations or proves might
seem NP-Complete but these things are solved in finite amount of time and
resources for most of the practical problems that we try solving. You can
however provide specific inputs that make the problem hard to solve/non
halting.

- What is formal verification methods? Is it same as formal verification
itself?

Formal Verification is a way of proving theorems, assertions and checking
validations for a given problem/program/model, we try to prove the
correctness or come up with logical deductions as to why some cases are
incorrect Eg. Giving a counter example that some paths in a program are
never taken. First comes the formal specification part, where we try to
find what are the things we are interested in proving, what properties do
we want to work with and shoe validations. After that we devise a way to
algorithmically show that such validations or methods of proving works and
we halt at a sat/unsat answer. Formal Method is a set of techniques and
methodology that helps us in doing formal verification like Induction,
Bounded Model Checking etc. The second part is to coming up with a model
that emulates the problem. What ever we prove for the problem is same for
the model and vice versa.

https://en.wikipedia.org/wiki/Formal_verification

SAT Solvers.
https://www.youtube.com/watch?v=x2XtpCn0-bM

- Difference between formal and semi-formal verification?
- Difference between formal modeling and semi-formal modeling?

Both questions are similar in nature. In formal methods we try to simulate
or execute all paths and check all possibilities. In real world these
become problematic due to path explosion, there is an exponential blow up
in the number of ways or paths that we need to investigate to do a
full-fledged analysis. Semi-formal methods are used to overcome this path
explosion problem, we try to come up with ways to simulate or check on
smaller number of possibilities. There are corner cases that can be missed
but in most practical scenarios, the domain is very unlikely to occur, so
in-effect we are able to prove or deduce fairly everything about the
problem but exploring much lesser paths/ possibilities. Eg. Loop
unrolling, How many loops to simulate for a given problem? We dont execute
infinitely many times. We look for fixed points/ violations to invariants.
Have a look at KLEE & Dart

https://en.wikipedia.org/wiki/Symbolic_execution
https://web.eecs.umich.edu/~weimerw/2011-6610/reading/p213-godefroid.pdf

- Is there any word 'semi-formal *methods*' also (as formal methods)?

Yes, I hope the above answer clears that. But usually not used in the
context we usually think about it.

- What method of FV are we planning to use? Why is it chosen?
    - from the resources i have got in google, i have noted FV methods as
model checking, theorem proving, propositional logic - This is
correct.

Yes, we are using something similar initially and then moving to
hyper-property based proving. We are using it since hyper-property can
simulate / prove certain secure flow information related properties, like
integrity of smart contracts. We can discuss this in details during some
meeting.

- What are observational determinism properties?

Have a look at this doc, I have tried explaining the proposal in a easier
way.
Please don't share since it is still a draft and I need to add many more
things in it.

https://docs.google.com/document/d/1WGtWX93p4oNefj8B3vypywTcJazMviFbaUXufzHu8k4/edit


