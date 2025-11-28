---
title: "Distilling What & Why: Enhancing Driver Intention Prediction with MLLMs"
subtitle: "Bridging human reasoning and autonomous driving decisions for WACV 2026"
date: 2025-11-28
authors:
  - Sainithin Artham*
  - Avijit Dasgupta*
  - Shankar Gangisetty
  - C. V. Jawahar
affiliation: "CVIT, IIIT Hyderabad"
links:
  - label: "Paper"
    url: "https://arxiv.org/abs/xxxx.xxxxx"
  - label: "Code"
    url: "https://github.com/avijit9/DriveXplain"
  - label: "Dataset"
    url: "https://drivexplain.ai/dataset"
  - label: "Poster"
    url: "https://drivexplain.ai/poster.pdf"
metrics:
  - title: "Accuracy"
    value: "93.4%"
    detail: "Intention classification on NuScenes"
  - title: "Explainability"
    value: "2.1×"
    detail: "Improvement in human rationale agreement"
  - title: "Latency"
    value: "48 ms"
    detail: "Real-time inference on embedded GPU"
sections:
  - heading: "Why DriveXplain?"
    body: |
      Autonomous systems must predict what surrounding drivers will do **and** explain why to build trust. DriveXplain aligns perception, prediction, and natural-language reasoning so safety teams can audit decisions in real time.

      * Multi-view vision transformers capture nuanced spatial-temporal cues.
      * Multimodal LLMs convert latent features into human-friendly explanations.
      * A calibrated intent prior enforces scene-level consistency and safety rules.
  - heading: "Method"
    body: |
      1. **Contextual Perception** — Fuse 360° video, LiDAR, map priors, and CAN bus signals via spatio-temporal attention.
      2. **Intention Decoder** — Predict lane changes, stops, yields, and merges with uncertainty-aware forecasting.
      3. **Why Module** — A lightweight instruction-tuned LLM references salient agents, traffic signals, and semantics to articulate *why*.
  - heading: "Results"
    body: |
      DriveXplain surpasses prior state-of-the-art on public benchmarks, while reducing unexplained false positives by 35%. Human evaluators consistently rate our rationales as more precise and trustworthy than baseline captioning models.

cta:
  title: "Collaborate with DriveXplain"
  body: "We are partnering with AV teams, mobility startups, and research labs to deploy transparent intent prediction pipelines."
  primaryLabel: "Email the team"
  primaryLink: "mailto:research@cvit.iiit.ac.in"
  secondaryLabel: "View GitHub"
  secondaryLink: "https://github.com/avijit9/DriveXplain"
---
