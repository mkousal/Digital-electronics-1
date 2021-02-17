# Lab 02 - Logic

## Truth table
| **Dec. equivalent** | **B[1:0]** | **A[1:0]** | **B is greater than A** | **B equals A** | **B is less than A** |
| :-: | :-: | :-: | :-: | :-: | :-: |
|-|**[d:c]**|**[b:a]**|-|-|-|
| 0 | 0 0 | 0 0 | 0 | 1 | 0 |
| 1 | 0 0 | 0 1 | 0 | 0 | 1 |
| 2 | 0 0 | 1 0 | 0 | 0 | 1 |
| 3 | 0 0 | 1 1 | 0 | 0 | 1 |
| 4 | 0 1 | 0 0 | 1 | 0 | 0 |
| 5 | 0 1 | 0 1 | 0 | 1 | 0 |
| 6 | 0 1 | 1 0 | 0 | 0 | 1 |
| 7 | 0 1 | 1 1 | 0 | 0 | 1 |
| 8 | 1 0 | 0 0 | 1 | 0 | 0 |
| 9 | 1 0 | 0 1 | 1 | 0 | 0 |
| 10 | 1 0 | 1 0 | 0 | 1 | 0 |
| 11 | 1 0 | 1 1 | 0 | 0 | 1 |
| 12 | 1 1 | 0 0 | 1 | 0 | 0 |
| 13 | 1 1 | 0 1 | 1 | 0 | 0 |
| 14 | 1 1 | 1 0 | 1 | 0 | 0 |
| 15 | 1 1 | 1 1 | 0 | 1 | 0 |

<br>

![equals\_SoP=\overline a\overline b\overline c\overline d + \overline d c \overline b a + d\overline c b \overline a + d c b a](img/equation01.svg)

![less\_ PoS=(d+c+b+a)\cdot (d+\overline c +b+a)\cdot (d+\overline c + b+\overline a)\cdot (\overline d +c+b+a)\cdot (\overline d +c+b+\overline a)\cdot (\overline d +c+\overline b +a)\cdot (\overline d + \overline c + b+a)\cdot (\overline d + \overline c + b + \overline a)\cdot (\overline d + \overline c + \overline b + a)\cdot (\overline d + \overline c + \overline b + \overline a)](img/equation02.svg)