We thank the reviewers for their kind and thoughtful remarks, and will
respond briefly to some of the larger concerns.


## Size / Diversity of Training Corpus [A,D]

It may have been unclear in the text, but our corpus was drawn from
student solutions to **3 homework sets**, not 3 programs. Each homework
set consisted of many individual programs. In total our corpus contains
solutions to **23 distinct programs** that cover a broad range of FP idioms.

We will expand Section 4.1 (Methodology) to clearly list the total
number of programs students wrote in addition to the number of
assignments they completed.


## Generalizing NATE Models to Other Datasets [A,D]

We may not have adequately clarified our claims regarding the
generalizability of our models. As reviewers A and D point out, it is
well known that ML models suffer from dataset bias; we cannot claim (nor
do we) that our models generalize to all OCaml type errors. We discuss
this, and other threats to validity, in Section 4.5.

We claim that our models generalize with respect to type errors that
occur in our undergraduate course. We substantiate this claim by
training a model on the student programs from one instance of the course
and testing it on programs from another instance (see Section 4.2).

We also claim that our models are **easy to train**, i.e. they can be
trained on programs from a single instance of a course with around 50
participants. Thus, even if our models do not generalize to other OCaml
courses (which we have not tested and do not claim), the barrier to
producing a course-specific model is actually quite low (see the final
paragraph of the conclusion).

We will update the text in the Introduction and Evaluation to clarify
the scope of our claim to generality.


## Determination of "Fixed" Programs [B]

Reviewer B is correct that our determination of the **first** type-correct
program as the fix is a threat to validity (see Section 4.5 for
others). We could also train a model using the final type-correct
program as the fix, or perhaps using a (set of) known-correct
solution(s) as the fix, both of these choices could lead to different
results.

The corpus is available at http://tinyurl.com/y9pzvcp7 (**NOT ANONYMOUS**);
we will advertise this in the text. It contains the full series of
student interactions and would admit Reviewer B's proposed analysis of
how different the initial and final solutions are.


## Scaling to Larger Programs [C]

The primary concern with respect to scaling to larger programs is
probably the size of the type error slice. The slice greatly prunes the
set of potential blame locations (by a factor of 7 in our dataset). As
the slice increases there will be more room for the classifier to
misrank expressions. This concern also applies to SherrLoc and Mycroft
as they rely (implicitly or explicitly) on error slices, and may be
similarly affected.


