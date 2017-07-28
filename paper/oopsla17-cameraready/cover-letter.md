We have made the following edits to our paper to address the committee's
requests.

Clarify focus on helping novice programmers
-------------------------------------------

We have updated the title as suggested. It now reads:

"Learning to Blame: Localizing Novice Type Errors with Data-Driven Diagnosis"


Do not claim we can train on one problem and test on another
------------------------------------------------------------

We did not intend to claim this -- and cannot find any instance of such
a claim in the paper -- but have nonetheless made the following changes 
to clarify our claims with respect to the generality of our models:

- p.3, paragraph beginning "Our third contribution": We have added the
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

We would also note that the second paragraph of the conclusion, 
unchanged from the submission version, begins by explicitly 
questioning whether our models would generalize to other programs.

    "As with other forms of machine learning, a key concern is 
     that of data-set bias: are Nate’s models specific to our 
     data set, would they fail on other programs?"

If these changes are not sufficient and the reviewers have a specific
sentence or section that they believe claims our models can generalize
from a single program to others, we will happily revise that section
as well in the camera-ready.


Additional Changes
------------------

Since the initial submission we have completed a user study in which
we compared the efficacy of our blame assignments against SherrLoc's.
We describe the study and results in the new section "4.6 Blame Utility".
