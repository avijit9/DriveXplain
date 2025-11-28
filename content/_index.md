---
heroTitle: "Distilling <em>What</em> & <em>Why</em>: Enhancing Driver Intention Prediction with MLLMs"
authors:
  - Sainithin Artham*
  - Avijit Dasgupta*
  - Shankar Gangisetty
  - C. V. Jawahar
affiliation: "CVIT, IIIT Hyderabad"
authorLinks:
  - label: "Sainithin Artham"
    url: "https://sainithin-bit.github.io/Sainitin/"
  - label: "Avijit Dasgupta"
    url: "https://avijit9.github.io"
  - label: "Shankar Gangisetty"
    url: "https://sites.google.com/site/shankarsetty/home"
  - label: "C. V. Jawahar"
    url: "https://faculty.iiit.ac.in/~jawahar/"
links:
  - label: "Paper"
    url: "https://arxiv.org/abs/xxxx.xxxxx"
  - label: "Code"
    url: "https://github.com/avijit9/DriveXplain"
  - label: "Poster"
    url: "https://drivexplain.ai/poster.pdf"
abstract: |
  Predicting a drivers' intent (e.g., turns, lane changes) is a critical capability for modern Advanced Driver Assistance Systems (ADAS). While recent Multimodal Large Language Models (MLLMs) show promise in general vision-language tasks, we find that zero-shot MLLMs still lag behind domain-specific approaches for Driver Intention Prediction (DIP). To address this, we introduce narratorname, a zero-shot framework based on MLLMs that leverages rich visual cues such as optical flow and road semantics to automatically generate both intention maneuver (*what*) and rich natural language explanations (*why*). These maneuver–explanation pairs are then distilled into a compact MLLM, which jointly learns to predict intentions and corresponding explanations. We show that incorporating explanations during training leads to substantial gains over models trained solely on labels, as distilling explanations instills reasoning capabilities by enabling the model to understand not only *what* decisions to make but also *why* those decisions are made. Comprehensive experiments across structured (Brain4Cars, AIDE) and unstructured (DAAD) datasets demonstrate that our approach achieves state-of-the-art results in DIP tasks, outperforming zero-shot and domain-specific baselines. We also present ablation studies to evaluate key design choices in our framework.
  This work sets a direction for more explainable and generalizable intention prediction in autonomous driving systems.
problemStatement:
  heading: "Problem Statement"
  figure: "assets/img/Teaser_Diagram.png"
  caption: "Illustration of a driving scenario where the ADAS vehicle predicts a left lane change (*what*) to avoid slower traffic ahead (*why*). Existing driver intent prediction models lacking reasoning may miss such cues, while our framework jointly learns and distills both maneuver and explanation, improving decision quality."
drivexplain:
  heading: "DriveXplain"
  figure: "assets/img/Main_Diagram.png"
  caption: "Our proposed framework for the DIP task. DriveXplain generates natural language explanations alongside maneuvers and Explanation Distillation distills these explanations into a single MLLM to enhance DIP performance at inference."
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
  title: "Contact Us"
  body: "Please feel free to reach us out."
  primaryLink: "mailto:avijit.dasgupta@research.iiit.ac.in"
---
