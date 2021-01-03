## Formal Verification & Software Security : 

This repository contains many of the references & texts shared by my late research guide 
Dr. Pramod Subramanyan. He introduced me to formal verfication & software security. 

May his soul rest in peace. 

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
halting. Rest of the repository contains references shared by my current guide 
Dr. Subhajit Roy, from whom I have learned a lot and I guess I am still learning new things from him. 

Computer Security Intro : 
- https://www.microsoft.com/en-us/research/publication/practical-principles-for-computer-security/

Good Resource to program in Z3 
- https://theory.stanford.edu/~nikolaj/programmingz3.html#sec-using-solvers

## Some Methods & Basic Resources : 

1. Induction is a way to prove things that are defined recursively.
- Base case, we show that either for 1 or 0 / starting cases some property is true.
- For some k th case we show that if we assume P(k) is true, P(k+1) is true
- From this we may conclude that P(n) holds for all n in our domain.

Introduction Videos :

Simple Inductions :
- https://www.youtube.com/watch?v=m_91KWQiC0o&list=PLA72M-qSGPm3Bnkc6iKGxrL1OARztbm6V

Tree Data Structure Induction :
- https://www.youtube.com/watch?v=Fy8cNMuk_rY&list=PLA72M-qSGPm3HZbcRLVOSpxELUHtdaNpt

Natural Deductions :
- https://www.youtube.com/watch?v=v2i59XRceXE&list=PLA72M-qSGPm2ohvwvJVbd3abnaSkiBy8j

2. Bounded Model Checking : We model the problem like a Finite State
Machine. An execution of a FSM is a string formed by simulating the
state-to-state transitions. We ask if a certain property holds for the FSM
globally or eventually when we move from say State S1 to S2. The model is
bounded in the sense that we consider a finite number of states but an
have infinite number of executions or traces possible.

Turing Machine, As an extension to FSM.
- https://www.youtube.com/watch?v=QOcxbzopSk4&list=PLA72M-qSGPm27TjJaMOsNcMnLUoYAO9ZT

Model Checking :
- https://www.youtube.com/watch?v=piISG8bV2GI&list=PLJ5C_6qdAvBGojQMUzL4x5Y0N5gBJmT4l

How we model and define properties :
- https://www.youtube.com/watch?v=8wI5ee3Lwsw&list=PLJ5C_6qdAvBGojQMUzL4x5Y0N5gBJmT4l&index=13

LTL, this logic theory is needed to model temporal properties or state transitions where the property depends on time / or on the next state of
execution. As in the case of an FSM, we need to check if property holds from state to state.

- https://www.youtube.com/watch?v=W5Q0DL9plns&list=PLJ5C_6qdAvBGojQMUzL4x5Y0N5gBJmT4l&index=33

For properties that need a set of set of traces to define and prove correctness, we need hyper-properties.
- https://www.youtube.com/watch?v=JZ5OWdX3hmY

Hoare Logic : To understand how specifications and invariants work.
- https://www.youtube.com/watch?v=kjxdelbo9C4&list=PLA72M-qSGPm2bZlhxYB-ePerW0U8nPn4H

Binary Search Verification in Dafny :
- https://www.youtube.com/watch?v=-_tx3lk7yn4

Dafny PDF : 
- https://arxiv.org/pdf/1701.04481.pdf.

Calculus of Computation : 
- https://link.springer.com/book/10.1007/978-3-540-74113-8

Hyperproperties : 
- https://www.cs.cornell.edu/fbs/publications/Hyperproperties.pdf.

Hedra Formal Methods : 
- https://www.youtube.com/watch?v=6q15ytIOE3U

## Detailed Study : For Research Orientated Learning 

What is Computer Security ?

- https://www.microsoft.com/en-us/research/publication/practical-principles-for-computer-security/
- https://dl.acm.org/doi/pdf/10.1145/1592761.1592773

