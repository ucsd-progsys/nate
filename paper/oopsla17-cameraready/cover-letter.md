

Clarify focus on helping novice programmers
-------------------------------------------

We have updated the title as suggested. It now reads:

"Learning to Blame: Localizing Novice Type Errors with Data-Driven Diagnosis"


Do not claim we can train on one problem and test on another
------------------------------------------------------------

We did not intend to claim this and apologize for the confusion. Indeed,
it is an unrealistic goal to train a model on programs solving a single
problem and generalize to programs solving an unrelated problem. A
fundamental assumption of machine learning is that the testing set comes
from the same underlying distribution of samples as the training set. In
our domain this would correspond to unseen *type-errors* that occur in
the same (or similar) programs.

We must confess that, after a careful re-reading of our paper, we cannot
find an instance of this claim being made. Nonetheless, we have made the
following edits to clarify our claims wrt. the generality of our models:

- p.3, paragraph beginning "Our third contribution". We have added the
  following sentence explicitly stating our claim to generality.
  
  "We find that Nate’s models generalize well between instances of the
  same undergraduate course, outperforming the state of the art by at
  least 16 percentage points at predicting the source of a type error."

- p.11, paragraph beginning "1. Data Beats Algorithms". We have prefixed
  the second sentence with
  
  "When trained on student errors from one instance of an undergraduate
  course and tested on another instance,"
  
  to clarify the evaluation methodology before presenting results, which
  the reader may not yet have the context to interpret correctly.

We would also note that the second paragraph of the conclusion (as
submitted previously) begins by questioning whether our models would
generalize to other programs.

If these changes are not sufficient and the reviewers have a specific
sentence or section that they believe claims our models can generalize
from a single program to others, we will happily revise that section
as well in the camera-ready.
