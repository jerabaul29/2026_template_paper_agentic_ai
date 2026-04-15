# Guidelines for the LaTex article writing

These are the guidelines for how the LaTex manuscript should be written. The LaTex manuscript worked on is a scientific paper to be published in peer reviewed literature, and should follow the corresponding writing style. The human in the loop / person behind the prompts (me) is a scientific expert who is knowledgeable about the field. If you disagree with the human (me) about the science / content of the paper, you should start discussing with the human until you are sure we understand each other. Feel free to push back on me, but if I say I am sure / I insist on a scientific point after discussing together, trust me, I know what I talk about when I say so after a discussion.

The goal here is that you, the AI, write a manuscript that follows what I, the human, want. I know the manuscript I want to write and what it should contain, but writing is time consuming so you should expedite the scientific writing for me, following my instructions. I am an expert with PhD level background in physics / applied mathematics / computer science / machine learning / electronics / oceanography, take this into account in our discussions - be as smart as you can, you dont need to explain me simple things if I dont ask you.

The main task is to help going from bullet-point-like summary to proper text. Make sure that the bullet point materials are turned into consistent paragraphs, good quality text, that there are transitions between these, etc. Also double check that the content is correct and makes sense and come with comments and suggestions if relevant.

## General organization of the repository

- The manuscript comes in several consecutive main versions. Each of these is in an own folder with `v`, such as `v1`, `v2`, etc. For example `v2` starts with a copy of `v1`, with further changes gradually applied. Only start a new version if the user asks for it, otherwise edit the highest version. Each version is self contained - for example, copy all the figures (`figs` folder).
- The root of the repository contains the general instructions.
- By default when asked to do some work, do so in the latest `v` folder (the one with the highest version name).

## General organization within a LaTex version folder

- The figures should all be in a `figs` folder, flat folder.
- The whole `.tex` content is in a single `main.tex` file.
- The whole references set is in a `references.bib` file.

## Guidelines for the LaTex writing

- Have equations on their own line follow the LaTex pattern (this is just to illustrate with an example; see the `begin` kind used and the `\label`):

```latex
\begin{equation}
    \omega^2 = \frac{gk + Bk^5}{\coth(kH)}.
    \label{eqn:reduced_disprel}
\end{equation}
```

- Have equations or formula within a line be part of the text and inserted through `$` at the start and end (this is just to illustrate with an example):

```latex
The phase shift of the cross-spectral density between sensors 1 and 2, $\Delta \phi_{1, 2}(f) = \mathrm{phase}(P_{1,2}(f))$, is calculated at the frequencies for which coherence about the threshold is observed.
```

- Have figures follow the pattern (notice the `begin` kind used, `label`, `caption`, and `includegraphics` patterns, this is just to illustrate with an example):

```latex
\begin{figure}
    \centering
    \includegraphics[width=0.49\linewidth]{figs/t15_PSD_Tempelfjorden_2015_segment_2.png}
    \includegraphics[width=0.49\linewidth]{figs/t15_PSD_Tempelfjorden_2015_segment_16.png}
    \caption{PSDs obtained from the 3 VN100 IMUs that are part of the T15 dataset. Left: PSDs from the segment number 2. A clear high-frequency peak is observed in IMUs VN1002 and VN1007 (farther in the ice), but not in VN1005 (closest to the open water). The high-frequency peak is relatively broad. Right: PSDs from the segment number 16. No high-frequency peak is observed.}
    \label{fig:t15_psd}
\end{figure}
```

- Use `citet` and `citep` as relevant (this is just to illustrate with an example):

```latex
Bound waves, which canonical example is the higher-order components of the Stokes solution \citep{lamb1924hydrodynamics}, are perturbations to the first-order wave solution that are present as the higher-order consequence of nonlinear terms.
```

```latex
For example, \citet{zhao2017gap} suggests that arrays of adjacent floating bodies (in our case, ice floes) can lead to nonlinear resonance and create high-frequency peaks in PSDs.
```

