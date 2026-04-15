# 2026_template_paper_agentic_ai

A template for getting help from Agentic AI to write papers. Works typically well with CLI Agentic AI tools like copilot CLI or Claude Code.

Start by asking the AI to read the `AGENT.md` and all related files.

The key idea is to have the human prepare the main ideas and outlines etc as bullet points, and let the AI Agent turn these into well-polished academic style text.

## Repository layout

```
.
├── AGENT.md                    # Main instructions for the AI agent (start here)
├── TRUTHS.md                   # Scientific truths established through human–AI discussion
├── AI_REFLECTIONS.md           # Notable AI reflections, back-of-envelope calculations, etc.
├── guidelines_writing_papers/  # Git submodule: writing guidelines the AI should follow
├── related_papers/             # Papers to draw from (previous work, related art, etc.)
└── v1/                         # First major version of the manuscript (self-contained)
    ├── figs/                   # All figures (flat folder)
    ├── arxiv.sty               # ArXiv style file
    ├── main.tex                # Full LaTeX manuscript
    ├── references.bib          # All references; export from a reference manager or hand-edit — the AI should not edit this without being asked
    ├── compile.sh              # Compile script (logs to compile.log, overwritten each run)
    └── INSTRUCTIONS.md         # Human-written content spec / bullet-point outline for this version
```

Each new major version (`v2`, `v3`, …) is a self-contained copy of the previous one with further changes applied. Only create a new version when explicitly asked.
