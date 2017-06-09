We thank the reviewers for their kind and thoughtful remarks, and will
respond briefly to some of the larger concerns.


1. Size / Diversity of Training Corpus [A,D]

It may have been unclear in the text, but our corpus was drawn from
student solutions to *3 homework sets*, not 3 programs. Each homework
set consisted of many individual programs. In total our corpus contains
solutions to *23 distinct programs* that cover a broad range of FP
idioms, e.g. (tail) recursive functions, higher-order functions,
expression evaluators, etc.

We will expand Section 4.1 (Methodology) to clearly list the total
number of programs students wrote in addition to the number of
assignments they completed.


2. Generalizing NATE Models to Other Datasets [A,D]

We may not have adequately clarified our claims regarding the
generalizability of our models. As reviewers A and D point out, it is
well known that ML models suffer from dataset bias; we cannot claim (nor
do we) that our models generalize to all OCaml type errors. 

Rather, we claim that our models generalize with respect to type errors
that occur in our undergraduate course. We substantiate this claim by
training a model on the student programs from one instance of the course
and testing it on programs from another instance (see Section 4.2).

Second, we claim that our models are *easy to train*, i.e. they can be
trained on programs from a single instance of a course with around 50
participants. Thus, even if our models do not generalize to other OCaml
courses (which we have not tested and do not claim), the barrier to
producing a course-specific model is actually quite low (see the final
paragraph of the conclusion).

We will update the text in the Introduction and Evaluation to clarify
the scope of our claim to generality.


3. Supported Fragment of OCaml [B]

Our restriction to OCaml's functional core is simply due to the nature
of the programs in our corpus. We do not teach references, classes,
modules, etc., and thus have no data to train or evaluate on. We do not
anticipate that these additional language features would be difficult to
support, as our features are simple queries over the typed syntax tree.

As we mention in Section 5, however, supporting the unbounded set of
user-defined types in our approach may be difficult. Briefly, the issue
is that we create a new feature for each data- and type-constructor,
so models will be at a disadvantage when confronted with unseen types.


4. Scaling to Larger Programs [C]

The primary concern with respect to scaling to larger programs is
probably the size of the type error slice. The slice greatly prunes the
set of possible blame locations (by a factor of 7 in our dataset). As
the slice increases there will be more room for the classifier to
misrank expressions.

This concern applies to the state-of-the-art SherrLoc and Mycroft as
well, as they also rely implicitly or explicitly on type error slices.
It may also be mitigated by the fact that larger codebases tend to
provide explicit type signatures for top-level functions, thus confining
error slices to single definitions.


5. Determination of "Fixed" Programs [B]

Reviewer B is correct that our determination of the *first* type-correct
program as the fix is a threat to validity, we discuss this and other
threats in Section 4.5. We could also train a model using the final
type-correct program as the fix, or perhaps using a (set of)
known-correct solution(s) as the fix, both of these choices could lead
to different results.

We have made the full corpus available at http://tinyurl.com/y9pzvcp7
(WARNING: will reveal author identity) and will advertise this in the
text. The corpus contains the full series of student interactions with
OCaml and would admit Reviewer B's proposed analysis of how different
the initial and final solutions are, though we have not attempted it.
