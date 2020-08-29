Groove2Groove MIDI Dataset v1.0.0
==================================

Created by Ondrej Cifka  
LTCI, Telecom Paris, Institut Polytechnique de Paris

For more information, visit <https://groove2groove.telecom-paris.fr>.

This dataset contains synthetic accompaniments generated as described in the paper
"Groove2Groove: One-Shot Music Style Transfer with Supervision from Synthetic Data",
<https://doi.org/10.1109/TASLP.2020.3019642>.

This work is licensed under the Creative Commons Attribution-NonCommercial 4.0 International
License (CC BY-NC 4.0) <http://creativecommons.org/licenses/by-nc/4.0/>.

If you use the data in your research, please reference the paper:
 
    @article{groove2groove,
      author={Ond\v{r}ej C\'{i}fka and Umut \c{S}im\c{s}ekli and Ga\"el Richard},
      journal={IEEE/ACM Transactions on Audio, Speech, and Language Processing}, 
      title={Groove2Groove: One-Shot Music Style Transfer with Supervision from Synthetic Data}, 
      year={2020},
      doi={10.1109/TASLP.2020.3019642},
      url={https://doi.org/10.1109/TASLP.2020.3019642}
    }

## Data description

### MIDI files
The `midi` directory contains one subdirectory for each part of the dataset:
- `train` contains 5744 MIDI files in 2872 styles (exactly 2 files per style). Each file contains
  252 measures (the Band-in-a-Box maximum) following a 2 measure count-in.
- `val` and `test` each contain 1200 files in 40 styles (exactly 30 files per style, 16 bars per
  file after the count-in). The sets of styles are disjoint from each other and from those in
  `train`.
- `itest` is generated from the same chord charts as `test`, but in 40 styles from the training set.

Each style is actually one of two substyles (meant for the A and B sections of a song) of a
Band-in-a-Box style. The two substyles are always in the same part of the dataset. More information
about the styles can be found in the file `styles.tsv`. The chord charts used to generate these
MIDI files are described in the next section.

Each set of MIDI files is provided in two versions, each in its own subdirectory:
- `raw` – the raw output of Band-in-a-Box.
- `fixed` – non-empty files only, fixed so that each track has the correct program number.
The filenames have the form `{chart_name}.{style}_{substyle}.mid`. The `charts_styles_substyles.tsv`
file lists the chord chart filenames along with the styles and substyles applied to each chord
chart.

### Chord charts
The `charts` directory is structured similarly to the `midi` directory and contains the
corresponding chord charts. Each set of chord charts is provided in the ABC format (in the `abc`
subdirectory) and the Band-in-a-Box (MGU) format (in the `mgu` subdirectory). The MGU files are all
in the default "ZZJAZZ" style. To enable generation in the A and B substyles, we provide each MGU
file in an A and B variant where the entire chord chart is just one long A or B section,
respectively.

The chord charts were generated using language models trained on the iRb corpus (see the paper
for further details). 5/6 of the chord charts are in major keys, the other 1/6 in minor keys
(approximately following the distribution of keys in iRb).
