# ChromaDB Cloud-Native Cold Start Benchmark

This project provides a specialized framework for measuring the **cold start performance** of ChromaDB within a KVM-based virtualization layer. By moving away from high-level abstractions like Vagrant and using **Terraform + Libvirt**, we achieve granular control over the virtual hardware to simulate "serverless" cold start conditions accurately.

## 🎯 Project Goals
*   **Measure Latency:** Capture the delta between `virsh start` and ChromaDB API availability.
*   **Resource Analysis:** Evaluate how CPU/RAM allocation affects the initialization of Python heavy-lifters like `torch` and `onnxruntime`.
*   **Infrastructure as Code:** Maintain a strictly reproducible environment using HCL.

## 🛠 Tech Stack
*   **Orchestration:** Terraform (Provider: `dmacvicar/libvirt`)
*   **Virtualization:** KVM / QEMU
*   **Guest OS:** Debian 13 (Generic Cloud Image)
*   **Database:** ChromaDB