- All references should come from the `.bib` file. The `.bib` file should be exactly correct - only use exact references that exist, do not make up or hallucinate references you are not fully sure of. Only edit the `.bib` file if asked by the user, otherwise, let the user edit it to ensure correctness. References correctness is very important for the integrity of the manuscript.

- The user may write `INSTRUCTIONS.md` files in each `v` of the manuscript; make sure the manuscript follows and implement these instructions. These files may contain, for example, the structure and content that the user wants to see in the manuscript.

- If there are discussions with the user that change the content of the manuscript, make sure to keep the `INSTRUCTIONS.md` up to date - the `INSTRUCTIONS.md` and actual `main.tex` in the same `v` folder should not drift away from each other.

- The whole project is under git version control; when asked to do a task, check `git diff` to see if any guidelines or instructions or other have been updated, and make sure to follow these.

- The manuscript should be compiled with LaTex; each `v` folder contains a `compile.sh` script that runs the full pdflatex + bibtex cycle and logs all output to `compile.log` (overwritten on each run). Use it from inside the relevant `v` folder:

```bash
cd v1  # or whichever version you are working on
bash compile.sh
```

The script exits with a non-zero code on error. Always check `compile.log` for warnings and errors after compilation.

- When compiling or running any command to build the document, make sure there are no errors in the logs / check the logs, if there are some iterate on the source until things compile.

- When starting fresh from the template or creating a new `v` folder, check that no stale build artifacts (`.aux`, `.bbl`, `.blg`, `.log`, `.out`, `.pdf`) are present from a previous paper. If any are found, remove them before compiling so they do not mislead or produce a mismatched output.

- When asked to generate a latex diff:
  - copy the `.tex` file from the before-last/newest `v` folder (for example, if the highest version is `v3`, this would be `v2`) into the last/newest `v` folder (this would be `v3`), under the name `old.tex`
  - use latexdiff to generate a diff and compile it manually (note: `compile.sh` targets `main.tex`; for the diff use the raw commands):

  ```bash
  latexdiff old.tex main.tex > diff.tex
  timeout 20 pdflatex -interaction=nonstopmode -halt-on-error diff.tex
  timeout 20 bibtex diff.aux
  timeout 20 pdflatex -interaction=nonstopmode -halt-on-error diff.tex
  timeout 20 pdflatex -interaction=nonstopmode -halt-on-error diff.tex
  ```

- Make sure the captions match the figures.

- Make sure what is written is correct and real science, not hallucination. Correctness is important. If in doubt, especially about the science, ask the human expert.

- You can and should push back / discuss points where you think the human (me writing this) may be wrong, but if after discussing I say I am sure, you should do as I say - I am an expert in the field. Keep a list of discussion points into the `TRUTHS.md` file at the root of the repo for when you were unsure but we had a discussion and I told you what to do.

- If anything is unclear, either instructions, structure, or so, start discussing with the human (me). Similar if you see possible improvements.

- Keep notes in the `AI_REFLECTIONS.md` file if you make important reflections about the manuscript or the science that you want to remember, back of the envelope calculations, etc.

- Be straight and to the point, dont be overly verbose, dont explain simple concepts etc: the human (me) is an expert with lots of experience on what is being written about.

- If you see possible improvements to anything, both the manuscript but also the "meta" stuff (like the `.md` files that you get from me), let me know / start a discussion.

- I may put related papers in the `related_papers` folder; these may be either previous papers from me you should draw inspiration from, or related papers that should be taken into account when writing the new paper, or whatever I say in the detailed `INSTRUCTIONS.md`.

- After any change, before going back to the user, make sure to ensure consistency of the project - in particular, files in a given `v` folder should not drift apart from each others.

## General writing guidelines

Follow the guidelines from the `guidelines_writing_papers` folder (github submodule).
