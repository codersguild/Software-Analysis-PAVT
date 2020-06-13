# dafny-examples
Microsoft Research -- Dafny Examples &amp; Codes. 

1. Induction is a way to prove things that are defined recursively.
-- Base case, we show that either for 1 or 0 / starting cases some
property is true.
-- For some k th case we show that if we assume P(k) is true, P(k+1) is true
-- From this we may conclude that P(n) holds for all n in our domain.

Videos :

Simple Inductions :
https://www.youtube.com/watch?v=m_91KWQiC0o&list=PLA72M-qSGPm3Bnkc6iKGxrL1OARztbm6V

Tree Data Structure Induction :
https://www.youtube.com/watch?v=Fy8cNMuk_rY&list=PLA72M-qSGPm3HZbcRLVOSpxELUHtdaNpt

Natural Deductions :
https://www.youtube.com/watch?v=v2i59XRceXE&list=PLA72M-qSGPm2ohvwvJVbd3abnaSkiBy8j

2. Bounded Model Checking : We model the problem like a Finite State
Machine. An execution of a FSM is a string formed by simulating the
state-to-state transitions. We ask if a certain property holds for the FSM
globally or eventually when we move from say State S1 to S2. The model is
bounded in the sense that we consider a finite number of states but an
have infinite number of executions or traces possible.

Turing Machine, As an extension to FSM.
https://www.youtube.com/watch?v=QOcxbzopSk4&list=PLA72M-qSGPm27TjJaMOsNcMnLUoYAO9ZT

Model Checking :
https://www.youtube.com/watch?v=piISG8bV2GI&list=PLJ5C_6qdAvBGojQMUzL4x5Y0N5gBJmT4l

How we model and define properties :
https://www.youtube.com/watch?v=8wI5ee3Lwsw&list=PLJ5C_6qdAvBGojQMUzL4x5Y0N5gBJmT4l&index=13

LTL, this logic theory is needed to model temporal properties or state
transitions where the property depends on time / or on the next state of
execution. As in the case of an FSM,
we need to check if property holds from state to state.

https://www.youtube.com/watch?v=W5Q0DL9plns&list=PLJ5C_6qdAvBGojQMUzL4x5Y0N5gBJmT4l&index=33

For properties that need a set of set of traces to define and prove
correctness, we need hyper-properties.
https://www.youtube.com/watch?v=JZ5OWdX3hmY

3. Hoare Logic : To understand how specifications and invariants work.
https://www.youtube.com/watch?v=kjxdelbo9C4&list=PLA72M-qSGPm2bZlhxYB-ePerW0U8nPn4H

Dafny Examples :
Binary Search Verification in Dafny :
https://www.youtube.com/watch?v=-_tx3lk7yn4
