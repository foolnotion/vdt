# The **vdt** mathematical library
**v**ectorise**d** ma**t**h
* A collection of **fast** and **inline** implementations of mathematical functions.
* The functions can be used in autovectorised loops.
* **Double and single precision** implementations are available.
* No overhead present, no intrinsics used.
* A scalar (`T(T)`) and array signature (`void(const unsigned int,T*,T*)`) are provided.

Born and developed at [CERN](www.cern.ch), it is used, among the others, by LHC experiments and the [Geant4](http://geant4.cern.ch/) simulation toolkit.


Much of the VDT code is inspired by the well known [Cephes](http://www.netlib.org/cephes) mathematical library.

### The vdt functions
All **vdt** functions live in the `vdt` namespace. Their names are structured as follows:
```cpp
vdt::fast_<function_name>[f][v]
```
Where:
* The function name is one of the list in the table below.
* The `f` letter stands for the single precision function (`float`).
* The `v` letter identifies the array function.
You may wonder, why prepending `fast_`? This is done to allow the user to decide where a fast and approximate implementation of the function is to be used. It is not always obvious where the accuracy can be reduced: all the flexibility is needed.

These are the available functions:

| Function | Scalar double precision | Scalar single precision | Array double precision | Array single precision |
| -------- | ----------------------- | ----------------------- | ---------------------- | ---------------------- |
| exponential | fast_exp | fast_expf | fast_expv | fast_expfv |
| sine | fast_sin | fast_sinf | fast_sinv | fast_sinfv |
| cosine | fast_cos | fast_cosf | fast_cosv | fast_cosfv |
| tangent | fast_tan | fast_tanf | fast_tanv | fast_tanfv |
| hyperbolic tangent | fast_tanh | fast_tanhf | fast_tanhv | fast_tanhfv |
| logarithm | fast_log | fast_logf | fast_logv | fast_logfv |
| arcsine | fast_asin | fast_asinf | fast_asinv | fast_asinfv |
| arccosine | fast_acos | fast_acosf | fast_acosv | fast_acosfv |
| arctangent | fast_atan | fast_atanf | fast_atanv | fast_atanfv |
| inverse square root (1/sqrt) | fast_isqrt | fast_isqrtf | fast_isqrtv | fast_isqrtfv |

## Basic Usage:

Make sure that `_USE_MATH_DEFINES` is defined before everything else (otherwise your code won't build on Windows).
```
#define _USE_MATH_DEFINES
#include <cmath>
#include <cstring>
#include "vdtMath.h"
#include "stdwrap.h"
```

## Related Documents:
   * A full characterisation of the accuracies please refer to this [presentation](http://indico.cern.ch/contributionDisplay.py?contribId=4&sessionId=9&confId=202688).

## Reference
If you want to cite vdt, please use your reference:
[D. Piparo, V.Innocente and T.Hauth 2014 J. Phys.: Conf. Ser. 513 052027 "Speeding up HEP experiment software with a library of fast and auto-vectorisable mathematical functions"](http://iopscience.iop.org/1742-6596/513/5/052027)

## Mailing List
The VDT projects has a mailing list: VDTlibrary-talk at cern ch, linked to an e-group with the same name.
The Infrastructure used is the one provided by CERN IT. If you don't have a CERN account, you can obtain an external one [https://simba3.web.cern.ch/simba3/SelfSubscription.aspx?groupName=your-e-group-name here].
Alternatively, feel free to contact Danilo Piparo (danilo_dot_piparo_at_cern_dot_ch).

## Licence
The VDT mathematical library is licenced under the LGPL3 licence

![LGPL3](https://svnweb.cern.ch/trac/vdt/raw-attachment/ticket/2/LGPL-3-Logo-mini.png)
