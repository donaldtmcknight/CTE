## Resubmission

This is a resubmission. In this version I have addressed the issues raised
during the CRAN incoming checks.

## CRAN comments

### Issue 1

NOTE:

Possibly misspelled words in DESCRIPTION:
  CTE (9:14, 9:98)
  Temeprature (9:74)

Unknown, possibly misspelled, fields in DESCRIPTION:
  'Organization'

No Authors@R field in DESCRIPTION.

**Response:**  
Corrected spelling errors in the DESCRIPTION file and reformatted the
Description field so it does not start with the package name.  
Removed the non-standard `Organization` field.  
Added an `Authors@R` field with the appropriate author and maintainer
information.

---

### Issue 2

NOTE regarding license declaration:

License components with restrictions and base license permitting such:
  GPL (>= 3) + file LICENSE

**Response:**  
Removed the LICENSE file containing the full GPL text and updated the
DESCRIPTION file to use the standard `License: GPL (>= 3)` declaration.

---

### Issue 3

NOTE:
Non-standard file/directory found at top level:
  'cran-comments.md'

**Response:**  
The file `cran-comments.md` is included intentionally to document responses
to CRAN review comments for this resubmission.
