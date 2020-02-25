;;;; srfi-97.lisp

(cl:in-package "https://github.com/g000001/srfi-97#internals")


(defun srfi-library-name->asdf-system-name (name)
  (destructuring-bind (srfi num &optional name &rest rest)
                      name
    (declare (ignore srfi name rest))
    (let ((num (parse-integer (string num))))
      (values (intern (format nil "SRFI-~A" num) :keyword)) )))


(defmethod asdf:find-system ((name cons) &optional (error-p t))
  (cond ((string= :srfi (car name))
         (call-next-method (srfi-library-name->asdf-system-name name)
                           error-p ))
        (T (call-next-method)) ))


(defun srfiload (name)
  (asdf:oos 'asdf:load-op (asdf:find-system name)) )


(defvar *included-srfis*
  '((1     lists   "List Library")
    (2     and-let*
     "AND-LET*: an AND with local bindings, a guarded LET* special form" )
    (5     let     "A compatible let form with signatures and rest arguments")
    (6     basic-string-ports      "Basic String Ports")
    (8     receive "receive: Binding to multiple values")
    (9     records "Defining Record Types")
    (11    let-values      "Syntax for receiving multiple values")
    (13    strings "String Libraries")
    (14    char-sets       "Character-Set Library")
    (16    case-lambda     "Syntax for procedures of variable arity")
    (17    generalized-set!        "Generalized set!")
    (18    multithreading  "Multithreading support")
    (19    time    "Time Data Types and Procedures")
    (21    real-time-multithreading        "Real-time multithreading support")
    (23    error   "Error reporting mechanism")
    (25    multi-dimensional-arrays        "Multi-dimensional Array Primitives")
    (26    cut     "Notation for Specializing Parameters without Currying")
    (27    random-bits     "Sources of Random Bits")
    (28    basic-format-strings    "Basic Format Strings")
    (29    localization    "Localization")
    (31    rec     "A special form for recursive evaluation")
    (38    with-shared-structure
     "External Representation for Data With Shared Structure" )
    (39    parameters      "Parameter objects")
    (41    (streams (streams primitive) (streams derived)) "Streams")
    (42    eager-comprehensions    "Eager Comprehensions")
    (43    vectors "Vector Library")
    (44    collections     "Collections")
    (45    lazy    "Primitives for expressing iterative lazy algorithms")
    (46    syntax-rules    "Basic Syntax-rules Extensions")
    (47    arrays  "Array")
    (48    intermediate-format-strings     "Intermediate Format Strings")
    (51    rest-values     "Handling rest list")
    (54    cat     "Formatting")
    (57    records "Records")
    (59    vicinities      "Vicinity")
    (60    integer-bits    "Integers as Bits")
    (61    cond    "A more general cond clause")
    (63    arrays  "Homogeneous and Heterogeneous Arrays")
    (64    testing "A Scheme API for test suites")
    (66    octet-vectors   "Octet Vectors")
    (67    compare-procedures      "Compare Procedures")
    (69    basic-hash-tables       "Basic hash tables")
    (71    let     "LET-syntax for multiple values")
    (74    blobs   "Octet-Addressed Binary Blocks")
    (78    lightweight-testing     "Lightweight testing")
    (86    mu-and-nu "MU and NU simulating VALUES & CALL-WITH-VALUES, and their related LET-syntax")
    (87    case    "=> in case clauses")
    (95    sorting-and-merging     "Sorting and Merging") ))


(defvar *omitted-srfis*
  '((0	"Feature-based conditional expansion construct	Modifies semantics of top-level programs.")
    (4	"Homogeneous numeric vector datatypes	Modifies lexical syntax.")
    (7	"Feature-based program configuration language	Defines a configuration language distinct from Scheme.")
    (10	"#, external form	Modifies lexical syntax.")
    (22	"Running Scheme Scripts on Unix	Does not specify a library.")
    (30	"Nested Multi-line Comments	Modifies lexical syntax (subsumed by R6RS).")
    (34	"Exception Handling for Programs	Subsumed by R6RS.")
    (36	"I/O Conditions	Subsumed by R6RS.")
    (37	"args-fold: a program argument processor	Does not specify a library.")
    (40	"A Library of Streams	Deprecated by SRFI 41, Streams.")
    (49	"Indentation-sensitive syntax	Modifies lexical syntax.")
    (55	"require-extension	Modifies semantics of top-level programs.")
    (58	"Array Notation	Modifies lexical syntax.")
    (62	"S-expression comments	Modifies lexical syntax (subsumed by R6RS).")
    (70	"Numbers	Modifies standard semantics for number system.")
    (72	"Hygienic macros	Modifies macro expansion semantics.")
    (88	"Keyword objects	Modifies lexical syntax.")
    (89	"Optional positional and named parameters	Modifies syntax and semantics of application, which cannot be provided by a library. Dependent on lexical syntax modification (SRFI 88).")
    (90	"Extensible hash table constructor	Dependent on lexical syntax modification (SRFI 88).")
    (94	"Type-Restricted Numerical Functions	Dependent on number system modification (SRFI 70).") ))


;;; *EOF*