Propositional Natural Deductions : 
- https://www.youtube.com/watch?v=v2i59XRceXE&list=PLA72M-qSGPm2ohvwvJVbd3abnaSkiBy8j

First Order Natural Deductions : 
- https://www.youtube.com/watch?v=gggItiZ3Sjk&list=PLA72M-qSGPm1pISu85QR6bZL4wK4rZZxp

Hoare Logic Link : 
 - https://www.youtube.com/watch?v=t-Mj4ji3tCw&list=PLA72M-qSGPm2WxSxXthNiYx2u4KBZlXCC

Hoare Logic + Loops : 
- https://www.youtube.com/watch?v=kjxdelbo9C4&list=PLA72M-qSGPm2bZlhxYB-ePerW0U8nPn4H

Induction : 
- https://www.youtube.com/watch?v=m_91KWQiC0o&list=PLA72M-qSGPm3Bnkc6iKGxrL1OARztbm6V

Tree Induction : 
- https://www.youtube.com/watch?v=Fy8cNMuk_rY&list=PLA72M-qSGPm3HZbcRLVOSpxELUHtdaNpt

Model Checking - 1 : 
- https://www.youtube.com/watch?v=piISG8bV2GI&list=PLJ5C_6qdAvBGojQMUzL4x5Y0N5gBJmT4l

Model Chceking - 2 : 
- https://www.youtube.com/watch?v=KrWSK-UzCRc&list=PLnbFC0ntxiqdpoWwMKCVh6BRwBePHaqQx

Linear Temporal Logic : 
- https://www.youtube.com/watch?v=CUno7iGUmAo

Clause Learning (CDCL) :
- [Clause learning : CDCL](https://cse442-17f.github.io/Conflict-Driven-Clause-Learning/)
- [Handbook of SAT](https://www.ics.uci.edu/~dechter/courses/ics-275a/winter-2016/readings/SATHandbook-CDCL.pdf)

Hyperproperties : 
- https://www.youtube.com/watch?v=vVMu6g2H50Q

Verification Corner Dafny : 
- https://www.youtube.com/channel/UCP2eLEql4tROYmIYm5mA27A/videos

Verification Corner Loop Invariants : 
- https://www.youtube.com/watch?v=spcfzbisBv4

UCLID5 :
- https://github.com/uclid-org/uclid/tree/master/tutorial
- https://cse.iitk.ac.in/users/spramod/papers/memocode18.pdf
- https://cse.iitk.ac.in/users/spramod/papers/ccs17.pdf

UCLID5 is based on Z3. Z3 Reference :
- https://theory.stanford.edu/~nikolaj/programmingz3.html

Paper - 1 : Dynamic Taint Analysis.
- https://users.ece.cmu.edu/~aavgerin/papers/Oakland10.pdf

Book : The Calculus of Computation. (Bradley & Manna)
- Slides : https://lara.epfl.ch/w/_media/sav15:calculus-of-computation-slides.pdf

Non-Interference :
- http://csl.sri.com/papers/csl-92-2/csl-92-2.pdf

Hyperproperties :
- https://eprint.iacr.org/2019/310
- https://www.cs.cornell.edu/fbs/publications/Hyperproperties.pdf
- https://arxiv.org/pdf/1905.13517.pdf

Probabilistic Symbolic Execution : 
- [Probabilistic Symbolic Execution](https://www.cs.cmu.edu/~emc/2014/speakers/CorinaPasareanuEMC14.pdf)
- [PSE Paper](https://dl.acm.org/doi/10.1145/2338965.2336773)

Concepts/Topics : 
- [Universal Quantification](https://en.wikipedia.org/wiki/Universal_quantification)
- [More on Hoare Logic](https://www.cs.cmu.edu/~aldrich/courses/654-sp07/slides/7-hoare.pdf)
- [Abstract Interpretation](https://www.researchgate.net/publication/220997507_Abstract_Interpretation_A_Unified_Lattice_Model_for_Static_Analysis_of_Programs_by_Construction_or_Approximation_of_Fixpoints)
